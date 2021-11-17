#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force

;###################################################################################################
;#                                      CUSTOMIZE TRAY ICON                                       ##
;###################################################################################################

; #NoTrayIcon

Menu, Tray, Tip, (AHK) Input Date &&& Time

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

send_iso_8601(date_time_format) {
    FormatTime, iso_8601, %A_NowUTC%, %date_time_format%
    Send, %iso_8601%
    Return
}

:x:/utcd::send_iso_8601("yyyyMMdd")
:x:/utcdl::send_iso_8601("yyyy-MM-dd")
:x:/utct::send_iso_8601("HHmmssZ")
:x:/utctl::send_iso_8601("HH:mm:ssZ")
:x:/utctn::send_iso_8601("HH-mm-ss_Z")
:x:/utcdt::send_iso_8601("yyyyMMddTHHmmssZ")
:x:/utcdtl::send_iso_8601("yyyy-MM-ddTHH:mm:ssZ")
:x:/utcdth::send_iso_8601("yyyy-MM-dd HH:mm:ss Z")
:x:/utcdtn::send_iso_8601("yyyy-MM-dd_HH-mm-ss_Z")
