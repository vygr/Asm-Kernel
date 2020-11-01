;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")
(import "gui/lisp.inc")
(import "lib/substr/substr.inc")
(import "lib/syntax/syntax.inc")
(import "apps/edit/input.inc")
(import "apps/edit/find.inc")

;alt,ctl,cmd, and shift key codes.
(defq left_shift 0x400000E1 left_ctrl_key 0x400000E0 left_alt_key 0x400000E2 left_cmd_key 0x400000E3
	right_shift 0x400000E5 right_alt_key 0x400000E6  right_cmd_key 0x400000E7)

(structure '+event 0
	(byte 'close+ 'max+ 'min+ 'resize+ 'layout+ 'scroll+)
	(byte 'new+ 'save+ 'open+ 'run+ 'closeb+ 'prev+ 'next+ 'find+ 'colorise+)
	(byte 'find+ 'find_prev+ 'find_next+ 'clear_text+)
	(byte 'menu+ 'menu_click+)
	(byte 'close_tab+ 'tabbar+))

(structure '+mbox 0
	(byte 'task+ 'file+ 'modal+))
;text structure
(structure '+text 0
	(byte 'index+ 'fpath+ 'title+ 'buffer+ 'position+))
;select is a an array using the +mbox structure: task+ file+ modal+
(defq vdu_min_width 40 vdu_min_height 24 vdu_width 60 vdu_height 40 text_store (list) tmp_num 0
	current_text (list) home_dir (cat "apps/login/" *env_user* "/") picker_mbox nil  picker_mode nil 
	mbox_array (array (task-mailbox) (mail-alloc-mbox) (mail-alloc-mbox)) find_list (list) find_index 0 
	sb_line_col_message "" tabbar (create-flow) unsaved_buffers (list) burger_open nil
	tb_font (create-font "fonts/Entypo.ctf" 20) cmd_menu (create-window) cmd_menu_grid (create-grid)
	cmd_menu_up nil syn (syntax) colorise nil dirty_vdu t)

(ui-window window (:color +argb_grey8+ :border 4)
		(ui-title-bar window_title "Edit" (0xea19 0xea1b 0xea1a) +event_close+)
		(ui-flow window_flow (:flow_flags flow_down_fill)
			(ui-flow toolbar (:color *env_toolbar_col* :flow_flags flow_right_fill)
				(ui-grid _ (:flow_flags flow_flag_align_hleft :grid_width 4 :grid_height 1 :font tb_font)
					(each (lambda (c e)
						(component-connect (ui-button _ (:font *env_medium_toolbar_font* :text (num-to-utf8 c)
							:min_height 32 :min_width 32 :border 0)) e)) '(0xe999 0xea07 0xe9ea 0xe95e)
							(list +event_open+ +event_save+ +event_colorise+ +event_run+)))
				(ui-flow _ (:flow_flags (logior flow_flag_align_vcenter flow_right_fill))
					(component-connect (ui-button srch (:border 0 :text (num-to-utf8 0xe9cd) 
						:font *env_small_toolbar_font* :color +argb_white+)) +event_find+)
					(ui-flow _ (:flow_flags flow_left_fill)
						(component-connect (ui-button burger (:text (num-to-utf8 0xe9d4) 
							:min_width 32 :border 0 :font *env_small_toolbar_font*)) +event_menu+)
						(each (lambda (c e)
							(component-connect (ui-button clrtxt (:border 0 :text (num-to-utf8 c) 
								:font *env_small_toolbar_font* :color +argb_white+)) e))
							'(0xe913 0xe910 0xe988) (list +event_find_prev+ +event_find_next+ +event_clear_text+))
						(ui-textfield textfield (:border 0 :color +argb_white+ :text "")))))
			(ui-flow tab_bar (:color *env_toolbar_col* :flow_flags flow_left_fill)
				(component-connect (ui-button close_buf (:border 0 :text (num-to-utf8 0xe94c) 
					:font tb_font)) +event_closeb+)
				(ui-flow tabbar_flow (:flow_flags flow_right_fill :font *env_window_font*)
					(component-connect (ui-button _ (:border 0 :text (num-to-utf8 0xe94e) :font tb_font)) +event_new+)))
			(ui-flow status_bar (:color *env_toolbar_col* :flow_flags flow_right_fill)
				(ui-label sb_line_col (:font *env_body_font*  :text "Line XX, Column XX")))
			(ui-flow vdu_flow (:border 0 :flow_flags flow_left_fill)
				(component-connect (ui-slider slider 
					(:flow_flags flow_down_fill :border 0)) +event_scroll+)
				(ui-vdu vdu (:vdu_width vdu_width :vdu_height vdu_height 
					:min_width vdu_width :min_height vdu_height :font *env_terminal_font*)))))

(defun-bind vdu-colorise ()
	(cond 
		(colorise 
			(vdu-load vdu (map (# (. syn :colorise %0)) (copy buffer)) ox oy cx cy)
			(. syn :set_state :text))
		(t
			(vdu-load vdu buffer ox oy cx cy))))

(defun-bind window-resize (w h)
	(bind '(_ fpath title buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(setq vdu_width w vdu_height h)
	(set sb_line_col :text (cat "Line " (str (inc cy)) ", Column " (str (inc cx)) sb_line_col_message))
	(view-layout sb_line_col)
	(set vdu :vdu_width w :vdu_height h :min_width w :min_height h)
	(bind '(x y w h) (apply view-fit (cat (view-get-pos window) (view-pref-size window))))
	(view-change-dirty window x y w h)
	(vdu-colorise))

(defun-bind window-layout (w h)
	(bind '(index fpath title buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(set window_title :text fpath)
	(set sb_line_col :text (cat "Line " (str (inc cy)) ", Column " (str (inc cx)) sb_line_col_message))
	(view-layout sb_line_col)
	(setq vdu_width w vdu_height h)
	(set vdu :vdu_width w :vdu_height h :min_width w :min_height h)
	(bind '(x y w h) (cat (view-get-pos vdu) (view-pref-size vdu)))
	(set vdu :min_width vdu_min_width :min_height vdu_min_height)
	(view-change vdu x y w h)
	(def slider :maximum (max 0 (- (length buffer) vdu_height)) :portion vdu_height :value oy)
	(view-tabbar)
	(view-layout window)
	(view-dirty-all window)
	(vdu-colorise))

(defun-bind view-tabbar ()
	(view-sub tabbar)
	(ui-tree tabbar (create-grid) (:grid_width (length text_store) :grid_height 1)
		(each (lambda (e) (component-connect (ui-button b 
			(:text (elem +text_title+ (elem _ text_store)) :min_width 32 :border 1)) (+ +event_tabbar+ _)))
			(range 0 (length text_store))))
	(view-layout (view-add-child tabbar_flow tabbar))
	(view-layout tab_bar)
	(view-dirty tab_bar))

(defun-bind mouse-cursor (mouse_xy)
	(defq buffer (elem +text_buffer+ current_text))
	(bind '(ox oy cx cy sx) (elem +text_position+ current_text))
	(defq cursor_xy (list cx cy) +char_wh+ (vdu-char-size vdu) offset_xy (list ox oy))
	(setq cursor_xy (map + (map / mouse_xy +char_wh+) offset_xy)
		cx (elem 0 cursor_xy) cy (elem 1 cursor_xy))
	;prevent freezing on out of mouse out of bounds.
	(cond 
		((>= cy (length buffer)) (setq cy (dec (length buffer))))
		((< cy 0) (setq cy 0)))
	(cond 
		((> cx (length (elem cy buffer))) (setq cx (length (elem cy buffer))))
		((< cx 0) (setq cx 0 sx 0)))
	(elem-set +text_position+ current_text (list ox oy cx cy sx)))

;macros for select-action-on-enter command and data parsing.
(defmacro-bind split-cd (cd)
	`(let ((s (slice 1 -2 ,cd))) (split s ":")))

(defun-bind select-action-on-enter ()
	(defq tf_text (get :text textfield) tfp (split-cd tf_text) cmd (first tfp) is_find nil)
	(if (defq data (second tfp)) data (defq data nil))
	(cond
		((eql cmd "save") (when (not data) (defq data (elem +text_fpath+ current_text)))
			(save-check data))
		((eql cmd "save-all")
			(each (lambda (_) (save-check (elem +text_fpath+ _))) text_store))
		((eql cmd "new") (new-buffer))
		((eql cmd "close") (close-buffer (elem +text_index+ current_text)))
		((eql cmd "close-all") 
			(each (lambda (_) (close-check (elem +text_index+ _))) text_store))
		((eql cmd "open") (when (not data) (defq data (elem +text_fpath+ current_text)))
			(open-check data))
		((eql cmd "prev") (prev-buffer (elem +text_index+ current_text))
			(setq sb_line_col_message ""))
		((eql cmd "next") (next-buffer (elem +text_index+ current_text))
			(setq sb_line_col_message ""))
		((eql "run" cmd) (when (not data) (defq data (elem +text_fpath+ current_text)))
			(open-child data kn_call_open)
			(set textfield :text data))
		((and (eql "find" cmd) data)
			(set textfield :text data) (find-next) (view-dirty textfield) (setq is_find t))
		(t 	(find-next) (setq is_find t)))
	(unless is_find (clear-text))
	(window-layout vdu_width vdu_height))

;return position just below tab_bar
(defun-bind update-status (tmp_msg)
	(set sb_line_col :text tmp_msg)
	(view-layout status_bar) (view-dirty status_bar)
	(task-sleep 1500000))

(defun-bind notification-position ()
	(bind '(tw th) (view-get-size window_title))
	(bind '(tbw tbh) (view-get-size toolbar))
	(bind '(x y w h) (view-get-bounds window))
	(defq brdr (get :border window) x (+ x brdr) y (+ y brdr th tbh))
	(list x y tbw th))
;bar with buttons
(defun-bind confirm (m b &optional c)
	(bind '(x y w h) (notification-position))
	(mail-send (list (elem +mbox_modal+ mbox_array)
		m b (if c c *env_toolbar2_col*) 0 x y w h)
	(defq modal (open-child "apps/messagebar/child.lisp" kn_call_open)))
	(defq reply (mail-read (elem +mbox_modal+ mbox_array)))
	(mail-send "" modal) (if (str? reply) reply nil))
;bar with timer and without buttons. Default is 1.5 seconds.
(defun-bind notify (m &optional c s)
	(bind '(x y w h) (notification-position))
	(mail-send (list (elem +mbox_modal+ mbox_array)
		m "" (if c c *env_toolbar2_col*) (if s s 1500000) x y w h)
	(defq modal (open-child "apps/messagebar/child.lisp" kn_call_open)))
	(mail-send "" modal))

;notify, confirm, on open, save, and close.
(defun-bind open-check (fpath)
	(cond
		((defq index (some (lambda (_) 
			(if (eql fpath (elem +text_fpath+ _)) (elem +text_index+ _) nil)) text_store))
			(when index (move-to index)))
		((not (file-stream fpath))
			(when (eql "Yes" (confirm "File does not exist. Create new file?" 
				"Yes,No" +argb_yellow+)) (new-buffer fpath)))
		(t 	(open-buffer fpath))))

(defun-bind save-check (fpath)
	(cond
		((and (not (eql fpath (elem +text_fpath+ current_text))) (file-stream fpath))
			(when (eql "Yes" (confirm "Overwrite existing file?" "Yes, No" +argb_red+))
				(save-buffer fpath)))
		((not (file-stream fpath))
			(notify (cat "Saving file to new path: " fpath ".") +argb_yellow+)
			(save-buffer fpath))
		(t 	(save-buffer fpath))))

(defun-bind close-check (index)
	(defq reply nil)
	(cond 
		((unsaved-buffer index)
			(defq reply (confirm "Buffer not saved since last edit." 
				"Save,Close,Cancel" +argb_yellow+))
			(cond 
				((eql reply "Save") 
					(save-check (elem +text_fpath+ current_text))
					(close-buffer (remove-from-unsaved-buffers index)))
				((eql reply "Close")
					(close-buffer (remove-from-unsaved-buffers index)))))
		(t (close-buffer index))))
			
;sets the tab bar title to the last two parts of the path.
(defmacro-bind title-set (fp) 
	`(let ((sfp (reverse (split ,fp "/")))) 
		(if (= (length sfp) 1) (first sfp) (cat (second sfp) "/" (first sfp)))))
;new, open, save, and close buffer functions		
(defun-bind new-buffer (&optional nfpath)
	(defq index (length text_store) pos (list 0 0 0 0 0) 
		title (cat "Untitled-" (str (setq tmp_num (inc tmp_num))))
		buffer (list " ") fpath (if nfpath nfpath (cat home_dir title)))
	(when nfpath (save-buffer nfpath))
	(push text_store (list index fpath title buffer pos))
	(setq current_text (elem index text_store)))

(defun-bind open-buffer (fpath)
	(defq i 0 index (length text_store) pos (list 0 0 0 0 0))
	(defq title (title-set fpath) buffer (list))
	;ensure something to read on empty file.
	(if (eql nil (read-line (file-stream fpath))) (setq buffer (list ""))
	(each-line (lambda (_) (push buffer _)) (file-stream fpath)))
	(push text_store (list index fpath title buffer pos))
	(setq current_text (elem index text_store)))

(defun-bind save-buffer (fpath)
	(cond 
		((or (eql fpath "") (ends-with "/" fpath) (find ":" fpath))
			(notify "Invalid filename. Buffer not saved" +argb_yellow+))
		(t 	(defq save_buffer (join (elem +text_buffer+ current_text) (const (char 10))))
			(save save_buffer fpath)
			(remove-from-unsaved-buffers (elem +text_index+ current_text))
			(when (not (eql (elem +text_fpath+ current_text) fpath))
				(defq fp (elem-set +text_fpath+ current_text fpath))
				(elem-set +text_fpath+ current_text (title-set fp))))))

(defun-bind close-buffer (index)
	(defq i 0)
	(cond
		((<= (length text_store) 1)
			(setq id nil))
		((> (length text_store) 1)
			(setq text_store (erase text_store index (inc index)))
			(each (lambda (_) (elem-set +text_index+ _ i) (setq i (inc i))) text_store)
			(setq current_text (prev-buffer index)))))

(defun-bind add-to-unsaved-buffers (index)
	(unless (some (lambda (_) (= index _)) unsaved_buffers)
		(push unsaved_buffers (elem +text_index+ current_text))))

(defun-bind remove-from-unsaved-buffers (index)
		(if (= (length unsaved_buffers) 1) (setq unsaved_buffers (list)))
			(some (lambda (x) (when (= x index) 
				(erase unsaved_buffers _ (inc x)))) unsaved_buffers) index)

(defun-bind unsaved-buffer (index)
	(some (lambda (_) (if (= index _) t nil)) unsaved_buffers))

;buffer navigation functions
(defun-bind move-to (index)
	(when (< -1 index (length text_store))
		(setq current_text (elem index text_store))))
(defun-bind prev-buffer (index)
	(unless (= index 0) (setq index (dec index)))
	(setq current_text (elem index text_store)))
(defun-bind next-buffer (index)
	(unless (= index (dec (length text_store)))
		(setq index (inc index)))
	(setq current_text (elem index text_store)))

(defun-bind clear-text ()
	(setq find_list (list) find_index 0 sb_line_col_message "")
	(set textfield :text "")
	(window-layout vdu_width vdu_height))

(defun-bind vdu-input (c)
	(bind '(index fpath title buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(setq dirty_vdu t)
	(cond
		((or (= c 10) (= c 13))		(return) (setq cx 0) (add-to-unsaved-buffers index))
		((= c 8)					(backspace) (setq sx cx) (add-to-unsaved-buffers index))
		((or (= c 9) (<= 32 c 127))	(printable c) (setq sx cx) (add-to-unsaved-buffers index))
		((= c 0x40000050)			(left) (setq sx cx))
		((= c 0x4000004f)			(right) (setq sx cx))
		((= c 0x40000052)			(up))
		((= c 0x40000051)			(down))
		(t (setq dirty_vdu nil)))
	;only reload if a key actually alters vdu.
	(cursor-visible)
	(set-sticky)
	(when dirty_vdu (setq dirty_vdu nil)
		(set slider :value oy)
		(elem-set +text_buffer+ current_text buffer)
		(elem-set +text_position+ current_text (list ox (setq oy (get :value slider)) cx cy sx))
		(set sb_line_col :text (cat "Line " (str cy) ", Column " (str cx) sb_line_col_message))
		(view-dirty (view-layout sb_line_col))
		(view-dirty slider)
		(vdu-colorise)))

(defun-bind main ()
	(defq id t find_textfield nil mouse_down nil selection (list))
	;open buffers from pupa or open new buffer
	(if (empty? *env_edit_auto*) (new-buffer)
		(each (#(open-buffer %0)) *env_edit_auto*))
	(setq current_text (elem 0 text_store))
	(bind '(w h) (view-pref-size (component-connect window +event_layout+)))
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
					(save-check msg)
					(elem-set +text_fpath+ current_text msg)
					(window-layout vdu_width vdu_height))
				(t	(open-check msg)
					(window-layout vdu_width vdu_height))))
		((= (setq id (get-long msg (const ev_msg_target_id))) +event_close+) 
			(setq id nil))
		((= id +event_new+) (new-buffer) (window-layout vdu_width vdu_height))
		((= id +event_save+) (if picker_mbox (mail-send "" picker_mbox))
			(mail-send (list (elem +mbox_file+ mbox_array) "Save Buffer..." "."  "")
				(setq picker_mode t picker_mbox 
					(open-child "apps/files/child.lisp" kn_call_open))))
		((= id +event_open+) (if picker_mbox (mail-send "" picker_mbox))
			(mail-send (list (elem +mbox_file+ mbox_array) "Load Buffer..." "." "")
				(setq picker_mode nil picker_mbox 
					(open-child "apps/files/child.lisp" kn_call_open))))
		((= id +event_run+) (open-child (elem +text_fpath+ current_text) kn_call_open))
		((= id +event_closeb+) (close-check (elem +text_index+ current_text))
			(window-layout vdu_width vdu_height))
		((= id +event_find+) 
			(if (> (length find_list) 0)
				(progn (setq find_list (list) find_index 0) (open-find)) (open-find)))
		((= id +event_find_prev+) (when (> (length find_list) 0) (find-prev)))
		((= id +event_find_next+) (when (> (length find_list) 0)(find-next)))
		((= id +event_clear_text+) (clear-text))
		((= id +event_colorise+) (if colorise (setq colorise nil) (setq colorise t)) 
			(window-layout vdu_width vdu_height))
		((= id +event_prev+)
			(setq current_text (prev-buffer (elem +text_index+ current_text)))
			(window-layout vdu_width vdu_height))
		((= id +event_next+)
			(setq current_text (next-buffer (elem +text_index+ current_text)))
			(window-layout vdu_width vdu_height))
		((= id +event_layout+) (apply window-layout (vdu-max-size vdu)))
		((= id +event_min+) (window-resize 60 40))
		((= id +event_max+) (window-resize 120 48))
		((= id +event_scroll+)			
			(view-dirty slider)
			(defq buffer (elem +text_buffer+ current_text))
			(bind '(ox oy cx cy sx) (elem +text_position+ current_text))
			(elem-set +text_position+ current_text (list ox (setq oy (get :value slider)) cx cy sx))
			(vdu-colorise))
		((<= +event_tabbar+ id (+ +event_tabbar+ (length text_store)))
			(move-to (- id +event_tabbar+))
			(window-layout vdu_width vdu_height))
		((= id +event_menu+)
			(defq cmd_list '("new" "open" "save" "run" "close" "exit"))
			(bind '(x y w h) (notification-position))
			(bind '(wx wy ww wh) (apply view-locate (view-pref-size window)))
			;pos is the rightmost, uppermost position of the menu.
			(defq pos (list (+ x w) y))
			(mail-send (list (elem +mbox_task+ mbox_array) cmd_list pos :top_right)
				(defq menu_mbox (open-child "apps/edit/menu.lisp" kn_call_open)))
			(defq reply (mail-read (elem +mbox_task+ mbox_array)))
			(cond 
				((eql "new" reply) (new-buffer) (window-layout vdu_width vdu_height))
				((eql "open" reply) (if picker_mbox (mail-send "" picker_mbox))
					(mail-send (list (elem +mbox_file+ mbox_array) "Load Buffer..." "." "")
					(setq picker_mode nil picker_mbox 
						(open-child "apps/files/child.lisp" kn_call_open))))
				((eql "save" reply) (if picker_mbox (mail-send "" picker_mbox))
					(mail-send (list (elem +mbox_file+ mbox_array) "Save Buffer..." "."  "")
					(setq picker_mode t picker_mbox 
						(open-child "apps/files/child.lisp" kn_call_open))))
				((eql "run" reply) (open-child (elem +text_fpath+ current_text) kn_call_open))
				((eql "close" reply) (close-check (elem +text_index+ current_text)))
				((eql "exit" reply) (each (lambda (_) (close-check (elem +text_index+ current_text))) text_store)
					(setq id nil)))
			(mail-send "" menu_mbox))
		((= id (component-get-id vdu))
			(cond 
				((and (= (get-long msg ev_msg_type) ev_type_key)
					(> (get-int msg ev_msg_key_keycode) 0)
					(vdu-input (get-int msg ev_msg_key_key))))
				((and (= (get-long msg ev_msg_type) ev_type_mouse)
					(/= (get-int msg ev_msg_mouse_buttons) 0))
					(defq rx (get-int msg ev_msg_mouse_rx) ry (get-int msg ev_msg_mouse_ry)
						mouse_xy (list rx ry))
					(mouse-cursor mouse_xy)
					(window-layout vdu_width vdu_height))))
		((and (= id (component-get-id textfield))
			(= (get-long msg ev_msg_type) ev_type_key)
			(> (get-int msg ev_msg_key_keycode) 0)
			(or (= (get-int msg ev_msg_key_key) 13) (= (get-int msg ev_msg_key_key) 10)))
			(select-action-on-enter))
		(t	(view-event window msg))))
	(if picker_mbox (mail-send "" picker_mbox))
	(view-hide window))