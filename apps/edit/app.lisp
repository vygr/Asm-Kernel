;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")
(import "gui/lisp.inc")
(import "apps/edit/input.inc")
(import "apps/edit/find.inc")
(import "lib/substr/substr.inc")


;alt,ctl,cmd, and shift key codes.
(defq left_shift 0x400000E1 left_ctrl_key 0x400000E0 left_alt_key 0x400000E2 left_cmd_key 0x400000E3
	right_shift 0x400000E5 right_alt_key 0x400000E6  right_cmd_key 0x400000E7)

(structure '+event 0
	(byte 'close+ 'max+ 'min+ 'resize+)
	(byte 'layout+ 'scroll+ 'new+ 'save+ 'open+ 'closeb+ 'prev+ 'next+ 'find+ 'click_textfield+)
	(byte 'find_prev+ 'find_next+ 'clear_text+))

(structure '+mbox 0
	(byte 'task+ 'file+ 'modal+))
;text structure
(structure '+text 0
	(byte 'index+ 'fpath+ 'title+ 'buffer+ 'position+))
 
(defq vdu_min_width 40 vdu_min_height 24 vdu_width 60 vdu_height 40 text_store (list) tmp_num 0
	current_text (list) empty_buffer '("") home_dir (cat "apps/login/" *env_user*)
	picker_mbox nil picker_mode nil select (array (task-mailbox) (mail-alloc-mbox) (mail-alloc-mbox))
	find_list (list) find_index 0 sb_line_col_message "")
;set views for buffer left margin.
(ui-window window (:border 4)
	(ui-flow _ (:flow_flags flow_right_fill) (ui-label _ (:text "" :min_width 4))
		(ui-title-bar window_title "Edit" (0xea19 0xea1b 0xea1a) +event_close+))
		(ui-flow window_flow (:flow_flags flow_down_fill)
			(ui-flow toolbar (:flow_flags flow_right_fill)
				(ui-grid _ (:flow_flags flow_flag_align_hleft :grid_width 6 :grid_height 1 :font *env_toolbar_font*)
					(each (lambda (c e)
							(component-connect (ui-button _ (:font *env_medium_toolbar_font* :text (num-to-utf8 c)
								 :min_height 32 :min_width 32 :border 0)) e))
						'(0xe999 0xea07 0xe94c 0xe94e 0xe91d 0xe91e)
							(list +event_open+ +event_save+ +event_closeb+ +event_new+ +event_prev+ +event_next+)))
				(ui-flow _ (:flow_flags flow_left_fill)
					(ui-grid _ (:flow_flag flow_flag_align_hright :grid_width 3 :grid_height 1)
						(each (lambda (c e)
							(component-connect (ui-button _ (:border 0 :font *env_medium_toolbar_font*
								:text (num-to-utf8 c) :min_height 32 :min_width 32)) e))
							'(0xe9cd 0xe91f 0xe91c) (list +event_find+ +event_find_prev+ +event_find_next+)))
						(component-connect (ui-button _ (:font *env_small_toolbar_font*
							:text (num-to-utf8 0xe988) :border 0)) +event_clear_text+)
					(ui-textfield textfield (:border 0 :text ""))))
				(ui-flow status_bar (:flow_flags flow_right_fill)
					(ui-label sb_left_pad (:min_width 18))
					(ui-label sb_line_col (:flow_flags flow_flag_align_hleft :font *env_body_font*  :text "Line xx, Column xx. "))
					(ui-label _ (:min_width 48))
					(ui-label sb_buf_disp (:flow_flags flow_flag_align_hright :text "Buffer 0/0" :font *env_body_font*)))
			(ui-flow _ (:flow_flags flow_right_fill)
				(ui-label _ (:min_width 36))
				(ui-flow _ (:border 0 :flow_flags flow_left_fill)
					(component-connect (ui-slider slider (:flow_flags flow_down_fill :color 0x22cccccc :border 0)) +event_scroll+)
					(ui-vdu vdu (:vdu_width vdu_width :vdu_height vdu_height :min_width vdu_width :min_height vdu_height
						:font *env_terminal_font*))))))		


(defun-bind window-resize (w h)
	(bind '(_ fpath title buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(setq vdu_width w vdu_height h)
	(set sb_line_col :text (cat "Line " (str cy) ", Column " (str cx) sb_line_col_message))
	(set vdu :vdu_width w :vdu_height h :min_width w :min_height h)
	(bind '(x y w h) (apply view-fit
	(cat (view-get-pos window) (view-pref-size window))))
	(view-change-dirty window x y w h)
	(vdu-load vdu buffer ox oy cx cy))

(defun-bind window-layout (w h)
	(bind '(index fpath title buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	;for display purposes, index starts at 1.
	(set sb_line_col :text (cat "Line " (str cy) ", Column " (str cx) sb_line_col_message))
	(set sb_buf_disp :text (cat "Buffer " (str (inc index)) "/" (str (length text_store))))
	(setq vdu_width w vdu_height h)
	(set vdu :vdu_width w :vdu_height h :min_width w :min_height h)
	(bind '(x y) (view-get-pos vdu))
	(bind '(w h) (view-pref-size vdu))
	(set vdu :min_width vdu_min_width :min_height vdu_min_height)
	(view-layout textfield)
	(view-change vdu x y w h)
	(set window_title :text title)
	(view-layout window_title)
	;set slider and textfield values
	(def slider :maximum (max 0 (- (length buffer) vdu_height)) :portion vdu_height :value oy)
	(view-layout window)
	(view-dirty-all window)
	(vdu-load vdu buffer ox oy cx cy))

(defun-bind mouse-cursor (mouse_xy)
	(defq buffer (elem +text_buffer+ current_text))
	(bind '(ox oy cx cy sx) (elem +text_position+ current_text))
	(defq cursor_xy (list cx cy) char_wh (vdu-char-size vdu) offset_xy (list ox oy))
	(setq cursor_xy (map + (map / mouse_xy char_wh) offset_xy)
		cx (elem 0 cursor_xy) cy (elem 1 cursor_xy))
	(if (>= cy (length buffer)) 
		(setq cy (min cy (dec (length buffer))) cx (length (elem cy buffer))))
	(if (> cx (length (elem cy buffer)))
		(setq cx (max (set-sticky) (length (elem cy buffer)))) (setq sx cx))
	(elem-set +text_buffer+ current_text buffer)
	(elem-set +text_position+ current_text (list ox oy cx cy sx)))
;issue commands or search on textfield substr
(defmacro-bind select-action-on-enter (f)
	`(let ((tf_text (get :text ,f)))
		(cond
			((and (starts-with "(save:" tf_text) (ends-with ")" tf_text)) 
				(save-check (slice 6 -2 tf_text)) (set textfield :text ""))
			((eql tf_text "(save)") (save-buffer (elem +text_fpath+ current_text))
				(set sb_line_col :text "Saving...") (view-dirty sb_line_col)
				(task-sleep 250000))
			((eql tf_text "(new)") (setq current_text (new-buffer)) (set textfield :text ""))
			((eql tf_text "(close)") (close-buffer (elem +text_index+ current_text))
				(set textfield :text ""))
			((and (starts-with "(open:" tf_text) (ends-with ")" tf_text))
				(open-check (slice 6 -2 tf_text)) (set textfield :text ""))
			((eql "(prev)" tf_text) (prev-buffer (elem +text_index+ current_text)) 
				(set textfield :text "") (setq sb_line_col_message ""))
			((eql "(next)" tf_text)
				(next-buffer (elem +text_index+ current_text)) (set textfield :text "")
					(setq sb_line_col_message ""))
			((and (starts-with "(find:" tf_text) (ends-with ")" tf_text))
				(set textfield :text (slice 6 -2 tf_text)) (find-next))
			(t (find-next)))
		(window-layout vdu_width vdu_height)))
;returns position just below the toolbar
(defun-bind notification-position ()
	(bind '(tw th) (view-get-size window_title))
	(bind '(sbw sbh) (view-get-size status_bar))
	(bind '(tbw tbh) (view-get-size toolbar))
	(bind '(x y w h) (view-get-bounds window))
	(defq brdr (get :border window) x (+ x brdr) y (+ y brdr th tbh sbh))
	(list x y tbw th))
;create a new, unsaved buffer or open buffer created at optional path
(defun-bind new-buffer (&optional path)
	(defq index (length text_store) pos (list 0 0 0 0 0) 
			title (cat "Untitled-" (str (setq tmp_num (inc tmp_num))))
			buffer (list (list (join " " (ascii-char 10)))) fpath (if path path (cat home_dir title)))
	(push text_store (list index fpath title buffer pos))
	(elem index text_store))

(defun-bind open-buffer (fpath)
	(defq i 0 index (length text_store) pos (list 0 0 0 0 0))
	(defq title fpath buffer (list))
	(each-line (lambda (_) (push buffer _)) (file-stream fpath))
	(push text_store (list index fpath title buffer pos))
	(setq current_text (elem index text_store)))
;create and open with confirmation, move to open buffer, or open existing buffer.
(defun-bind open-check (fpath)
	(cond
		((not (file-stream fpath))
			(bind '(x y w h) (notification-position))
			(mail-send (list (elem +mbox_modal+ select)
				(cat "Create a new file at " fpath "?") "Yes, No" 0xffd7b61d 0 x y w h)
			(defq modal (open-child "apps/messagebar/child.lisp" kn_call_open)))
			(defq reply (mail-read (elem +mbox_modal+ select)))
			(mail-send "" modal)
			(when (eql reply "Yes") (save (join " " (ascii-char 10)) fpath) (new-buffer fpath)))
		((defq index (some (lambda (_) (if (eql fpath (elem +text_fpath+ _)) _ nil)) text_store))
			(when index (move-to index)))
		(t (setq current_text (open-buffer fpath)))))
;save or save as, with confirmation
(defun-bind save-check (fpath)
	(cond
		((eql fpath (elem +text_fpath+ current_text)) (save-buffer fpath))
		(t
			(bind '(x y w h) (notification-position))
			(mail-send (list (elem +mbox_modal+ select)
				"This will overwrite the existing file. Are You Sure?" "Yes, No" argb_red 0 x y w h)
			(defq modal (open-child "apps/messagebar/child.lisp" kn_call_open)))
			(defq reply (mail-read (elem +mbox_modal+ select)))
			(mail-send "" modal)
			(when (eql reply "Yes")
				(save-buffer fpath)))))

(defun-bind save-buffer (fpath)
	(unless (or (eql fpath "") (ends-with "/" fpath))		
			(defq save_buffer (join (elem +text_buffer+ current_text) (const (ascii-char 10))))
			(save save_buffer fpath)
			(elem-set +text_title+ current_text fpath)
			(elem-set +text_fpath+ current_text fpath)))

(defun-bind move-to (index)
	(unless (= (elem +text_index+ (elem (dec index) text_store)) (elem +text_index+ current_text))
		(setq current_text (elem index text_store))))

(defun-bind close-buffer (index)
	(defq i 0)
	(cond
		((<= (length text_store) 1)
			(setq id nil))
		((> (length text_store) 1)
			(setq text_store (erase text_store index (inc index)))
			(each (lambda (_) (elem-set +text_index+ _ i) (setq i (inc i))) text_store)
			(setq current_text (prev-buffer index)))))

(defun-bind prev-buffer (index)
	(unless (= index 0)
		(setq index (dec index)))
	(setq current_text (elem index text_store)))

(defun-bind next-buffer (index)
	(unless (= index (dec (length text_store)))
		(setq index (inc index)))
	(setq current_text (elem index text_store)))

(defun-bind vdu-input (c)
	(bind '(index fpath title buffer position) current_text)
	(bind '(ox oy cx cy sx) position)
	(cond
		((or (= c 10) (= c 13))		(return) (setq cx 0))
		((= c 8)					(backspace) (setq sx cx))
		((or (= c 9) (<= 32 c 127))	(printable c) (setq sx cx))
		((= c 0x40000050)			(left) (setq sx cx))
		((= c 0x4000004f)			(right) (setq sx cx))
		((= c 0x40000052)			(up))
		((= c 0x40000051)			(down)))
	; ensures behavior resembling other editor interfaces when adjusting cx
	(cursor-visible)
	(set-sticky)
	(set slider :value oy)
	(elem-set +text_buffer+ current_text buffer)
	(elem-set +text_position+ current_text (list ox oy cx cy sx))
	(vdu-load vdu buffer ox (get :value slider) cx cy)
	(vdu-load vdu buffer ox oy cx cy)
	(set sb_line_col :text (cat "Line " (str cy) ", Column " (str cx) sb_line_col_message))
	(view-layout sb_line_col)
	(view-dirty sb_line_col)
	(view-dirty slider))


(defun-bind main ()
	(defq cx 0 cy 0 index 0 find_textfield nil)
	;open buffers from pupa or open new buffer
	(each open-buffer (if (= (length *env_edit_auto*) 0) '("") *env_edit_auto*))
	(setq current_text (elem 0 text_store))
	(bind '(w h) (view-pref-size (component-connect window +event_layout+)))
	(bind '(x y w h) (view-locate w h))
	(gui-add (view-change window x y w h))
	(window-layout vdu_width vdu_height)
	(defq id t vdu_char_h (second (vdu-char-size vdu)))
	(while id
		(defq msg (mail-read (elem (defq idx (mail-select select)) select)))
		(cond
		((= idx +mbox_file+)
			(mail-send "" picker_mbox)
			(setq picker_mbox nil)
			(cond
				;closed picker
				((eql msg ""))
				;save buffer
				(picker_mode
						(save-check msg)
						(elem-set +text_fpath+ current_text msg)
						;(set textfield :text msg)
						(window-layout vdu_width vdu_height))
				;load buffer
				(t	(setq current_text (open-buffer msg))
					;(set textfield :text (elem +text_fpath+ current_text))
					(window-layout vdu_width vdu_height))))
		((= (setq id (get-long msg (const ev_msg_target_id))) +event_close+)
			(setq id nil))
		((= id +event_new+)
			(setq current_text (new-buffer))
			;(set textfield :text (cat "(save:" home_dir "/" (elem +text_fpath+ current_text) ")"))
			(window-layout vdu_width vdu_height))
		((= id +event_save+)
			(if picker_mbox (mail-send "" picker_mbox))
			(mail-send (list (elem +mbox_file+ select) "Save Buffer..." "."  "")
				(setq picker_mode t picker_mbox (open-child "apps/files/child.lisp" kn_call_open))))
		((= id +event_open+)
			(if picker_mbox (mail-send "" picker_mbox))
			(mail-send (list (elem +mbox_file+ select) "Load Buffer..." "." "")
				(setq picker_mode nil picker_mbox (open-child "apps/files/child.lisp" kn_call_open))))
		((= id +event_closeb+)
			(close-buffer (elem +text_index+ current_text)) (window-layout vdu_width vdu_height))
		((= id +event_find+) 
			(if (> (length find_list) 0)
				(progn (setq find_list (list) find_index 0) (open-find)) (open-find)))
		((= id +event_find_prev+) (when (> (length find_list) 0) (find-prev)))
		((= id +event_find_next+) (when (> (length find_list) 0)(find-next)))
		((= id +event_clear_text+) (clear-text))
		((= id +event_prev+)
			(setq current_text (prev-buffer (elem +text_index+ current_text)))
			(window-layout vdu_width vdu_height))
		((= id +event_next+)
			(setq current_text (next-buffer (elem +text_index+ current_text)))
			(window-layout vdu_width vdu_height))
		((= id +event_layout+)
			(apply window-layout (vdu-max-size vdu)))
		((= id +event_min+)
			;min button
			(window-resize 60 40))
		((= id +event_max+)
			;max button
			(window-resize 120 48))
		((= id +event_scroll+)
			(set slider :color 0x99cccccc)
			(view-dirty slider)
			(defq buffer (elem +text_buffer+ current_text))
			(bind '(ox oy cx cy sx) (elem +text_position+ current_text))
			;user scroll bar
			(vdu-load vdu buffer 0 (defq new_oy (get :value slider)) cx cy)
			(setq oy new_oy)
			(elem-set +text_buffer+ current_text buffer)
			(elem-set +text_position+ current_text (list ox oy cx cy sx)))
		((= id (component-get-id vdu))
			(cond 
				((and (= (get-long msg ev_msg_type) ev_type_key)
					(> (get-int msg ev_msg_key_keycode) 0)
					(vdu-input (get-int msg ev_msg_key_key))))
				((and (= (get-long msg ev_msg_type) ev_type_mouse)
					(/= (get-int msg ev_msg_mouse_buttons) 0))
					(defq rx (get-int msg ev_msg_mouse_rx) ry (get-int msg ev_msg_mouse_ry)
						mouse_xy (list rx ry))
					(mouse-cursor mouse_xy)))
			(window-layout vdu_width vdu_height))
		(t	
			;capture the enter key for commands and search from the textfield.
			(and (= (get-long msg ev_msg_type) ev_type_key)
				(> (get-int msg ev_msg_key_keycode) 0)
				(= (get-int msg ev_msg_key_key) 13) 
				(select-action-on-enter textfield))
			(view-event window msg))))
	(if picker_mbox (mail-send "" picker_mbox))
	(view-hide window))