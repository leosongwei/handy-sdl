;; -------------------------------------------------
;; error

(define-condition sdl-error (error)
  ((message :initarg :message :reader sdl-error-message)))
;;(error 'sdl-error :message 2333)

;; -------------------------------------------------

(defun sdl-init (flags)
  (let ((c-flags 0))
    (dolist (flag flags)
      (let ((flag-value (case flag
                          (:video +SDL_INIT_VIDEO+)
                          (otherwise 0))))
        (setf c-flags (logior c-flags flag-value))))
    (c-sdl-init c-flags)))
;; (sdl-init '(:video))

;; -------------------------------------------------
;; Window

(defstruct sdl-window
  (ptr #.(null-pointer)))

(defun sdl-create-window (title x y w h &optional flags)
  (let ((c-flags 0))
    (dolist (flag flags)
      (setf c-flags (logior c-flags (foreign-enum-value 'c-sdl-window-flags flag))))
    (with-foreign-string (c-title title)
      (make-sdl-window :ptr (c-sdl-createwindow c-title x y w h c-flags)))))

(defun sdl-destroy-window (sdl-window)
  (c-sdl-destroywindow (sdl-window-ptr sdl-window)))

;; --------------------------------------------------
;; Renderer
(defstruct sdl-renderer
  (ptr #.(null-pointer)))

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

;; --------------------------------------------------
;; Event

(defun sdl-window-event-plist (c-sdl-event)
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
  (let* ((property (getf (convert-from-foreign c-sdl-event '(:struct c-sdl-event))
                         :motion)))
    (setf (getf property :type) :SDL_MOUSEMOTION)
    property))

(defun sdl-keyboard-event-plist (c-sdl-event)
  (let* ((event-property (convert-from-foreign c-sdl-event '(:struct c-sdl-event)))
         (property (getf event-property :key))
         (type (foreign-enum-keyword 'c-sdl-event-type (getf event-property :type))))
    (setf (getf property :type) type)
    (let* ((keysym (getf property :keysym))
           (scancode-num (getf keysym :scancode))
           (sym-num (getf keysym :sym))
           (mod-num (getf keysym :mod)))
      (setf (getf keysym :scancode)
            (foreign-enum-keyword 'c-sdl-scancode-enum scancode-num :errorp nil))
      (setf (getf keysym :sym)
            (foreign-enum-keyword 'c-sdl-keycode-enum sym-num :errorp nil))
      (setf (getf keysym :mod) (sdl-keymod-list mod-num)))
    property))

(defun sdl-event-plist (c-sdl-event)
  (let* ((type-code (foreign-slot-value c-sdl-event '(:struct c-sdl-event) :type))
         (type (foreign-enum-keyword 'c-sdl-event-type type-code)))
    (case type
      (:SDL_WINDOWEVENT (sdl-window-event-plist c-sdl-event))
      (:SDL_MOUSEMOTION (sdl-mouse-motion-event-plist c-sdl-event))
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
