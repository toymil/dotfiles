#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force

;###################################################################################################
;#                                      CUSTOMIZE TRAY ICON                                       ##
;###################################################################################################

; #NoTrayIcon

Menu, Tray, Tip, (AHK) Keyboard Remap

Menu, Tray, NoStandard
Menu, Tray, Add, %A_IconTip%, Tray_Menu_Dummy, +Radio
Menu, Tray, Check, %A_IconTip%
Menu, Tray, Add
Menu, Tray, Add, Script Info, Tray_Menu_Info
Menu, Tray, Add, Reload Script, Tray_Menu_Reload
Menu, Tray, Add
Menu, Tray, Add, Suspend Hot[key/string]s, Tray_Menu_Suspend
Menu, Tray, Add, Exit, Tray_Menu_Exit

Menu, Tray, Default, Suspend Hot[key/string]s
Menu, Tray, Click, 2

return

Tray_Menu_Dummy:
return

Tray_Menu_Info:
    KeyHistory
return

Tray_Menu_Reload:
    Reload
return

Tray_Menu_Suspend:
    Suspend, Toggle
    Menu, Tray, ToggleCheck, Suspend Hot[key/string]s
return

Tray_Menu_Exit:
    ExitApp, 0
return

;###################################################################################################
;#                                         SCRIPT CONTENT                                         ##
;###################################################################################################

CapsLock::Escape
Escape::`
+CapsLock::CapsLock

^Left::Send {Home}
^Right::Send {End}
^Up::Send {PgUp}
^Down::Send {PgDn}

!^Up::Volume_Up
!^Down::Volume_Down
!^m::Volume_Mute

!^Left::Media_Prev
!^Right::Media_Next
!^Space::Media_Play_Pause

; ---

!^t::WinSet, AlwaysOnTop, Toggle, A
