(asdf:defsystem #:handy-sdl
  :description "SDL2 binding, using cffi and cffi-grovel"
  :author "Song Wei <leo_songwei@outlook.com>"
  :license "MIT"
  :defsystem-depends-on ("cffi-grovel")
  :depends-on (:cffi :cffi-grovel)
  :serial t
  :components
  ((:file "package")
   (:file "utils")
   (:cffi-grovel-file "sdl-keyboard-grovel")
   (:cffi-grovel-file "sdl-opengl-grovel")
   (:cffi-grovel-file "sdl-grovel")
   (:file "sdl-binding")
   (:file "sdl-wrapper")
   (:file "sdl-opengl")))
