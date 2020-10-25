(require :handy-sdl)
(require :cffi)
(use-package :handy-sdl)

(handy-sdl::load-sdl)

(sdl-init '(:video))

(defparameter +window1+  (sdl-create-window "hello!" 1000 800 400 400
                                            '(:sdl_window_resizable)))

(defparameter +renderer+ (sdl-create-renderer +window1+ '(:SDL_RENDERER_SOFTWARE)))
(sdl-renderer-clear +renderer+)
(sdl-renderer-present +renderer+)

(defparameter +surface-tux+ (sdl-load-bmp "tux.bmp"))
(defparameter +texture-tux+ (sdl-create-texture-from-surface +renderer+ +surface-tux+))
(sdl-render-copy +renderer+ +texture-tux+ (null-pointer) (null-pointer))

(sdl-poll-event-list)
;; 1001 is not defined as a value for enum type #<CFFI::FOREIGN-ENUM C-SDL-SCANCODE>.

(sdl-destroy-window +window1+)

