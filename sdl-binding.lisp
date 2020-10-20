(require :cffi)
(require :cffi-grovel)
(use-package :cffi)

(load (cffi-grovel:process-grovel-file "sdl-keyboard-grovel.lisp" "/dev/shm/_sdl_keyboard.o"))
(load (cffi-grovel:process-grovel-file "sdl-grovel.lisp" "/dev/shm/_sdl.o"))

(load-foreign-library "libSDL2-2.0.so")
(load-foreign-library "libSDL2_image-2.0.so.0")

(defcfun ("SDL_Init" c-sdl-init) :int (flags :int))

(defcfun ("SDL_Quit" c-sdl-quit) :void)

(defcfun ("SDL_GetError" c-sdl-get-error) :string)

(defcfun ("SDL_CreateWindow" c-sdl-createwindow) :pointer
  (title :string)
  (x :int)
  (y :int)
  (w :int)
  (h :int)
  (flags :uint32))
;; (foreign-enum-keyword-list 'c-sdl-window-flags)

(defcfun ("SDL_DestroyWindow" c-sdl-DestroyWindow) :void (window :pointer))

;; ------------------------------------------------------
;; Renderer

(defcfun ("SDL_CreateRenderer" c-sdl-CreateRenderer) :pointer
  (window-ptr :pointer)
  (index :int)
  (flags :uint32))

(defcfun ("SDL_DestroyRenderer" c-sdl-destroyrenderer) :void (renderer :pointer))

(defcfun ("SDL_RenderClear" c-sdl-RenderClear) :void (render :pointer))

(defcfun ("SDL_RenderCopy" c-sdl-RenderCopy) :void
  (render :pointer)
  (texture :pointer)
  (srcrect (:pointer (:struct c-sdl-rect)))
  (dstrect (:pointer (:struct c-sdl-rect))))

(defcfun ("SDL_RenderPresent" c-sdl-RenderPresent) :void (renderer :pointer))

;; --------------------------------------------------------
;; Surface & Texture

;;void SDL_FreeSurface(SDL_Surface* surface)
(defcfun ("SDL_FreeSurface" c-sdl-freesurface) :void (surface :pointer))

(defcfun ("SDL_CreateTexture" c-sdl-create-texture) :pointer
  (renderer :pointer)
  (format :uint32)
  (w :int) (h :int))

(defcfun ("SDL_CreateTextureFromSurface" c-sdl-create-texture-from-surface) :pointer
  (renderer :pointer)
  (surface (:pointer (:struct c-sdl-surface))))

(defcfun ("SDL_DestroyTexture" c-sdl-DestroyTexture) :void (texture :pointer))

(defcfun ("SDL_BlitSurface" c-sdl-blit-surface) :int
  (src (:pointer (:struct c-sdl-surface)))
  (srcrect (:pointer (:struct c-sdl-rect)))
  (dst (:pointer (:struct c-sdl-surface)))
  (dstrect (:pointer (:struct c-sdl-rect))))

(defcfun ("SDL_RenderCopy" c-sdl-render-copy) :int
  (renderer :pointer)
  (texture :pointer)
  (srcrect (:pointer (:struct c-sdl-rect)))
  (dstrect (:pointer (:struct c-sdl-rect))))

;; --------------------------------------------------------
;; Event

(defcfun ("SDL_WaitEvent" c-sdl-wait-event) :int
  (event (:pointer (:struct c-sdl-event))))

(defcfun ("SDL_PollEvent" c-sdl-poll-event) :int
  (event (:pointer (:struct c-sdl-event))))
