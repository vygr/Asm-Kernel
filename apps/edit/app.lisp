;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")
(import "gui/lisp.inc")
(import "apps/edit/input.inc")
(import "lib/substr/substr.inc")
(import "lib/text/syntax.inc")
(import "apps/edit/find.inc")


;alt,ctl,cmd, and shift key codes.
(defq left_shift 0x400000E1 left_ctrl_key 0x400000E0 left_alt_key 0x400000E2 left_cmd_key 0x400000E3
	right_shift 0x400000E5 right_alt_key 0x400000E6  right_cmd_key 0x400000E7)

(structure '+event 0
	(byte 'close+ 'max+ 'min+ 'resize+ 'layout+ 'scroll+)
	(byte 'new+ 'save+ 'open+ 'run+ 'closeb+ 'prev+ 'next+ 'find+ 'colorise+)
	(byte 'cut+ 'copy+ 'paste+)
	(byte 'action+ 'find+ 'find_prev+ 'find_next+ 'clear_text+)
	(byte 'menu+ 'menu_click+)
	(byte 'close_tab+ 'tabbar+))

(structure '+mbox 0
	(byte 'task+ 'file+ 'dialog+ 'clip+))
;text structure
(structure '+text 0
	(byte 'index+ 'fpath+ 'title+ 'buffer+ 'position+))

(structure '+pos 0
	(byte 'ox+ 'oy+ 'cx+ 'cy+ 'sx+))

;select is a an array using the +mbox structure: task+ file+ modal+
(defq vdu_min_width 40 vdu_min_height 24 vdu_width 60 vdu_height 40 text_store (list) tmp_num 0
	current_text (list) home_dir (cat "apps/login/" *env_user* "/") picker_mbox nil  picker_mode nil 
	mbox_array (array (task-mailbox) (mail-alloc-mbox) (mail-alloc-mbox) (mail-alloc-mbox)) 
	find_list (list) find_index 0 tabbar (Flow) unsaved_buffers (list)  burger_open nil
	status_bar_msg "" tb_font (create-font "fonts/Entypo.ctf" 20) cmd_return ""
	cmd_menu_up nil syn (Syntax) colorise t dirty_vdu t display_buffer (list))

(ui-window window (:color +argb_grey2+)
	(ui-title-bar window_title "Edit" (0xea19 0xea1b 0xea1a) +event_close+)
	(ui-flow window_flow (:flow_flags +flow_down_fill+)
		(ui-flow toolbar (:color *env_toolbar_col* :flow_flags +flow_right_fill+)
			(ui-grid _ (:flow_flags +flow_flag_align_hleft+ :grid_width 4 :grid_height 1 :font tb_font)
				(each (lambda (c e)
					(component-connect (ui-button _ (:font *env_medium_toolbar_font* :text (num-to-utf8 c)
						:min_height 32 :min_width 32 :border 0)) e)) '(0xe999 0xea07 0xe9ea 0xe95e)
						(list +event_open+ +event_save+ +event_colorise+ +event_run+)))
			(ui-flow _ (:flow_flags (logior +flow_flag_align_vcenter+ +flow_right_fill+))
				(component-connect (ui-button srch (:border 0 :text (num-to-utf8 0xe9cd) 
					:font *env_small_toolbar_font* :color +argb_white+)) +event_find+)
				(ui-flow _ (:flow_flags +flow_left_fill+)
					(each (lambda (c e) 
						(component-connect (ui-button _ (:font *env_medium_toolbar_font*
							:text (num-to-utf8 c) :min_height 32 :min_width 32 :border 0)) e))
						'(0xe9d4 0xe952 0xe962 0xea08) (list +event_menu+ +event_paste+ +event_copy+ +event_cut+))
					(each (lambda (c e)
						(component-connect (ui-button clrtxt (:border 0 :text (num-to-utf8 c) 
							:font *env_small_toolbar_font* :color +argb_white+)) e))
						'(0xe913 0xe910 0xe988) (list +event_find_prev+ +event_find_next+ +event_clear_text+))
					(component-connect (ui-textfield mytextfield
						(:border 0 :color +argb_white+ :text "")) +event_action+))))
		(ui-flow tab_bar (:color *env_toolbar_col* :flow_flags +flow_left_fill+)
			(component-connect (ui-button close_buf (:border 0 :text (num-to-utf8 0xe94c) 
				:font tb_font)) +event_closeb+)
			(ui-flow tabbar_flow (:flow_flags +flow_right_fill+ :font *env_window_font*)
				(component-connect (ui-button _ (:border 0 :text (num-to-utf8 0xe94e) :font tb_font)) +event_new+)))
		(ui-flow status_bar (:color *env_toolbar_col* :flow_flags +flow_right_fill+)
			(ui-label sb_label (:font *env_body_font* :min_height 24 :text "Line XX, Column XX")))
		(ui-flow vdu_flow (:border 0 :flow_flags +flow_left_fill+)
			(component-connect (ui-slider slider 
				(:flow_flags +flow_down_fill+ :border 0)) +event_scroll+)
			(ui-vdu vdu (:vdu_width vdu_width :ink_color +argb_white+ :vdu_height vdu_height 
				:min_width vdu_width :min_height vdu_height :font *env_terminal_font*)))))

;display functions
(defmacro str-to-vdu-array (s &optional fg bg)
	`(apply array (map (# (+ (if ,bg (<< (canvas-from-argb32 ,bg 15) 48) 0)
		(if ,fg (<< (canvas-from-argb32 ,fg 15) 32) 0) (code %0))) ,s)))

(defun vdu-highlight (seq)
	(apply array (map (#(+ (<< (canvas-from-argb32 0xf96a6a6a 15) 48)
		 (logand %0 0xffffffffffff))) seq)))

;deals with arrays not strings.
(defun select-text (seq (fxy lxy))
	(bind '(fx fy lx ly) (sort-xy fxy lxy))
	(defq seq_front (slice 0 fy seq) seq_back (slice (inc ly) -1 seq) seq_sel (list))
	(each (lambda (ln)
		(defq line (elem ln seq) start 0 stop -1)
		(cond 
			((= ln fy ly) (push seq_sel (cat (slice 0 fx line)
					(vdu-highlight (slice fx lx line)) (slice lx -1 line))))
			((= ln fy) (push seq_sel (cat (slice 0 fx line)
					(vdu-highlight (slice fx -1 line)))))
			((= ln ly) (push seq_sel (cat (vdu-highlight (slice 0 lx line))
					(slice lx -1 line))))
			(t (push seq_sel (vdu-highlight line)))))
		(range fy (inc ly)))
	(cat seq_front seq_sel seq_back))

(defun vdu-colorise ()
	(bind '(ox oy cx cy sx) (get-position))
	(setq display_buffer (copy (get-buffer)))
	(cond
		(colorise
			(setq display_buffer (map (# (. syn :colorise %0)) display_buffer))
			(. syn :set_state :text))
		(t 	(setq display_buffer (map (#(str-to-vdu-array %0
					(get :ink_color vdu))) display_buffer))))
	(when (. text_select :find :selection_mode)
		(. text_select :insert :highlighted t)
		(defq fxy_lxy (. text_select :find :selection))
		(setq display_buffer (select-text display_buffer fxy_lxy)))
	(vdu-load vdu display_buffer ox oy cx cy))

(defun window-resize (w h)
	(bind '(_ fpath mytitle buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(setq vdu_width w vdu_height h)
	(update-status)
	(set vdu :vdu_width w :vdu_height h :min_width w :min_height h)
	(bind '(x y w h) (apply view-fit (cat (. window :get_pos) (. window :pref_size))))
	(. window :change_dirty x y w h)
	(vdu-colorise))

(defun window-layout (w h)
	(bind '(index fpath mytitle buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(set window_title :text fpath)
	(update-status)
	(setq vdu_width w vdu_height h)
	(set vdu :vdu_width w :vdu_height h :min_width w :min_height h)
	(bind '(x y w h) (cat (. vdu :get_pos) (view-pref-size vdu)))
	(set vdu :min_width vdu_min_width :min_height vdu_min_height)
	(view-change vdu x y w h)
	(def slider :maximum (max 0 (- (length buffer) vdu_height)) :portion vdu_height :value oy)
	(view-tabbar)
	(. window :layout)
	(view-dirty-all window)
	(vdu-colorise))

(defun update-status ()
	(set sb_label :text (cat "Line " (str (inc cy)) ", Column " (str (inc cx)) status_bar_msg))
	(. sb_label :layout)
	(. sb_label :dirty))

(defun view-tabbar ()
	(. tabbar :sub)
	(ui-tree tabbar (Grid) (:grid_width (length text_store) :grid_height 1)
		(each (lambda (e) (component-connect (ui-button b 
			(:text (elem +text_title+ (elem _ text_store)) :min_width 32 :border 1)) (+ +event_tabbar+ _)))
			(range 0 (length text_store))))
	(. (. tabbar_flow :add_child tabbar) :layout)
	(. tab_bar :layout)
	(. tab_bar  :dirty))

;macros for select-action-on-enter command and data parsing.
(defun split-cd (cd)
	(if (and (starts-with "(" cd) (ends-with ")" cd) (not (starts-with "(find:" cd)))
		(split (slice 1 -2 cd) ":") (list (cat "" cd))))

(defun select-action (a)
	(defq cmd (first (split-cd a)) data (second (split-cd a)) is_find nil is_dirty nil)
	(cond
		((eql cmd "save") (if (not data) (defq data (elem +text_fpath+ current_text)))
			(save-check data))
		((eql cmd "save-as") (if (not data) (on-save-file) (save-check data)))
		((eql cmd "save-all")
			(each (lambda (_) (save-check (elem +text_fpath+ _))) text_store))
		((eql cmd "new") (new-buffer))
		((eql cmd "close") (close-buffer (elem +text_index+ current_text)))
		((eql cmd "exit") 
			(each (lambda (_) (close-check (elem +text_index+ _))) text_store))
		((eql cmd "open") (if (not data) (on-open-file)
			(open-check data)))
		((eql cmd "prev") (prev-buffer (elem +text_index+ current_text))
			(setq status_bar_msg ""))
		((eql cmd "next") (next-buffer (elem +text_index+ current_text))
			(setq status_bar_msg ""))
		((eql "run" cmd) (when (not data) (defq data (elem +text_fpath+ current_text)))
			(open-child data kn_call_open)
			(set mytextfield :text data)
			(set mytextfield :cursor (length data)))
		((and (eql "find" cmd) data)
			(set mytextfield :text data)
			;cursor must be set to prevent slice errors.
			(set mytextfield :cursor (length data))
			(find-next) (. mytextfield :dirty) (setq is_find t))
		(t 	(find-next) (setq is_find t)))
		(window-layout vdu_width vdu_height)
		(unless is_find	(clear-text)))

(defun notification-position ()
	(bind '(tw th) (. window_title :get_size))
	(bind '(tbw tbh) (. toolbar :get_size))
	(bind '(x y w h) (. window :get_bounds))
	(defq brdr (get :border window) x (+ x brdr) y (+ y brdr th tbh))
	(list x y tbw th))

(defun open-check (fpath)
	(open-buffer fpath))

(defun save-check (fpath)
	(save-buffer fpath))

(defun close-check (index)
	(close-buffer index))
	
			
;sets the tab bar title to the last two parts of the path.
(defmacro title-set (fp) 
	`(let ((sfp (reverse (split ,fp "/")))) 
		(if (= (length sfp) 1) (first sfp) (cat (second sfp) "/" (first sfp)))))
;new, open, save, and close buffer functions		
(defun new-buffer (&optional nfpath)
	(defq index (length text_store) pos (list 0 0 0 0 0) 
		mytitle (cat "Untitled-" (str (setq tmp_num (inc tmp_num))))
		buffer (list " ") fpath (if nfpath nfpath (cat home_dir mytitle)))
	(when nfpath (save-buffer nfpath))
	(push text_store (list index fpath mytitle buffer pos))
	(move-to-buffer index))

(defun open-buffer (fpath)
	(defq i 0 index (length text_store) pos (list 0 0 0 0 0))
	(defq mytitle (title-set fpath) buffer (list))
	;ensure something to read on empty file.
	(if (eql nil (read-line (file-stream fpath))) (setq buffer (list ""))
	(each-line (lambda (_) (push buffer _)) (file-stream fpath)))
	(push text_store (list index fpath mytitle buffer pos))
	(move-to-buffer index))

(defun save-buffer (fpath)
	(defq save_buffer (join (elem +text_buffer+ current_text) (const (char 10))))
	(save save_buffer fpath)
	(remove-from-unsaved-buffers (elem +text_index+ current_text))
	(when (not (eql (elem +text_fpath+ current_text) fpath))
		(defq fp (elem-set +text_fpath+ current_text fpath))
		(elem-set +text_fpath+ current_text (title-set fp))))

(defun close-buffer (index)
	(defq i 0)
	(cond
		((<= (length text_store) 1)
			(setq id nil))
		((> (length text_store) 1)
			(setq text_store (erase text_store index (inc index)))
			(each (lambda (_) (elem-set +text_index+ _ i) (setq i (inc i))) text_store)
			(move-to-buffer (max (dec index) 0)))))

(defun add-to-unsaved-buffers (index)
	(unless (some (lambda (_) (= index _)) unsaved_buffers)
		(push unsaved_buffers (elem +text_index+ current_text))))

(defun remove-from-unsaved-buffers (index)
		(if (= (length unsaved_buffers) 1) (setq unsaved_buffers (list)))
			(some (lambda (x) (when (= x index) 
				(erase unsaved_buffers _ (inc x)))) unsaved_buffers) index)

(defun unsaved-buffer (index)
	(some (lambda (_) (if (= index _) t nil)) unsaved_buffers))

;buffer navigation functions
(defun move-to-buffer (index)
	(when (< -1 index (length text_store))
		(setq current_text (elem index text_store))))

(defun prev-buffer (index)
	(unless (= index 0) (setq index (dec index)))
	(setq current_text (elem index text_store)))
(defun next-buffer (index)
	(unless (= index (dec (length text_store)))
		(setq index (inc index)))
	(setq current_text (elem index text_store)))

(defun clear-text ()
	(setq find_list (list) find_index 0 status_bar_msg "")
	(set mytextfield :text "")
	;must set cursor to 0 when removing text from textfield.
	(set mytextfield :cursor 0)
	(window-layout vdu_width vdu_height))

(defun vdu-input (c)
	(bind '(index fpath mytitle buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(setq dirty_vdu t)
	(cond
		((or (= c 10) (= c 13))		(return) (setq cx 0) (add-to-unsaved-buffers index))
		((= c 8)					(backspace) (setq sx cx) (add-to-unsaved-buffers index))
		((or (= c 9) (<= 32 c 127))	(printable c) (setq sx cx) (add-to-unsaved-buffers index))
		((= c 0x40000050)			(left) (setq sx cx dirty_vdu nil))
		((= c 0x4000004f)			(right) (setq sx cx dirty_vdu nil))
		((= c 0x40000052)			(up) (setq dirty_vdu nil))
		((= c 0x40000051)			(down) (setq dirty_vdu nil))
		(t (setq dirty_vdu nil)))
	;only reload if a key actually alters vdu.
	(cursor-visible)
	(set-sticky)
	(set slider :value oy)
	(set-position ox (setq oy (get :value slider)) cx cy sx)
	(set-buffer buffer)
	(window-layout vdu_width vdu_height))

(defun on-save-file ()
	(if picker_mbox (mail-send "" picker_mbox))
	(mail-send (list (elem +mbox_file+ mbox_array) "Save Buffer..." "."  "")
			(setq picker_mode t picker_mbox 
					(open-child "apps/files/child.lisp" kn_call_open))))

(defun on-open-file ()
	(if picker_mbox (mail-send "" picker_mbox))
	(mail-send (list (elem +mbox_file+ mbox_array) "Load Buffer..." "." "")
				(setq picker_mode nil picker_mbox 
					(open-child "apps/files/child.lisp" kn_call_open))))

(defun main ()
	(defq id t find_textfield nil mouse_down nil selection (list) 
		+vdu_char_size+ (. vdu :char_size))
	;open buffers from pupa or open new buffer
	(if (empty? *env_edit_auto*) (new-buffer)
		(each (#(open-buffer %0)) *env_edit_auto*))
	(setq current_text (elem 0 text_store))
	(defq clipboard_mbox (str-to-num (second (split 
			(first (mail-enquire "CLIPBOARD_SERVICE")) ","))))
	(bind '(w h) (. (component-connect window +event_layout+) :pref_size))
	(bind '(x y w h) (view-locate w h))
	(gui-add (view-change window x y w h))
	(window-layout vdu_width vdu_height)
	(while id
		(defq msg (mail-read (elem (defq idx (mail-select mbox_array)) mbox_array)))
		(cond
		((= idx +mbox_file+)
			(mail-send "" picker_mbox)
			(setq picker_mbox nil)
			(cond
				((eql msg ""))
				(picker_mode
					;remove leading "./"
					(save-check (slice 2 -1 msg))
					(window-layout vdu_width vdu_height))
				(t	(open-check (slice 2 -1 msg))
					(window-layout vdu_width vdu_height))))
		((= idx +mbox_clip+)
			;clipboard makes no reply if it is empty.
			(on-paste msg))
		((= (setq id (get-long msg (const ev_msg_target_id))) +event_close+) 
			(setq id nil))
		((= id +event_new+) (new-buffer) (window-layout vdu_width vdu_height))
		((= id +event_save+) 
			(on-save-file))
		((= id +event_open+) 
			(on-open-file))
		((= id +event_run+) (open-child (elem +text_fpath+ current_text) kn_call_open))
		((= id +event_closeb+) (close-check (elem +text_index+ current_text))
			(window-layout vdu_width vdu_height))
		((= id +event_action+) (select-action (get :text mytextfield)))
		((= id +event_find+) 
			(if (> (length find_list) 0)
				(progn (setq find_list (list) find_index 0) (open-find)) (open-find)))
		((= id +event_find_prev+) (when (> (length find_list) 0) (find-prev)))
		((= id +event_find_next+) (when (> (length find_list) 0)(find-next)))
		((= id +event_clear_text+) (clear-text))
		((= id +event_copy+)
			(defq fxy_lxy (. text_select :find :selection))
			(. text_select :insert :copied (copy-text (get-buffer) fxy_lxy))
			(mail-send (list "PUT" (copy-text (get-buffer) fxy_lxy)) clipboard_mbox))
		((= id +event_cut+)
			(defq fxy_lxy (. text_select :find :selection))
			(. text_select :insert :copied (copy-text (get-buffer) fxy_lxy))
			(mail-send (list "PUT" (copy-text (get-buffer) fxy_lxy)) clipboard_mbox)
			(defq buffer (cut-text (get-buffer) fxy_lxy))
			(bind '(cx cy _ _) (sort-xy (first fxy_lxy) (second fxy_lxy)))
			(set-cursor cx cy)
			(set-buffer buffer) (vdu-colorise))
		((= id +event_paste+)
			(mail-send (list "GET" (elem +mbox_clip+ mbox_array)) clipboard_mbox))
		((= id +event_colorise+) (if colorise (setq colorise nil) (setq colorise t)) 
			(window-layout vdu_width vdu_height))
		((= id +event_prev+)
			(setq current_text (prev-buffer (elem +text_index+ current_text)))
			(window-layout vdu_width vdu_height))
		((= id +event_next+)
			(setq current_text (next-buffer (elem +text_index+ current_text)))
			(window-layout vdu_width vdu_height))
		((= id +event_layout+) (apply window-layout (. vdu :max_size)))
		((= id +event_min+) (window-resize 60 40))
		((= id +event_max+) (window-resize 120 48))
		((= id +event_scroll+)			
			(. slider :dirty)
			(defq buffer (elem +text_buffer+ current_text))
			(bind '(ox oy cx cy sx) (elem +text_position+ current_text))
			(elem-set +text_position+ current_text (list ox (setq oy (get :value slider)) cx cy sx))
			(vdu-colorise))
		((<= +event_tabbar+ id (+ +event_tabbar+ (length text_store)))
			(move-to-buffer (- id +event_tabbar+))
			(window-layout vdu_width vdu_height))
		((= id +event_menu+)
			(defq cmd_list '("new" "open" "save-as" "run" "close" "exit"))
			(bind '(x y w h) (notification-position))
			(bind '(wx wy ww wh) (apply view-locate (. window :pref_size)))
			;pos is the rightmost, uppermost position of the menu.
			(defq pos (list (+ x w) y))
			(mail-send (list (elem +mbox_task+ mbox_array) cmd_list pos :top_right)
					(defq menu_mbox (open-child "apps/edit/menu.lisp" kn_call_open)))
			(defq reply (mail-read (elem +mbox_task+ mbox_array)))
			(mail-send "" menu_mbox)
			(select-action (cat "(" reply ")")))
		((= id (component-get-id vdu))
			(vdu-keyboard msg)
			(vdu-mouse-down msg)
			(vdu-mouse-up msg))
		(t	(. window :event msg))))
	(if picker_mbox (mail-send "" picker_mbox))
	(. window :hide))