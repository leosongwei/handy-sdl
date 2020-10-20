(pkg-config-cflags "sdl2")

(include "SDL.h")
(include "SDL_video.h")

(constant (+SDL_INIT_VIDEO+ "SDL_INIT_VIDEO"))


;; consider use some c parser to generate this?
(cenum c-sdl-window-flags
       ((:SDL_WINDOW_FULLSCREEN_DESKTOP "SDL_WINDOW_FULLSCREEN_DESKTOP"))
       ((:SDL_WINDOW_BORDERLESS "SDL_WINDOW_BORDERLESS"))
       ((:SDL_WINDOW_RESIZABLE "SDL_WINDOW_RESIZABLE"))
       ((:SDL_WINDOW_MINIMIZED "SDL_WINDOW_MINIMIZED"))
       ((:SDL_WINDOW_MAXIMIZED "SDL_WINDOW_MAXIMIZED")))

(cenum c-sdl-renderer-flags
       ((:SDL_RENDERER_SOFTWARE "SDL_RENDERER_SOFTWARE"))
       ((:SDL_RENDERER_ACCELERATED "SDL_RENDERER_ACCELERATED"))
       ((:SDL_RENDERER_PRESENTVSYNC "SDL_RENDERER_PRESENTVSYNC"))
       ((:SDL_RENDERER_TARGETTEXTURE "SDL_RENDERER_TARGETTEXTURE")))

(cenum c-sdl-window-event-id
       ((:SDL_WINDOWEVENT_NONE "SDL_WINDOWEVENT_NONE"))
       ((:SDL_WINDOWEVENT_SHOWN "SDL_WINDOWEVENT_SHOWN"))
       ((:SDL_WINDOWEVENT_HIDDEN "SDL_WINDOWEVENT_HIDDEN"))
       ((:SDL_WINDOWEVENT_EXPOSED "SDL_WINDOWEVENT_EXPOSED"))
       ((:SDL_WINDOWEVENT_MOVED "SDL_WINDOWEVENT_MOVED"))
       ((:SDL_WINDOWEVENT_RESIZED "SDL_WINDOWEVENT_RESIZED"))
       ((:SDL_WINDOWEVENT_SIZE_CHANGED "SDL_WINDOWEVENT_SIZE_CHANGED"))
       ((:SDL_WINDOWEVENT_MINIMIZED "SDL_WINDOWEVENT_MINIMIZED"))
       ((:SDL_WINDOWEVENT_MAXIMIZED "SDL_WINDOWEVENT_MAXIMIZED"))
       ((:SDL_WINDOWEVENT_RESTORED "SDL_WINDOWEVENT_RESTORED"))
       ((:SDL_WINDOWEVENT_ENTER "SDL_WINDOWEVENT_ENTER"))
       ((:SDL_WINDOWEVENT_LEAVE "SDL_WINDOWEVENT_LEAVE"))
       ((:SDL_WINDOWEVENT_FOCUS_GAINED "SDL_WINDOWEVENT_FOCUS_GAINED"))
       ((:SDL_WINDOWEVENT_FOCUS_LOST "SDL_WINDOWEVENT_FOCUS_LOST"))
       ((:SDL_WINDOWEVENT_CLOSE "SDL_WINDOWEVENT_CLOSE"))
       ((:SDL_WINDOWEVENT_TAKE_FOCUS "SDL_WINDOWEVENT_TAKE_FOCUS"))
       ((:SDL_WINDOWEVENT_HIT_TEST "SDL_WINDOWEVENT_HIT_TEST")))

(cenum c-sdl-event-type
       ((:SDL_FIRSTEVENT "SDL_FIRSTEVENT"))
       ((:SDL_QUIT "SDL_QUIT"))
       ((:SDL_APP_TERMINATING "SDL_APP_TERMINATING"))
       ((:SDL_APP_LOWMEMORY "SDL_APP_LOWMEMORY"))
       ((:SDL_APP_WILLENTERBACKGROUND "SDL_APP_WILLENTERBACKGROUND"))
       ((:SDL_APP_DIDENTERBACKGROUND "SDL_APP_DIDENTERBACKGROUND"))
       ((:SDL_APP_WILLENTERFOREGROUND "SDL_APP_WILLENTERFOREGROUND"))
       ((:SDL_APP_DIDENTERFOREGROUND "SDL_APP_DIDENTERFOREGROUND"))
       ((:SDL_DISPLAYEVENT "SDL_DISPLAYEVENT"))
       ((:SDL_WINDOWEVENT "SDL_WINDOWEVENT"))
       ((:SDL_SYSWMEVENT "SDL_SYSWMEVENT"))
       ((:SDL_KEYDOWN "SDL_KEYDOWN"))
       ((:SDL_KEYUP "SDL_KEYUP"))
       ((:SDL_TEXTEDITING "SDL_TEXTEDITING"))
       ((:SDL_TEXTINPUT "SDL_TEXTINPUT"))
       ((:SDL_KEYMAPCHANGED "SDL_KEYMAPCHANGED"))
       ((:SDL_MOUSEMOTION "SDL_MOUSEMOTION"))
       ((:SDL_MOUSEBUTTONDOWN "SDL_MOUSEBUTTONDOWN"))
       ((:SDL_MOUSEBUTTONUP "SDL_MOUSEBUTTONUP"))
       ((:SDL_MOUSEWHEEL "SDL_MOUSEWHEEL"))
       ((:SDL_JOYAXISMOTION "SDL_JOYAXISMOTION"))
       ((:SDL_JOYBALLMOTION "SDL_JOYBALLMOTION"))
       ((:SDL_JOYHATMOTION "SDL_JOYHATMOTION"))
       ((:SDL_JOYBUTTONDOWN "SDL_JOYBUTTONDOWN"))
       ((:SDL_JOYBUTTONUP "SDL_JOYBUTTONUP"))
       ((:SDL_JOYDEVICEADDED "SDL_JOYDEVICEADDED"))
       ((:SDL_JOYDEVICEREMOVED "SDL_JOYDEVICEREMOVED"))
       ((:SDL_CONTROLLERAXISMOTION "SDL_CONTROLLERAXISMOTION"))
       ((:SDL_CONTROLLERBUTTONDOWN "SDL_CONTROLLERBUTTONDOWN"))
       ((:SDL_CONTROLLERBUTTONUP "SDL_CONTROLLERBUTTONUP"))
       ((:SDL_CONTROLLERDEVICEADDED "SDL_CONTROLLERDEVICEADDED"))
       ((:SDL_CONTROLLERDEVICEREMOVED "SDL_CONTROLLERDEVICEREMOVED"))
       ((:SDL_CONTROLLERDEVICEREMAPPED "SDL_CONTROLLERDEVICEREMAPPED"))
       ((:SDL_FINGERDOWN "SDL_FINGERDOWN"))
       ((:SDL_FINGERUP "SDL_FINGERUP"))
       ((:SDL_FINGERMOTION "SDL_FINGERMOTION"))
       ((:SDL_DOLLARGESTURE "SDL_DOLLARGESTURE"))
       ((:SDL_DOLLARRECORD "SDL_DOLLARRECORD"))
       ((:SDL_MULTIGESTURE "SDL_MULTIGESTURE"))
       ((:SDL_CLIPBOARDUPDATE "SDL_CLIPBOARDUPDATE"))
       ((:SDL_DROPFILE "SDL_DROPFILE"))
       ((:SDL_DROPTEXT "SDL_DROPTEXT"))
       ((:SDL_DROPBEGIN "SDL_DROPBEGIN"))
       ((:SDL_DROPCOMPLETE "SDL_DROPCOMPLETE"))
       ((:SDL_AUDIODEVICEADDED "SDL_AUDIODEVICEADDED"))
       ((:SDL_AUDIODEVICEREMOVED "SDL_AUDIODEVICEREMOVED"))
       ((:SDL_SENSORUPDATE "SDL_SENSORUPDATE"))
       ((:SDL_RENDER_TARGETS_RESET "SDL_RENDER_TARGETS_RESET"))
       ((:SDL_RENDER_DEVICE_RESET "SDL_RENDER_DEVICE_RESET"))
       ((:SDL_USEREVENT "SDL_USEREVENT"))
       ((:SDL_LASTEVENT "SDL_LASTEVENT")))


(cstruct c-sdl-PixelFormat "SDL_PixelFormat"
         (format "format" :type :uint32)
         (bytes-per-pixel "BytesPerPixel" :type :uint8)
         (r-mask "Rmask" :type :uint32)
         (g-mask "Gmask" :type :uint32)
         (b-mask "Bmask" :type :uint32)
         (a-mask "Amask" :type :uint32))

(cstruct c-sdl-Surface "SDL_Surface"
         (format "format" :type (:pointer (:struct c-sdl-pixelformat)))
         (w "w" :type :int)
         (h "h" :type :int)
         (pixels "pixels" :type :pointer)
         (clip-rect "clip_rect" :type :pointer) ;; SDL_Rect
         (refcount "refcount" :type :int))

(cstruct c-sdl-rect "SDL_Rect"
         (x "x" :type :int)
         (y "y" :type :int)
         (w "w" :type :int)
         (h "h" :type :int))

;; ---------------------------------------------
;; Keyboard

(cstruct c-sdl-keysym "SDL_Keysym"
         (:scancode "scancode" :type c-sdl-scancode)
         (:sym "sym" :type c-sdl-keycode)
         (:mod "mod" :type :uint16))

(constant (+SDL_PRESSED+ "SDL_PRESSED"))
(constant (+SDL_RELEASED+ "SDL_RELEASED"))

;; ---------------------------------------------
;; Event

(cstruct c-sdl-window-event "SDL_WindowEvent"
         (:type "type" :type :uint32)
         (:timestamp "timestamp" :type :uint32)
         (:windowID "windowID" :type :uint32)
         (:event "event" :type :uint8)
         (:data1 "data1" :type :int32)
         (:data2 "data2" :type :int32))

(cstruct c-sdl-keyboard-event "SDL_KeyboardEvent"
         (:type "type" :type :uint32)
         (:timestamp "timestamp" :type :uint32)
         (:windowID "windowID" :type :uint32)
         (:state "state" :type :uint8)
         (:repeat "repeat" :type :uint8)
         (:keysym "keysym" :type (:struct c-sdl-keysym)))

(cstruct c-sdl-mouse-motion-event "SDL_MouseMotionEvent"
         (:type "type" :type :uint32)
         (:timestamp "timestamp" :type :uint32)
         (:windowID "windowID" :type :uint32)
         (:which "which" :type :uint32)
         (:state "state" :type :uint32)
         (:x "x" :type :int32)
         (:y "y" :type :int32)
         (:xrel "xrel" :type :int)
         (:yrel "yrel" :type :int))

(cstruct c-sdl-event "SDL_Event"
         (:type "type" :type :uint32)
         (:window "window" :type (:struct c-sdl-window-event))
         (:key "key" :type (:struct c-sdl-keyboard-event))
         (:motion "motion" :type (:struct c-sdl-mouse-motion-event)))
