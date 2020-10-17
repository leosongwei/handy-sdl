(defparameter +window1+  (sdl-create-window "hello!" 1000 800 400 400
                                            '(:sdl_window_resizable)))

(defparameter +renderer+ (sdl-create-renderer +window1+ '(:SDL_RENDERER_SOFTWARE)))
(sdl-renderer-clear +renderer+)
(sdl-renderer-present +renderer+)

(defparameter +event1+ (sdl-wait-event))
(print +event1+)

(foreign-enum-keyword 'c-sdl-window-event-id
 (foreign-slot-value (sdl-event-ptr +event1+) '(:struct c-sdl-event) 'type))



(sdl-destroy-window +window1+)
