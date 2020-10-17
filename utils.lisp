(defun assign-to-foreign (ptr root-type value-tree)
  (assert (= 0 (mod (length value-tree) 2)))
  (let ((values (copy-tree value-tree)))
    (dotimes (_ (/ (length values) 2))
      (let* ((slot-name (pop values))
             (slot-value (pop values))
             (slot-type (foreign-slot-type root-type slot-name)))
        (if (consp slot-value)
            (let ((obj (null-pointer)))
              (unwind-protect
                   (progn (setf obj (convert-to-foreign slot-value slot-type))
                          (setf (foreign-slot-value ptr root-type slot-name) obj))
                (foreign-free obj)))
            (setf (foreign-slot-value ptr root-type slot-name) slot-value))))))

;; (let* ((c (ffmpeg-avcodec-alloc-context3
;;            (ffmpeg-find-encoder-by-name "libx264")))
;;        (ptr (ffmpeg-avcodec-context-ptr c))
;;        (type '(:struct c-ffmpeg-avcodeccontext)))
;;   (assign-to-foreign ptr type
;;                      '(width 1920
;;                        height 1080
;;                        bit-rate 1500000
;;                        bit-rate-tolerance 500000
;;                        time-base (num 1 den 20)
;;                        framerate (num 20 den 1)
;;                        av-pixel-format :AV_PIX_FMT_RGB24))
;;   (convert-from-foreign ptr type))

(defun copy-foreign-object (src dst type)
  (let ((size-in-byte (foreign-type-size type)))
    (dotimes (i size-in-byte)
      (setf (mem-aref dst :uint8 i) (mem-aref src :uint8 i)))))

