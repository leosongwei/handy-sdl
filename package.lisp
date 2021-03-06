(defpackage #:handy-sdl
  (:use #:cl
        #:cffi)
  (:export
   #:load-sdl
   #:sdl-error
   #:sdl-init
   ;; window
   #:sdl-window
   #:sdl-window-ptr
   #:sdl-create-window
   #:sdl-destroy-window
   ;; renderer
   #:sdl-renderer
   #:sdl-renderer-ptr
   #:sdl-create-renderer
   #:sdl-renderer-clear
   #:sdl-renderer-present
   ;; surface & texture
   #:sdl-texture
   #:sdl-texture-ptr
   #:sdl-surface
   #:sdl-surface-ptr
   #:sdl-free-surface
   #:sdl-create-texture-from-surface
   #:sdl-render-copy
   #:sdl-load-bmp
   ;; keyboard
   #:sdl-keymod-list
   #:sdl-wait-event
   #:sdl-poll-event
   #:sdl-poll-event-list
   ;; opengl
   #:sdl-glcontext
   #:sdl-gl-setattribute
   #:sdl-gl-set-context-profile-mask
   #:sdl-gl-createcontext
   #:sdl-gl-deletecontext
   #:sdl-gl-swapwindow
   ))
