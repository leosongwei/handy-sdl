(in-package :cl-user)
(require :handy-sdl)
(require :cffi)

(handy-sdl:load-sdl)
(handy-sdl:sdl-init '(:SDL_INIT_VIDEO))

(defparameter +window1+  (handy-sdl:sdl-create-window "hello!" 1000 800 400 400
                                            '(:sdl_window_resizable)))

(defparameter +renderer+ (handy-sdl:sdl-create-renderer +window1+ '(:SDL_RENDERER_SOFTWARE)))
(handy-sdl:sdl-renderer-clear +renderer+)
(handy-sdl:sdl-renderer-present +renderer+)

(defparameter +surface-tux+ (handy-sdl:sdl-load-bmp "tux.bmp"))
(defparameter +texture-tux+ (handy-sdl:sdl-create-texture-from-surface
                             +renderer+ +surface-tux+))
(handy-sdl:sdl-render-copy +renderer+ +texture-tux+ (cffi:null-pointer) (cffi:null-pointer))
(handy-sdl:sdl-renderer-present +renderer+)

(handy-sdl:sdl-poll-event-list)
;; 1001 is not defined as a value for enum type #<CFFI::FOREIGN-ENUM C-SDL-SCANCODE>.

;; (sdl-destroy-window +window1+)

