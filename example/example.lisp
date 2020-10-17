(defparameter +window1+  (sdl-create-window "hello!" 1000 800 400 400
                                            '(:sdl_window_resizable)))

(defparameter +renderer+ (sdl-create-renderer +window1+ '(:SDL_RENDERER_SOFTWARE)))
(sdl-renderer-clear +renderer+)
(sdl-renderer-present +renderer+)

(progn (defparameter +event1+ (sdl-wait-event))
       (sdl-event-plist +event1+))

(sdl-destroy-window +window1+)
