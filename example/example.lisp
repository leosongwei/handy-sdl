(sdl-init '(:video))

(defparameter +window1+  (sdl-create-window "hello!" 1000 800 400 400
                                            '(:sdl_window_resizable)))

(defparameter +renderer+ (sdl-create-renderer +window1+ '(:SDL_RENDERER_SOFTWARE)))
(sdl-renderer-clear +renderer+)
(sdl-renderer-present +renderer+)

(sdl-poll-event-list)
;; 1001 is not defined as a value for enum type #<CFFI::FOREIGN-ENUM C-SDL-SCANCODE>.

(sdl-destroy-window +window1+)



