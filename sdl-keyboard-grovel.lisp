(in-package :handy-sdl)

(pkg-config-cflags "sdl2")
(include "SDL_scancode.h")
(include "SDL_keycode.h")

(ctype c-sdl-scancode "SDL_Scancode")

(cenum c-sdl-scancode-enum
       ((:SDL_SCANCODE_UNKNOWN "SDL_SCANCODE_UNKNOWN"))
       ((:SDL_SCANCODE_A "SDL_SCANCODE_A"))
       ((:SDL_SCANCODE_B "SDL_SCANCODE_B"))
       ((:SDL_SCANCODE_C "SDL_SCANCODE_C"))
       ((:SDL_SCANCODE_D "SDL_SCANCODE_D"))
       ((:SDL_SCANCODE_E "SDL_SCANCODE_E"))
       ((:SDL_SCANCODE_F "SDL_SCANCODE_F"))
       ((:SDL_SCANCODE_G "SDL_SCANCODE_G"))
       ((:SDL_SCANCODE_H "SDL_SCANCODE_H"))
       ((:SDL_SCANCODE_I "SDL_SCANCODE_I"))
       ((:SDL_SCANCODE_J "SDL_SCANCODE_J"))
       ((:SDL_SCANCODE_K "SDL_SCANCODE_K"))
       ((:SDL_SCANCODE_L "SDL_SCANCODE_L"))
       ((:SDL_SCANCODE_M "SDL_SCANCODE_M"))
       ((:SDL_SCANCODE_N "SDL_SCANCODE_N"))
       ((:SDL_SCANCODE_O "SDL_SCANCODE_O"))
       ((:SDL_SCANCODE_P "SDL_SCANCODE_P"))
       ((:SDL_SCANCODE_Q "SDL_SCANCODE_Q"))
       ((:SDL_SCANCODE_R "SDL_SCANCODE_R"))
       ((:SDL_SCANCODE_S "SDL_SCANCODE_S"))
       ((:SDL_SCANCODE_T "SDL_SCANCODE_T"))
       ((:SDL_SCANCODE_U "SDL_SCANCODE_U"))
       ((:SDL_SCANCODE_V "SDL_SCANCODE_V"))
       ((:SDL_SCANCODE_W "SDL_SCANCODE_W"))
       ((:SDL_SCANCODE_X "SDL_SCANCODE_X"))
       ((:SDL_SCANCODE_Y "SDL_SCANCODE_Y"))
       ((:SDL_SCANCODE_Z "SDL_SCANCODE_Z"))
       ((:SDL_SCANCODE_1 "SDL_SCANCODE_1"))
       ((:SDL_SCANCODE_2 "SDL_SCANCODE_2"))
       ((:SDL_SCANCODE_3 "SDL_SCANCODE_3"))
       ((:SDL_SCANCODE_4 "SDL_SCANCODE_4"))
       ((:SDL_SCANCODE_5 "SDL_SCANCODE_5"))
       ((:SDL_SCANCODE_6 "SDL_SCANCODE_6"))
       ((:SDL_SCANCODE_7 "SDL_SCANCODE_7"))
       ((:SDL_SCANCODE_8 "SDL_SCANCODE_8"))
       ((:SDL_SCANCODE_9 "SDL_SCANCODE_9"))
       ((:SDL_SCANCODE_0 "SDL_SCANCODE_0"))
       ((:SDL_SCANCODE_RETURN "SDL_SCANCODE_RETURN"))
       ((:SDL_SCANCODE_ESCAPE "SDL_SCANCODE_ESCAPE"))
       ((:SDL_SCANCODE_BACKSPACE "SDL_SCANCODE_BACKSPACE"))
       ((:SDL_SCANCODE_TAB "SDL_SCANCODE_TAB"))
       ((:SDL_SCANCODE_SPACE "SDL_SCANCODE_SPACE"))
       ((:SDL_SCANCODE_MINUS "SDL_SCANCODE_MINUS"))
       ((:SDL_SCANCODE_EQUALS "SDL_SCANCODE_EQUALS"))
       ((:SDL_SCANCODE_LEFTBRACKET "SDL_SCANCODE_LEFTBRACKET"))
       ((:SDL_SCANCODE_RIGHTBRACKET "SDL_SCANCODE_RIGHTBRACKET"))
       ((:SDL_SCANCODE_BACKSLASH "SDL_SCANCODE_BACKSLASH"))
       ((:SDL_SCANCODE_NONUSHASH "SDL_SCANCODE_NONUSHASH"))
       ((:SDL_SCANCODE_SEMICOLON "SDL_SCANCODE_SEMICOLON"))
       ((:SDL_SCANCODE_APOSTROPHE "SDL_SCANCODE_APOSTROPHE"))
       ((:SDL_SCANCODE_GRAVE "SDL_SCANCODE_GRAVE"))
       ((:SDL_SCANCODE_COMMA "SDL_SCANCODE_COMMA"))
       ((:SDL_SCANCODE_PERIOD "SDL_SCANCODE_PERIOD"))
       ((:SDL_SCANCODE_SLASH "SDL_SCANCODE_SLASH"))
       ((:SDL_SCANCODE_CAPSLOCK "SDL_SCANCODE_CAPSLOCK"))
       ((:SDL_SCANCODE_F1 "SDL_SCANCODE_F1"))
       ((:SDL_SCANCODE_F2 "SDL_SCANCODE_F2"))
       ((:SDL_SCANCODE_F3 "SDL_SCANCODE_F3"))
       ((:SDL_SCANCODE_F4 "SDL_SCANCODE_F4"))
       ((:SDL_SCANCODE_F5 "SDL_SCANCODE_F5"))
       ((:SDL_SCANCODE_F6 "SDL_SCANCODE_F6"))
       ((:SDL_SCANCODE_F7 "SDL_SCANCODE_F7"))
       ((:SDL_SCANCODE_F8 "SDL_SCANCODE_F8"))
       ((:SDL_SCANCODE_F9 "SDL_SCANCODE_F9"))
       ((:SDL_SCANCODE_F10 "SDL_SCANCODE_F10"))
       ((:SDL_SCANCODE_F11 "SDL_SCANCODE_F11"))
       ((:SDL_SCANCODE_F12 "SDL_SCANCODE_F12"))
       ((:SDL_SCANCODE_PRINTSCREEN "SDL_SCANCODE_PRINTSCREEN"))
       ((:SDL_SCANCODE_SCROLLLOCK "SDL_SCANCODE_SCROLLLOCK"))
       ((:SDL_SCANCODE_PAUSE "SDL_SCANCODE_PAUSE"))
       ((:SDL_SCANCODE_INSERT "SDL_SCANCODE_INSERT"))
       ((:SDL_SCANCODE_HOME "SDL_SCANCODE_HOME"))
       ((:SDL_SCANCODE_PAGEUP "SDL_SCANCODE_PAGEUP"))
       ((:SDL_SCANCODE_DELETE "SDL_SCANCODE_DELETE"))
       ((:SDL_SCANCODE_END "SDL_SCANCODE_END"))
       ((:SDL_SCANCODE_PAGEDOWN "SDL_SCANCODE_PAGEDOWN"))
       ((:SDL_SCANCODE_RIGHT "SDL_SCANCODE_RIGHT"))
       ((:SDL_SCANCODE_LEFT "SDL_SCANCODE_LEFT"))
       ((:SDL_SCANCODE_DOWN "SDL_SCANCODE_DOWN"))
       ((:SDL_SCANCODE_UP "SDL_SCANCODE_UP"))
       ((:SDL_SCANCODE_NUMLOCKCLEAR "SDL_SCANCODE_NUMLOCKCLEAR"))
       ((:SDL_SCANCODE_KP_DIVIDE "SDL_SCANCODE_KP_DIVIDE"))
       ((:SDL_SCANCODE_KP_MULTIPLY "SDL_SCANCODE_KP_MULTIPLY"))
       ((:SDL_SCANCODE_KP_MINUS "SDL_SCANCODE_KP_MINUS"))
       ((:SDL_SCANCODE_KP_PLUS "SDL_SCANCODE_KP_PLUS"))
       ((:SDL_SCANCODE_KP_ENTER "SDL_SCANCODE_KP_ENTER"))
       ((:SDL_SCANCODE_KP_1 "SDL_SCANCODE_KP_1"))
       ((:SDL_SCANCODE_KP_2 "SDL_SCANCODE_KP_2"))
       ((:SDL_SCANCODE_KP_3 "SDL_SCANCODE_KP_3"))
       ((:SDL_SCANCODE_KP_4 "SDL_SCANCODE_KP_4"))
       ((:SDL_SCANCODE_KP_5 "SDL_SCANCODE_KP_5"))
       ((:SDL_SCANCODE_KP_6 "SDL_SCANCODE_KP_6"))
       ((:SDL_SCANCODE_KP_7 "SDL_SCANCODE_KP_7"))
       ((:SDL_SCANCODE_KP_8 "SDL_SCANCODE_KP_8"))
       ((:SDL_SCANCODE_KP_9 "SDL_SCANCODE_KP_9"))
       ((:SDL_SCANCODE_KP_0 "SDL_SCANCODE_KP_0"))
       ((:SDL_SCANCODE_KP_PERIOD "SDL_SCANCODE_KP_PERIOD"))
       ((:SDL_SCANCODE_NONUSBACKSLASH "SDL_SCANCODE_NONUSBACKSLASH"))
       ((:SDL_SCANCODE_APPLICATION "SDL_SCANCODE_APPLICATION"))
       ((:SDL_SCANCODE_POWER "SDL_SCANCODE_POWER"))
       ((:SDL_SCANCODE_KP_EQUALS "SDL_SCANCODE_KP_EQUALS"))
       ((:SDL_SCANCODE_F13 "SDL_SCANCODE_F13"))
       ((:SDL_SCANCODE_F14 "SDL_SCANCODE_F14"))
       ((:SDL_SCANCODE_F15 "SDL_SCANCODE_F15"))
       ((:SDL_SCANCODE_F16 "SDL_SCANCODE_F16"))
       ((:SDL_SCANCODE_F17 "SDL_SCANCODE_F17"))
       ((:SDL_SCANCODE_F18 "SDL_SCANCODE_F18"))
       ((:SDL_SCANCODE_F19 "SDL_SCANCODE_F19"))
       ((:SDL_SCANCODE_F20 "SDL_SCANCODE_F20"))
       ((:SDL_SCANCODE_F21 "SDL_SCANCODE_F21"))
       ((:SDL_SCANCODE_F22 "SDL_SCANCODE_F22"))
       ((:SDL_SCANCODE_F23 "SDL_SCANCODE_F23"))
       ((:SDL_SCANCODE_F24 "SDL_SCANCODE_F24"))
       ((:SDL_SCANCODE_EXECUTE "SDL_SCANCODE_EXECUTE"))
       ((:SDL_SCANCODE_HELP "SDL_SCANCODE_HELP"))
       ((:SDL_SCANCODE_MENU "SDL_SCANCODE_MENU"))
       ((:SDL_SCANCODE_SELECT "SDL_SCANCODE_SELECT"))
       ((:SDL_SCANCODE_STOP "SDL_SCANCODE_STOP"))
       ((:SDL_SCANCODE_AGAIN "SDL_SCANCODE_AGAIN"))
       ((:SDL_SCANCODE_UNDO "SDL_SCANCODE_UNDO"))
       ((:SDL_SCANCODE_CUT "SDL_SCANCODE_CUT"))
       ((:SDL_SCANCODE_COPY "SDL_SCANCODE_COPY"))
       ((:SDL_SCANCODE_PASTE "SDL_SCANCODE_PASTE"))
       ((:SDL_SCANCODE_FIND "SDL_SCANCODE_FIND"))
       ((:SDL_SCANCODE_MUTE "SDL_SCANCODE_MUTE"))
       ((:SDL_SCANCODE_VOLUMEUP "SDL_SCANCODE_VOLUMEUP"))
       ((:SDL_SCANCODE_VOLUMEDOWN "SDL_SCANCODE_VOLUMEDOWN"))
       ((:SDL_SCANCODE_KP_COMMA "SDL_SCANCODE_KP_COMMA"))
       ((:SDL_SCANCODE_KP_EQUALSAS400 "SDL_SCANCODE_KP_EQUALSAS400"))
       ((:SDL_SCANCODE_INTERNATIONAL1 "SDL_SCANCODE_INTERNATIONAL1"))
       ((:SDL_SCANCODE_INTERNATIONAL2 "SDL_SCANCODE_INTERNATIONAL2"))
       ((:SDL_SCANCODE_INTERNATIONAL3 "SDL_SCANCODE_INTERNATIONAL3"))
       ((:SDL_SCANCODE_INTERNATIONAL4 "SDL_SCANCODE_INTERNATIONAL4"))
       ((:SDL_SCANCODE_INTERNATIONAL5 "SDL_SCANCODE_INTERNATIONAL5"))
       ((:SDL_SCANCODE_INTERNATIONAL6 "SDL_SCANCODE_INTERNATIONAL6"))
       ((:SDL_SCANCODE_INTERNATIONAL7 "SDL_SCANCODE_INTERNATIONAL7"))
       ((:SDL_SCANCODE_INTERNATIONAL8 "SDL_SCANCODE_INTERNATIONAL8"))
       ((:SDL_SCANCODE_INTERNATIONAL9 "SDL_SCANCODE_INTERNATIONAL9"))
       ((:SDL_SCANCODE_LANG1 "SDL_SCANCODE_LANG1"))
       ((:SDL_SCANCODE_LANG2 "SDL_SCANCODE_LANG2"))
       ((:SDL_SCANCODE_LANG3 "SDL_SCANCODE_LANG3"))
       ((:SDL_SCANCODE_LANG4 "SDL_SCANCODE_LANG4"))
       ((:SDL_SCANCODE_LANG5 "SDL_SCANCODE_LANG5"))
       ((:SDL_SCANCODE_LANG6 "SDL_SCANCODE_LANG6"))
       ((:SDL_SCANCODE_LANG7 "SDL_SCANCODE_LANG7"))
       ((:SDL_SCANCODE_LANG8 "SDL_SCANCODE_LANG8"))
       ((:SDL_SCANCODE_LANG9 "SDL_SCANCODE_LANG9"))
       ((:SDL_SCANCODE_ALTERASE "SDL_SCANCODE_ALTERASE"))
       ((:SDL_SCANCODE_SYSREQ "SDL_SCANCODE_SYSREQ"))
       ((:SDL_SCANCODE_CANCEL "SDL_SCANCODE_CANCEL"))
       ((:SDL_SCANCODE_CLEAR "SDL_SCANCODE_CLEAR"))
       ((:SDL_SCANCODE_PRIOR "SDL_SCANCODE_PRIOR"))
       ((:SDL_SCANCODE_RETURN2 "SDL_SCANCODE_RETURN2"))
       ((:SDL_SCANCODE_SEPARATOR "SDL_SCANCODE_SEPARATOR"))
       ((:SDL_SCANCODE_OUT "SDL_SCANCODE_OUT"))
       ((:SDL_SCANCODE_OPER "SDL_SCANCODE_OPER"))
       ((:SDL_SCANCODE_CLEARAGAIN "SDL_SCANCODE_CLEARAGAIN"))
       ((:SDL_SCANCODE_CRSEL "SDL_SCANCODE_CRSEL"))
       ((:SDL_SCANCODE_EXSEL "SDL_SCANCODE_EXSEL"))
       ((:SDL_SCANCODE_KP_00 "SDL_SCANCODE_KP_00"))
       ((:SDL_SCANCODE_KP_000 "SDL_SCANCODE_KP_000"))
       ((:SDL_SCANCODE_THOUSANDSSEPARATOR "SDL_SCANCODE_THOUSANDSSEPARATOR"))
       ((:SDL_SCANCODE_DECIMALSEPARATOR "SDL_SCANCODE_DECIMALSEPARATOR"))
       ((:SDL_SCANCODE_CURRENCYUNIT "SDL_SCANCODE_CURRENCYUNIT"))
       ((:SDL_SCANCODE_CURRENCYSUBUNIT "SDL_SCANCODE_CURRENCYSUBUNIT"))
       ((:SDL_SCANCODE_KP_LEFTPAREN "SDL_SCANCODE_KP_LEFTPAREN"))
       ((:SDL_SCANCODE_KP_RIGHTPAREN "SDL_SCANCODE_KP_RIGHTPAREN"))
       ((:SDL_SCANCODE_KP_LEFTBRACE "SDL_SCANCODE_KP_LEFTBRACE"))
       ((:SDL_SCANCODE_KP_RIGHTBRACE "SDL_SCANCODE_KP_RIGHTBRACE"))
       ((:SDL_SCANCODE_KP_TAB "SDL_SCANCODE_KP_TAB"))
       ((:SDL_SCANCODE_KP_BACKSPACE "SDL_SCANCODE_KP_BACKSPACE"))
       ((:SDL_SCANCODE_KP_A "SDL_SCANCODE_KP_A"))
       ((:SDL_SCANCODE_KP_B "SDL_SCANCODE_KP_B"))
       ((:SDL_SCANCODE_KP_C "SDL_SCANCODE_KP_C"))
       ((:SDL_SCANCODE_KP_D "SDL_SCANCODE_KP_D"))
       ((:SDL_SCANCODE_KP_E "SDL_SCANCODE_KP_E"))
       ((:SDL_SCANCODE_KP_F "SDL_SCANCODE_KP_F"))
       ((:SDL_SCANCODE_KP_XOR "SDL_SCANCODE_KP_XOR"))
       ((:SDL_SCANCODE_KP_POWER "SDL_SCANCODE_KP_POWER"))
       ((:SDL_SCANCODE_KP_PERCENT "SDL_SCANCODE_KP_PERCENT"))
       ((:SDL_SCANCODE_KP_LESS "SDL_SCANCODE_KP_LESS"))
       ((:SDL_SCANCODE_KP_GREATER "SDL_SCANCODE_KP_GREATER"))
       ((:SDL_SCANCODE_KP_AMPERSAND "SDL_SCANCODE_KP_AMPERSAND"))
       ((:SDL_SCANCODE_KP_DBLAMPERSAND "SDL_SCANCODE_KP_DBLAMPERSAND"))
       ((:SDL_SCANCODE_KP_VERTICALBAR "SDL_SCANCODE_KP_VERTICALBAR"))
       ((:SDL_SCANCODE_KP_DBLVERTICALBAR "SDL_SCANCODE_KP_DBLVERTICALBAR"))
       ((:SDL_SCANCODE_KP_COLON "SDL_SCANCODE_KP_COLON"))
       ((:SDL_SCANCODE_KP_HASH "SDL_SCANCODE_KP_HASH"))
       ((:SDL_SCANCODE_KP_SPACE "SDL_SCANCODE_KP_SPACE"))
       ((:SDL_SCANCODE_KP_AT "SDL_SCANCODE_KP_AT"))
       ((:SDL_SCANCODE_KP_EXCLAM "SDL_SCANCODE_KP_EXCLAM"))
       ((:SDL_SCANCODE_KP_MEMSTORE "SDL_SCANCODE_KP_MEMSTORE"))
       ((:SDL_SCANCODE_KP_MEMRECALL "SDL_SCANCODE_KP_MEMRECALL"))
       ((:SDL_SCANCODE_KP_MEMCLEAR "SDL_SCANCODE_KP_MEMCLEAR"))
       ((:SDL_SCANCODE_KP_MEMADD "SDL_SCANCODE_KP_MEMADD"))
       ((:SDL_SCANCODE_KP_MEMSUBTRACT "SDL_SCANCODE_KP_MEMSUBTRACT"))
       ((:SDL_SCANCODE_KP_MEMMULTIPLY "SDL_SCANCODE_KP_MEMMULTIPLY"))
       ((:SDL_SCANCODE_KP_MEMDIVIDE "SDL_SCANCODE_KP_MEMDIVIDE"))
       ((:SDL_SCANCODE_KP_PLUSMINUS "SDL_SCANCODE_KP_PLUSMINUS"))
       ((:SDL_SCANCODE_KP_CLEAR "SDL_SCANCODE_KP_CLEAR"))
       ((:SDL_SCANCODE_KP_CLEARENTRY "SDL_SCANCODE_KP_CLEARENTRY"))
       ((:SDL_SCANCODE_KP_BINARY "SDL_SCANCODE_KP_BINARY"))
       ((:SDL_SCANCODE_KP_OCTAL "SDL_SCANCODE_KP_OCTAL"))
       ((:SDL_SCANCODE_KP_DECIMAL "SDL_SCANCODE_KP_DECIMAL"))
       ((:SDL_SCANCODE_KP_HEXADECIMAL "SDL_SCANCODE_KP_HEXADECIMAL"))
       ((:SDL_SCANCODE_LCTRL "SDL_SCANCODE_LCTRL"))
       ((:SDL_SCANCODE_LSHIFT "SDL_SCANCODE_LSHIFT"))
       ((:SDL_SCANCODE_LALT "SDL_SCANCODE_LALT"))
       ((:SDL_SCANCODE_LGUI "SDL_SCANCODE_LGUI"))
       ((:SDL_SCANCODE_RCTRL "SDL_SCANCODE_RCTRL"))
       ((:SDL_SCANCODE_RSHIFT "SDL_SCANCODE_RSHIFT"))
       ((:SDL_SCANCODE_RALT "SDL_SCANCODE_RALT"))
       ((:SDL_SCANCODE_RGUI "SDL_SCANCODE_RGUI"))
       ((:SDL_SCANCODE_MODE "SDL_SCANCODE_MODE"))
       ((:SDL_SCANCODE_AUDIONEXT "SDL_SCANCODE_AUDIONEXT"))
       ((:SDL_SCANCODE_AUDIOPREV "SDL_SCANCODE_AUDIOPREV"))
       ((:SDL_SCANCODE_AUDIOSTOP "SDL_SCANCODE_AUDIOSTOP"))
       ((:SDL_SCANCODE_AUDIOPLAY "SDL_SCANCODE_AUDIOPLAY"))
       ((:SDL_SCANCODE_AUDIOMUTE "SDL_SCANCODE_AUDIOMUTE"))
       ((:SDL_SCANCODE_MEDIASELECT "SDL_SCANCODE_MEDIASELECT"))
       ((:SDL_SCANCODE_WWW "SDL_SCANCODE_WWW"))
       ((:SDL_SCANCODE_MAIL "SDL_SCANCODE_MAIL"))
       ((:SDL_SCANCODE_CALCULATOR "SDL_SCANCODE_CALCULATOR"))
       ((:SDL_SCANCODE_COMPUTER "SDL_SCANCODE_COMPUTER"))
       ((:SDL_SCANCODE_AC_SEARCH "SDL_SCANCODE_AC_SEARCH"))
       ((:SDL_SCANCODE_AC_HOME "SDL_SCANCODE_AC_HOME"))
       ((:SDL_SCANCODE_AC_BACK "SDL_SCANCODE_AC_BACK"))
       ((:SDL_SCANCODE_AC_FORWARD "SDL_SCANCODE_AC_FORWARD"))
       ((:SDL_SCANCODE_AC_STOP "SDL_SCANCODE_AC_STOP"))
       ((:SDL_SCANCODE_AC_REFRESH "SDL_SCANCODE_AC_REFRESH"))
       ((:SDL_SCANCODE_AC_BOOKMARKS "SDL_SCANCODE_AC_BOOKMARKS"))
       ((:SDL_SCANCODE_BRIGHTNESSDOWN "SDL_SCANCODE_BRIGHTNESSDOWN"))
       ((:SDL_SCANCODE_BRIGHTNESSUP "SDL_SCANCODE_BRIGHTNESSUP"))
       ((:SDL_SCANCODE_DISPLAYSWITCH "SDL_SCANCODE_DISPLAYSWITCH"))
       ((:SDL_SCANCODE_KBDILLUMTOGGLE "SDL_SCANCODE_KBDILLUMTOGGLE"))
       ((:SDL_SCANCODE_KBDILLUMDOWN "SDL_SCANCODE_KBDILLUMDOWN"))
       ((:SDL_SCANCODE_KBDILLUMUP "SDL_SCANCODE_KBDILLUMUP"))
       ((:SDL_SCANCODE_EJECT "SDL_SCANCODE_EJECT"))
       ((:SDL_SCANCODE_SLEEP "SDL_SCANCODE_SLEEP"))
       ((:SDL_SCANCODE_APP1 "SDL_SCANCODE_APP1"))
       ((:SDL_SCANCODE_APP2 "SDL_SCANCODE_APP2"))
       ((:SDL_SCANCODE_AUDIOREWIND "SDL_SCANCODE_AUDIOREWIND"))
       ((:SDL_SCANCODE_AUDIOFASTFORWARD "SDL_SCANCODE_AUDIOFASTFORWARD"))
       ((:SDL_NUM_SCANCODES "SDL_NUM_SCANCODES")))

(ctype c-sdl-keycode "SDL_Keycode")

(cenum c-sdl-keycode-enum
       ((:SDLK_UNKNOWN "SDLK_UNKNOWN"))
       ((:SDLK_RETURN "SDLK_RETURN"))
       ((:SDLK_ESCAPE "SDLK_ESCAPE"))
       ((:SDLK_BACKSPACE "SDLK_BACKSPACE"))
       ((:SDLK_TAB "SDLK_TAB"))
       ((:SDLK_SPACE "SDLK_SPACE"))
       ((:SDLK_EXCLAIM "SDLK_EXCLAIM"))
       ((:SDLK_QUOTEDBL "SDLK_QUOTEDBL"))
       ((:SDLK_HASH "SDLK_HASH"))
       ((:SDLK_PERCENT "SDLK_PERCENT"))
       ((:SDLK_DOLLAR "SDLK_DOLLAR"))
       ((:SDLK_AMPERSAND "SDLK_AMPERSAND"))
       ((:SDLK_QUOTE "SDLK_QUOTE"))
       ((:SDLK_LEFTPAREN "SDLK_LEFTPAREN"))
       ((:SDLK_RIGHTPAREN "SDLK_RIGHTPAREN"))
       ((:SDLK_ASTERISK "SDLK_ASTERISK"))
       ((:SDLK_PLUS "SDLK_PLUS"))
       ((:SDLK_COMMA "SDLK_COMMA"))
       ((:SDLK_MINUS "SDLK_MINUS"))
       ((:SDLK_PERIOD "SDLK_PERIOD"))
       ((:SDLK_SLASH "SDLK_SLASH"))
       ((:SDLK_0 "SDLK_0"))
       ((:SDLK_1 "SDLK_1"))
       ((:SDLK_2 "SDLK_2"))
       ((:SDLK_3 "SDLK_3"))
       ((:SDLK_4 "SDLK_4"))
       ((:SDLK_5 "SDLK_5"))
       ((:SDLK_6 "SDLK_6"))
       ((:SDLK_7 "SDLK_7"))
       ((:SDLK_8 "SDLK_8"))
       ((:SDLK_9 "SDLK_9"))
       ((:SDLK_COLON "SDLK_COLON"))
       ((:SDLK_SEMICOLON "SDLK_SEMICOLON"))
       ((:SDLK_LESS "SDLK_LESS"))
       ((:SDLK_EQUALS "SDLK_EQUALS"))
       ((:SDLK_GREATER "SDLK_GREATER"))
       ((:SDLK_QUESTION "SDLK_QUESTION"))
       ((:SDLK_AT "SDLK_AT"))
       ((:SDLK_LEFTBRACKET "SDLK_LEFTBRACKET"))
       ((:SDLK_BACKSLASH "SDLK_BACKSLASH"))
       ((:SDLK_RIGHTBRACKET "SDLK_RIGHTBRACKET"))
       ((:SDLK_CARET "SDLK_CARET"))
       ((:SDLK_UNDERSCORE "SDLK_UNDERSCORE"))
       ((:SDLK_BACKQUOTE "SDLK_BACKQUOTE"))
       ((:SDLK_a "SDLK_a"))
       ((:SDLK_b "SDLK_b"))
       ((:SDLK_c "SDLK_c"))
       ((:SDLK_d "SDLK_d"))
       ((:SDLK_e "SDLK_e"))
       ((:SDLK_f "SDLK_f"))
       ((:SDLK_g "SDLK_g"))
       ((:SDLK_h "SDLK_h"))
       ((:SDLK_i "SDLK_i"))
       ((:SDLK_j "SDLK_j"))
       ((:SDLK_k "SDLK_k"))
       ((:SDLK_l "SDLK_l"))
       ((:SDLK_m "SDLK_m"))
       ((:SDLK_n "SDLK_n"))
       ((:SDLK_o "SDLK_o"))
       ((:SDLK_p "SDLK_p"))
       ((:SDLK_q "SDLK_q"))
       ((:SDLK_r "SDLK_r"))
       ((:SDLK_s "SDLK_s"))
       ((:SDLK_t "SDLK_t"))
       ((:SDLK_u "SDLK_u"))
       ((:SDLK_v "SDLK_v"))
       ((:SDLK_w "SDLK_w"))
       ((:SDLK_x "SDLK_x"))
       ((:SDLK_y "SDLK_y"))
       ((:SDLK_z "SDLK_z"))
       ((:SDLK_CAPSLOCK "SDLK_CAPSLOCK"))
       ((:SDLK_F1 "SDLK_F1"))
       ((:SDLK_F2 "SDLK_F2"))
       ((:SDLK_F3 "SDLK_F3"))
       ((:SDLK_F4 "SDLK_F4"))
       ((:SDLK_F5 "SDLK_F5"))
       ((:SDLK_F6 "SDLK_F6"))
       ((:SDLK_F7 "SDLK_F7"))
       ((:SDLK_F8 "SDLK_F8"))
       ((:SDLK_F9 "SDLK_F9"))
       ((:SDLK_F10 "SDLK_F10"))
       ((:SDLK_F11 "SDLK_F11"))
       ((:SDLK_F12 "SDLK_F12"))
       ((:SDLK_PRINTSCREEN "SDLK_PRINTSCREEN"))
       ((:SDLK_SCROLLLOCK "SDLK_SCROLLLOCK"))
       ((:SDLK_PAUSE "SDLK_PAUSE"))
       ((:SDLK_INSERT "SDLK_INSERT"))
       ((:SDLK_HOME "SDLK_HOME"))
       ((:SDLK_PAGEUP "SDLK_PAGEUP"))
       ((:SDLK_DELETE "SDLK_DELETE"))
       ((:SDLK_END "SDLK_END"))
       ((:SDLK_PAGEDOWN "SDLK_PAGEDOWN"))
       ((:SDLK_RIGHT "SDLK_RIGHT"))
       ((:SDLK_LEFT "SDLK_LEFT"))
       ((:SDLK_DOWN "SDLK_DOWN"))
       ((:SDLK_UP "SDLK_UP"))
       ((:SDLK_NUMLOCKCLEAR "SDLK_NUMLOCKCLEAR"))
       ((:SDLK_KP_DIVIDE "SDLK_KP_DIVIDE"))
       ((:SDLK_KP_MULTIPLY "SDLK_KP_MULTIPLY"))
       ((:SDLK_KP_MINUS "SDLK_KP_MINUS"))
       ((:SDLK_KP_PLUS "SDLK_KP_PLUS"))
       ((:SDLK_KP_ENTER "SDLK_KP_ENTER"))
       ((:SDLK_KP_1 "SDLK_KP_1"))
       ((:SDLK_KP_2 "SDLK_KP_2"))
       ((:SDLK_KP_3 "SDLK_KP_3"))
       ((:SDLK_KP_4 "SDLK_KP_4"))
       ((:SDLK_KP_5 "SDLK_KP_5"))
       ((:SDLK_KP_6 "SDLK_KP_6"))
       ((:SDLK_KP_7 "SDLK_KP_7"))
       ((:SDLK_KP_8 "SDLK_KP_8"))
       ((:SDLK_KP_9 "SDLK_KP_9"))
       ((:SDLK_KP_0 "SDLK_KP_0"))
       ((:SDLK_KP_PERIOD "SDLK_KP_PERIOD"))
       ((:SDLK_APPLICATION "SDLK_APPLICATION"))
       ((:SDLK_POWER "SDLK_POWER"))
       ((:SDLK_KP_EQUALS "SDLK_KP_EQUALS"))
       ((:SDLK_F13 "SDLK_F13"))
       ((:SDLK_F14 "SDLK_F14"))
       ((:SDLK_F15 "SDLK_F15"))
       ((:SDLK_F16 "SDLK_F16"))
       ((:SDLK_F17 "SDLK_F17"))
       ((:SDLK_F18 "SDLK_F18"))
       ((:SDLK_F19 "SDLK_F19"))
       ((:SDLK_F20 "SDLK_F20"))
       ((:SDLK_F21 "SDLK_F21"))
       ((:SDLK_F22 "SDLK_F22"))
       ((:SDLK_F23 "SDLK_F23"))
       ((:SDLK_F24 "SDLK_F24"))
       ((:SDLK_EXECUTE "SDLK_EXECUTE"))
       ((:SDLK_HELP "SDLK_HELP"))
       ((:SDLK_MENU "SDLK_MENU"))
       ((:SDLK_SELECT "SDLK_SELECT"))
       ((:SDLK_STOP "SDLK_STOP"))
       ((:SDLK_AGAIN "SDLK_AGAIN"))
       ((:SDLK_UNDO "SDLK_UNDO"))
       ((:SDLK_CUT "SDLK_CUT"))
       ((:SDLK_COPY "SDLK_COPY"))
       ((:SDLK_PASTE "SDLK_PASTE"))
       ((:SDLK_FIND "SDLK_FIND"))
       ((:SDLK_MUTE "SDLK_MUTE"))
       ((:SDLK_VOLUMEUP "SDLK_VOLUMEUP"))
       ((:SDLK_VOLUMEDOWN "SDLK_VOLUMEDOWN"))
       ((:SDLK_KP_COMMA "SDLK_KP_COMMA"))
       ((:SDLK_KP_EQUALSAS400 "SDLK_KP_EQUALSAS400"))
       ((:SDLK_ALTERASE "SDLK_ALTERASE"))
       ((:SDLK_SYSREQ "SDLK_SYSREQ"))
       ((:SDLK_CANCEL "SDLK_CANCEL"))
       ((:SDLK_CLEAR "SDLK_CLEAR"))
       ((:SDLK_PRIOR "SDLK_PRIOR"))
       ((:SDLK_RETURN2 "SDLK_RETURN2"))
       ((:SDLK_SEPARATOR "SDLK_SEPARATOR"))
       ((:SDLK_OUT "SDLK_OUT"))
       ((:SDLK_OPER "SDLK_OPER"))
       ((:SDLK_CLEARAGAIN "SDLK_CLEARAGAIN"))
       ((:SDLK_CRSEL "SDLK_CRSEL"))
       ((:SDLK_EXSEL "SDLK_EXSEL"))
       ((:SDLK_KP_00 "SDLK_KP_00"))
       ((:SDLK_KP_000 "SDLK_KP_000"))
       ((:SDLK_THOUSANDSSEPARATOR "SDLK_THOUSANDSSEPARATOR"))
       ((:SDLK_DECIMALSEPARATOR "SDLK_DECIMALSEPARATOR"))
       ((:SDLK_CURRENCYUNIT "SDLK_CURRENCYUNIT"))
       ((:SDLK_CURRENCYSUBUNIT "SDLK_CURRENCYSUBUNIT"))
       ((:SDLK_KP_LEFTPAREN "SDLK_KP_LEFTPAREN"))
       ((:SDLK_KP_RIGHTPAREN "SDLK_KP_RIGHTPAREN"))
       ((:SDLK_KP_LEFTBRACE "SDLK_KP_LEFTBRACE"))
       ((:SDLK_KP_RIGHTBRACE "SDLK_KP_RIGHTBRACE"))
       ((:SDLK_KP_TAB "SDLK_KP_TAB"))
       ((:SDLK_KP_BACKSPACE "SDLK_KP_BACKSPACE"))
       ((:SDLK_KP_A "SDLK_KP_A"))
       ((:SDLK_KP_B "SDLK_KP_B"))
       ((:SDLK_KP_C "SDLK_KP_C"))
       ((:SDLK_KP_D "SDLK_KP_D"))
       ((:SDLK_KP_E "SDLK_KP_E"))
       ((:SDLK_KP_F "SDLK_KP_F"))
       ((:SDLK_KP_XOR "SDLK_KP_XOR"))
       ((:SDLK_KP_POWER "SDLK_KP_POWER"))
       ((:SDLK_KP_PERCENT "SDLK_KP_PERCENT"))
       ((:SDLK_KP_LESS "SDLK_KP_LESS"))
       ((:SDLK_KP_GREATER "SDLK_KP_GREATER"))
       ((:SDLK_KP_AMPERSAND "SDLK_KP_AMPERSAND"))
       ((:SDLK_KP_DBLAMPERSAND "SDLK_KP_DBLAMPERSAND"))
       ((:SDLK_KP_VERTICALBAR "SDLK_KP_VERTICALBAR"))
       ((:SDLK_KP_DBLVERTICALBAR "SDLK_KP_DBLVERTICALBAR"))
       ((:SDLK_KP_COLON "SDLK_KP_COLON"))
       ((:SDLK_KP_HASH "SDLK_KP_HASH"))
       ((:SDLK_KP_SPACE "SDLK_KP_SPACE"))
       ((:SDLK_KP_AT "SDLK_KP_AT"))
       ((:SDLK_KP_EXCLAM "SDLK_KP_EXCLAM"))
       ((:SDLK_KP_MEMSTORE "SDLK_KP_MEMSTORE"))
       ((:SDLK_KP_MEMRECALL "SDLK_KP_MEMRECALL"))
       ((:SDLK_KP_MEMCLEAR "SDLK_KP_MEMCLEAR"))
       ((:SDLK_KP_MEMADD "SDLK_KP_MEMADD"))
       ((:SDLK_KP_MEMSUBTRACT "SDLK_KP_MEMSUBTRACT"))
       ((:SDLK_KP_MEMMULTIPLY "SDLK_KP_MEMMULTIPLY"))
       ((:SDLK_KP_MEMDIVIDE "SDLK_KP_MEMDIVIDE"))
       ((:SDLK_KP_PLUSMINUS "SDLK_KP_PLUSMINUS"))
       ((:SDLK_KP_CLEAR "SDLK_KP_CLEAR"))
       ((:SDLK_KP_CLEARENTRY "SDLK_KP_CLEARENTRY"))
       ((:SDLK_KP_BINARY "SDLK_KP_BINARY"))
       ((:SDLK_KP_OCTAL "SDLK_KP_OCTAL"))
       ((:SDLK_KP_DECIMAL "SDLK_KP_DECIMAL"))
       ((:SDLK_KP_HEXADECIMAL "SDLK_KP_HEXADECIMAL"))
       ((:SDLK_LCTRL "SDLK_LCTRL"))
       ((:SDLK_LSHIFT "SDLK_LSHIFT"))
       ((:SDLK_LALT "SDLK_LALT"))
       ((:SDLK_LGUI "SDLK_LGUI"))
       ((:SDLK_RCTRL "SDLK_RCTRL"))
       ((:SDLK_RSHIFT "SDLK_RSHIFT"))
       ((:SDLK_RALT "SDLK_RALT"))
       ((:SDLK_RGUI "SDLK_RGUI"))
       ((:SDLK_MODE "SDLK_MODE"))
       ((:SDLK_AUDIONEXT "SDLK_AUDIONEXT"))
       ((:SDLK_AUDIOPREV "SDLK_AUDIOPREV"))
       ((:SDLK_AUDIOSTOP "SDLK_AUDIOSTOP"))
       ((:SDLK_AUDIOPLAY "SDLK_AUDIOPLAY"))
       ((:SDLK_AUDIOMUTE "SDLK_AUDIOMUTE"))
       ((:SDLK_MEDIASELECT "SDLK_MEDIASELECT"))
       ((:SDLK_WWW "SDLK_WWW"))
       ((:SDLK_MAIL "SDLK_MAIL"))
       ((:SDLK_CALCULATOR "SDLK_CALCULATOR"))
       ((:SDLK_COMPUTER "SDLK_COMPUTER"))
       ((:SDLK_AC_SEARCH "SDLK_AC_SEARCH"))
       ((:SDLK_AC_HOME "SDLK_AC_HOME"))
       ((:SDLK_AC_BACK "SDLK_AC_BACK"))
       ((:SDLK_AC_FORWARD "SDLK_AC_FORWARD"))
       ((:SDLK_AC_STOP "SDLK_AC_STOP"))
       ((:SDLK_AC_REFRESH "SDLK_AC_REFRESH"))
       ((:SDLK_AC_BOOKMARKS "SDLK_AC_BOOKMARKS"))
       ((:SDLK_BRIGHTNESSDOWN "SDLK_BRIGHTNESSDOWN"))
       ((:SDLK_BRIGHTNESSUP "SDLK_BRIGHTNESSUP"))
       ((:SDLK_DISPLAYSWITCH "SDLK_DISPLAYSWITCH"))
       ((:SDLK_KBDILLUMTOGGLE "SDLK_KBDILLUMTOGGLE"))
       ((:SDLK_KBDILLUMDOWN "SDLK_KBDILLUMDOWN"))
       ((:SDLK_KBDILLUMUP "SDLK_KBDILLUMUP"))
       ((:SDLK_EJECT "SDLK_EJECT"))
       ((:SDLK_SLEEP "SDLK_SLEEP"))
       ((:SDLK_APP1 "SDLK_APP1"))
       ((:SDLK_APP2 "SDLK_APP2"))
       ((:SDLK_AUDIOREWIND "SDLK_AUDIOREWIND"))
       ((:SDLK_AUDIOFASTFORWARD "SDLK_AUDIOFASTFORWARD ")))

(cenum c-sdl-keymod
       ((:KMOD_NONE "KMOD_NONE"))
       ((:KMOD_LSHIFT "KMOD_LSHIFT"))
       ((:KMOD_RSHIFT "KMOD_RSHIFT"))
       ((:KMOD_LCTRL "KMOD_LCTRL"))
       ((:KMOD_RCTRL "KMOD_RCTRL"))
       ((:KMOD_LALT "KMOD_LALT"))
       ((:KMOD_RALT "KMOD_RALT"))
       ((:KMOD_LGUI "KMOD_LGUI"))
       ((:KMOD_RGUI "KMOD_RGUI"))
       ((:KMOD_NUM "KMOD_NUM"))
       ((:KMOD_CAPS "KMOD_CAPS"))
       ((:KMOD_MODE "KMOD_MODE"))
       ((:KMOD_RESERVED "KMOD_RESERVED")))
