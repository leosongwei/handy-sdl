(in-package :handy-sdl)

(deftype sdl-glattr () ( (cffi:foreign-enum-keyword-list 'c-sdl-glattr)))

(cffi:defcfun (c-sdl-gl-setattribute "SDL_GL_SetAttribute") :int
  (attr :uchar) (value :int))

(cffi:defcfun (c-sdl-gl-createcontext "SDL_GL_CreateContext") :pointer
  (window :pointer))

(cffi:defcfun (c-sdl-gl-deletecontext "SDL_GL_DeleteContext") :void
  (context :pointer))

(cffi:defcfun (c-sdl-gl-swapwindow "SDL_GL_SwapWindow") :void
  (window :pointer))

;; --------------------------------------------------------------------------
(define-enum-keyword-type sdl-glattr c-sdl-glattr)

(defun sdl-gl-setattribute (attr value)
  (check-type attr sdl-glattr)
  (check-type value (signed-byte 32))
  (c-sdl-gl-setattribute (cffi:foreign-enum-value 'c-sdl-glattr attr)
                         value))

(defstruct sdl-glcontext (ptr (null-pointer)))

(defun sdl-gl-createcontext (sdl-window)
  (let ((context (c-sdl-gl-createcontext (sdl-window-ptr sdl-window))))
    (make-sdl-glcontext :ptr context)))

(defun sdl-gl-deletecontext (sdl-glcontext)
  (let ((ptr (sdl-glcontext-ptr sdl-glcontext)))
    (setf (sdl-glcontext-ptr sdl-glcontext) (null-pointer))
    (c-sdl-gl-deletecontext ptr)))

(defun sdl-gl-swapwindow (sdl-window)
  (let ((ptr (sdl-window-ptr sdl-window)))
    (c-sdl-gl-swapwindow ptr)))
