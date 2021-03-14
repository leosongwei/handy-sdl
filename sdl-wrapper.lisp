(in-package :handy-sdl)

;; -------------------------------------------------
;; error

(define-condition sdl-error (error)
  ((message :initarg :message :reader sdl-error-message)))
;;(error 'sdl-error :message 2333)

;; -------------------------------------------------


(defun sdl-init (flags)
  (let ((c-flags 0))
    (dolist (flag flags)
      (let ((flag-value
             (case flag
               (:SDL_INIT_TIMER +SDL_INIT_TIMER+)
               (:SDL_INIT_AUDIO +SDL_INIT_AUDIO+)
               (:SDL_INIT_VIDEO +SDL_INIT_VIDEO+)
               (:SDL_INIT_JOYSTICK +SDL_INIT_JOYSTICK+)
               (:SDL_INIT_HAPTIC +SDL_INIT_HAPTIC+)
               (:SDL_INIT_GAMECONTROLLER +SDL_INIT_GAMECONTROLLER+)
               (:SDL_INIT_EVENTS +SDL_INIT_EVENTS+)
               (:SDL_INIT_EVERYTHING +SDL_INIT_EVERYTHING+)
               (:SDL_INIT_NOPARACHUTE +SDL_INIT_NOPARACHUTE+))))
        (setf c-flags (logior c-flags flag-value))))
    (c-sdl-init c-flags)))

;; -------------------------------------------------
;; Window

(defstruct sdl-window
  (ptr (null-pointer)))

(define-enum-keyword-type sdl-window-flag c-sdl-window-flags)
(define-list-type sdl-window-flag-list sdl-window-flag)

(defun sdl-create-window (title x y w h &optional sdl-window-flag-list)
  (check-type sdl-window-flag-list sdl-window-flag-list)
  (let ((c-flags 0))
    (dolist (flag sdl-window-flag-list)
      (setf c-flags (logior c-flags (foreign-enum-value 'c-sdl-window-flags flag))))
    (with-foreign-string (c-title title)
      (make-sdl-window :ptr (c-sdl-createwindow c-title x y w h c-flags)))))

(defun sdl-destroy-window (sdl-window)
  (c-sdl-destroywindow (sdl-window-ptr sdl-window)))

;; --------------------------------------------------
;; Renderer
(defstruct sdl-renderer
  (ptr (null-pointer)))

(defun sdl-create-renderer (sdl-window flags)
  (let ((c-flags 0))
    (dolist (flag flags)
      (setf c-flags (logior c-flags (foreign-enum-value 'c-sdl-renderer-flags flag))))
    (make-sdl-renderer :ptr (c-sdl-createrenderer (sdl-window-ptr sdl-window)
                                                  -1
                                                  c-flags))))

(defun sdl-renderer-clear (sdl-renderer)
  (c-sdl-renderclear (sdl-renderer-ptr sdl-renderer)))

(defun sdl-renderer-present (sdl-renderer)
  (c-sdl-renderpresent (sdl-renderer-ptr sdl-renderer)))

;; --------------------------------------------------
;; Surface & Texture

(defstruct sdl-texture (ptr (null-pointer)))
(defstruct sdl-surface (ptr (null-pointer)))

(defun sdl-free-surface (surface)
  (c-sdl-freesurface (sdl-surface-ptr surface)))

(defun sdl-create-texture-from-surface (renderer surface)
  (let ((ptr (c-sdl-create-texture-from-surface
              (sdl-renderer-ptr renderer)
              (sdl-surface-ptr surface))))
    (if (null-pointer-p ptr)
        (error 'sdl-error :message (c-sdl-get-error)))
    (make-sdl-texture :ptr ptr)))

(defun sdl-render-copy (renderer texture src-rect dst-rect)
  ""
  (let ((c-src-rect (convert-to-foreign src-rect '(:pointer (:struct c-sdl-rect))))
        (c-dst-rect (convert-to-foreign dst-rect '(:pointer (:struct c-sdl-rect)))))
    (unwind-protect
         (c-sdl-render-copy (sdl-renderer-ptr renderer)
                            (sdl-texture-ptr texture)
                            c-src-rect c-dst-rect)
      (foreign-free c-src-rect)
      (foreign-free c-dst-rect))))

(defun sdl-load-bmp (file-path)
  (with-foreign-string (c-path file-path)
    (with-foreign-string (c-mode "rb")
      (let ((rw-ptr (c-sdl-rw-from-file c-path c-mode)))
        (if (null-pointer-p rw-ptr)
            (error 'sdl-error :message (c-sdl-get-error)))
        (let* ((close-rw 1)
               (surface-ptr (c-sdl-load-bmp-rw rw-ptr close-rw)))
          (if (null-pointer-p surface-ptr)
              (error 'sdl-error :message (c-sdl-get-error)))
          (make-sdl-surface :ptr surface-ptr))))))

;; --------------------------------------------------
;; Keyboard

(defparameter +keymod-values+
  (mapcar (lambda (keyword)
            (list keyword (foreign-enum-value 'c-sdl-keymod keyword)))
          (foreign-enum-keyword-list 'c-sdl-keymod)))

(defun sdl-keymod-list (keymod-num)
  (let ((result '()))
    (dolist (mod +keymod-values+)
      (destructuring-bind (mod-keyword mod-mask) mod
        (if (not (= 0 (logand mod-mask keymod-num)))
            (push mod-keyword result))))
    result))
;; (sdl-keymod-list #b1111111111000011)

(eval-when (:compile-toplevel :load-toplevel)
  (defparameter +mouse-mask-values+
    `((,+SDL_BUTTON_LMASK+ :SDL_BUTTON_LMASK)
      (,+SDL_BUTTON_MMASK+ :SDL_BUTTON_MMASK)
      (,+SDL_BUTTON_RMASK+ :SDL_BUTTON_RMASK)
      (,+SDL_BUTTON_X1MASK+ :SDL_BUTTON_X1MASK)
      (,+SDL_BUTTON_X2MASK+ :SDL_BUTTON_X2MASK))))

(defun sdl-mouse-state-list (mouse-state-num)
  (let ((result '()))
    (dolist (name-and-mask +mouse-mask-values+)
      (destructuring-bind (mask state-name) name-and-mask
        (if (not (= 0 (logand mask mouse-state-num)))
            (push state-name result))))
    result))
;; (sdl-mouse-state-list #b00001)

(defmacro sdl-mouse-button-symbol (mouse-button-num)
  `(case ,mouse-button-num
     ,@+mouse-mask-values+))
;; (sdl-mouse-button-symbol 2)

;; --------------------------------------------------
;; Event

(defun sdl-window-event-plist (c-sdl-event)
  "sdl-window-event-plist

   format:
   (:TYPE :SDL_WINDOWEVENT
    :EVENT SDL_WindowEventID
    :DATA1 num :DATA2 num
    :WINDOWID num :TIMESTAMP num)

   example:
   (:TYPE :SDL_WINDOWEVENT
    :EVENT :SDL_WINDOWEVENT_LEAVE
    :DATA1 0 :DATA2 0
    :WINDOWID 2 :TIMESTAMP 63992)
   "

  (let* ((property (getf (convert-from-foreign c-sdl-event '(:struct c-sdl-event))
                         :window))
         (event (foreign-enum-keyword 'c-sdl-window-event-id (getf property :event))))
    `(:type :SDL_WINDOWEVENT
            :event ,event
            :timestamp ,(getf property :timestamp)
            :windowID ,(getf property :windowID)
            :data1 ,(getf property :data1)
            :data2 ,(getf property :data2))))

(defun sdl-mouse-motion-event-plist (c-sdl-event)
  "sdl-mouse-motion-event-plist

  refer: SDL_MouseMotionEvent

  format:
  (:TYPE :SDL_MOUSEMOTION
   :YREL num :XREL num
   :Y num :X num
   :STATE (button_mask_name ...)
   :WHICH num
   :WINDOWID num :TIMESTAMP num)

  example:
  (:TYPE :SDL_MOUSEMOTION
   :YREL 0 :XREL 0
   :Y 126 :X 3
   :STATE NIL
   :WHICH 0
   :WINDOWID 2 :TIMESTAMP 96811)
  (:TYPE :SDL_MOUSEMOTION
   :YREL -1 :XREL 0
   :Y 146 :X 209
   :STATE (:SDL_BUTTON_LMASK)
   :WHICH 0
   :WINDOWID 2 :TIMESTAMP 63992)
  "
  (let* ((property (getf (convert-from-foreign c-sdl-event '(:struct c-sdl-event))
                         :motion))
         (mouse-state-num (getf property :state)))
    (setf (getf property :type) :SDL_MOUSEMOTION)
    (setf (getf property :state) (sdl-mouse-state-list mouse-state-num))
    property))

(defun sdl-mouse-button-event-plist (c-sdl-event)
  "sdl-mouse-button-event-plist

   format:
   (:TYPE :SDL_MOUSEBUTTONDOWN
    :Y num :X num
    :CLICKS 1|2
    :STATE :SDL_PRESSED|:SDL_RELEASED
    :BUTTON button_mask_name
    :WHICH num
    :WINDOWID num :TIMESTAMP num)

   examples:
   (:TYPE :SDL_MOUSEBUTTONDOWN
    :Y 7 :X 7
    :CLICKS 2
    :STATE :SDL_PRESSED
    :BUTTON :SDL_BUTTON_LMASK
    :WHICH 0
    :WINDOWID 2 :TIMESTAMP 8124)
   (:TYPE :SDL_MOUSEBUTTONUP
    :Y 7 :X 7
    :CLICKS 2
    :STATE :SDL_RELEASED
    :BUTTON :SDL_BUTTON_LMASK
    :WHICH 0
    :WINDOWID 2 :TIMESTAMP 8124)
   "
  (let* ((event-property (convert-from-foreign c-sdl-event '(:struct c-sdl-event)))
         (type (foreign-enum-keyword 'c-sdl-event-type (getf event-property :type)))
         (property (getf event-property :button))
         (button-num (getf property :button))
         (state-num (getf property :state)))
    (setf (getf property :type) type)
    (setf (getf property :button) (sdl-mouse-button-symbol button-num))
    (setf (getf property :state)
          (if (= state-num +SDL_PRESSED+) :SDL_PRESSED :SDL_RELEASED))
    property))

(defun sdl-keyboard-event-plist (c-sdl-event)
  "sdl-keyboard-event-plist

  refer: SDL_KeyboardEvent

  format:
  (:TYPE type
   :KEYSYM (:MOD (SDL_Keymod ...) :sym SDL_keycode :SCANCODE SDL_Scancode)
   :REPEAT 0|1
   :STATE :SDL_PRESSED|:SDL_RELEASED
   :WINDOWID number
   :TIMESTAMP number)

  example:
  (:TYPE :SDL_KEYDOWN
   :KEYSYM (:MOD (:KMOD_NUM) :SYM :SDLK_A :SCANCODE :SDL_SCANCODE_A)
   :REPEAT 0
   :STATE :SDL_PRESSED
   :WINDOWID 2 :TIMESTAMP 96824)
  "
  (let* ((event-property (convert-from-foreign c-sdl-event '(:struct c-sdl-event)))
         (property (getf event-property :key))
         (type (foreign-enum-keyword 'c-sdl-event-type (getf event-property :type)))
         (state-num (getf property :state)))
    (setf (getf property :type) type)
    (setf (getf property :state) (cond ((= state-num +SDL_PRESSED+) :SDL_PRESSED)
                                       ((= state-num +SDL_RELEASED+) :SDL_RELEASED)))
    (let* ((keysym (getf property :keysym))
           (scancode-num (getf keysym :scancode))
           (scancode-keyword
            (foreign-enum-keyword 'c-sdl-scancode-enum scancode-num :errorp nil))
           (sym-num (getf keysym :sym))
           (sym-keyword (foreign-enum-keyword 'c-sdl-keycode-enum sym-num :errorp nil))
           (mod-num (getf keysym :mod)))
      (setf (getf keysym :scancode)
            (if scancode-keyword scancode-keyword :SDL_SCANCODE_UNKNOWN))
      (setf (getf keysym :sym)
            (if sym-keyword sym-keyword :SDLK_UNKNOWN))
      (setf (getf keysym :mod) (sdl-keymod-list mod-num)))
    property))

(defun sdl-event-plist (c-sdl-event)
  (let* ((type-code (foreign-slot-value c-sdl-event '(:struct c-sdl-event) :type))
         (type (foreign-enum-keyword 'c-sdl-event-type type-code)))
    (case type
      (:SDL_WINDOWEVENT (sdl-window-event-plist c-sdl-event))
      (:SDL_MOUSEMOTION (sdl-mouse-motion-event-plist c-sdl-event))
      ((:SDL_MOUSEBUTTONDOWN :SDL_MOUSEBUTTONUP)
       (sdl-mouse-button-event-plist c-sdl-event))
      ((:SDL_KEYUP :SDL_KEYDOWN) (sdl-keyboard-event-plist c-sdl-event))
      (otherwise `(:type ,type)))))

(defun sdl-wait-event ()
  (with-foreign-object (c-sdl-event '(:struct c-sdl-event))
    (let ((return-code (c-sdl-wait-event c-sdl-event)))
      (if (not (= return-code 1))
          (error 'sdl-error :message (c-sdl-get-error)))
      (sdl-event-plist c-sdl-event))))

(defun sdl-poll-event ()
  (with-foreign-object (c-sdl-event '(:struct c-sdl-event))
    (let ((return-code (c-sdl-poll-event c-sdl-event)))
      (if (= return-code 1)
          (sdl-event-plist c-sdl-event)
          nil))))

(defun sdl-poll-event-list ()
  (loop as e = (sdl-poll-event) until (null e) collect e))
