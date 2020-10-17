(require :cffi)
(require :cffi-grovel)
(use-package :cffi)

(load (cffi-grovel:process-grovel-file "sdl-grovel.lisp" "/dev/shm/_sdl.o"))
(load (cffi-grovel:process-grovel-file "sdl-keyboard-grovel.lisp" "/dev/shm/_sdl_keyboard.o"))
(load-foreign-library "libSDL2-2.0.so")

(defcfun ("SDL_Init" c-sdl-init) :int (flags :int))

(defcfun ("SDL_Quit" c-sdl-quit) :void)

(defcfun ("SDL_GetError" c-sdl-geterror) :string)

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
  (srcrect :pointer)
  (dstrect :pointer))

(defcfun ("SDL_RenderPresent" c-sdl-RenderPresent) :void (renderer :pointer))

;; --------------------------------------------------------
;; Surface & Texture

(defcfun ("SDL_LoadBMP" c-sdl-loadBMP) :pointer
  (file :string))

;;void SDL_FreeSurface(SDL_Surface* surface)
(defcfun ("SDL_FreeSurface" c-sdl-freesurface) :void (surface :pointer))

(defcfun ("SDL_CreateTextureFromSurface" c-sdl-CreateTextureFromSurface) :pointer
  (renderer :pointer)
  (surface :pointer))

(defcfun ("SDL_DestroyTexture" c-sdl-DestroyTexture) :void (texture :pointer))

;; --------------------------------------------------------
;; Error

(defcfun ("SDL_GetError" c-sdl-get-error) :string)


;; --------------------------------------------------------
;; Event

(defcfun ("SDL_WaitEvent" c-sdl-wait-event) :int
  (event (:pointer (:struct c-sdl-event))))
