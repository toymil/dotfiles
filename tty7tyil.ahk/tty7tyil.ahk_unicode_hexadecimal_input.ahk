#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force

;###################################################################################################
;#                                      CUSTOMIZE TRAY ICON                                       ##
;###################################################################################################

#NoTrayIcon

Menu, Tray, Tip, (AHK) Unicode Hexadecimal Input

Menu, Tray, NoStandard
Menu, Tray, Add, Script Info, Tray_Menu_Info
Menu, Tray, Add, Reload Script, Tray_Menu_Reload
Menu, Tray, Add
Menu, Tray, Add, Suspend Hot[key/string]s, Tray_Menu_Suspend
Menu, Tray, Add, Exit, Tray_Menu_Exit

Menu, Tray, Default, Suspend Hot[key/string]s
Menu, Tray, Click, 2

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

; A string type (REG_SZ) entry called
;     `EnableHexNumpad`
; with value
;     `1`
; in the registry key
;     `HKEY_CURRENT_USER\Control Panel\Input Method`
; is necessary for hex input to work.

<!1::Numpad1
<!2::Numpad2
<!3::Numpad3
<!4::Numpad4
<!5::Numpad5
<!6::Numpad6
<!7::Numpad7
<!8::Numpad8
<!9::Numpad9
<!0::Numpad0
<!=::NumpadAdd
