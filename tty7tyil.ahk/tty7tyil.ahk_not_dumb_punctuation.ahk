#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode, Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force

customize_tray_icon() {
    ; #NoTrayIcon

    Menu, Tray, Tip, (AHK) NOT Dumb Punctuation!

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

    Return

    Tray_Menu_Dummy:
    Return

    Tray_Menu_Info:
        KeyHistory
    Return

    Tray_Menu_Reload:
        Reload
    Return

    Tray_Menu_Suspend:
        Suspend, Toggle
        Menu, Tray, ToggleCheck, Suspend Hot[key/string]s
    Return

    Tray_Menu_Exit:
        ExitApp, 0
    Return
}
customize_tray_icon()

;###################################################################################################
;#                                         SCRIPT CONTENT                                         ##
;###################################################################################################

;#################################################
;#                   English                    ##
;#################################################

; LEFT SINGLE QUOTATION MARK
^[::Send {U+2018}
; RIGHT SINGLE QUOTATION MARK
^]::Send {U+2019}

; LEFT DOUBLE QUOTATION MARK
^+[::Send {U+201C}
; RIGHT DOUBLE QUOTATION MARK
^+]::Send {U+201D}

; ---

; PRIME
^'::Send {U+2032}
; DOUBLE PRIME
^+'::Send {U+2033}

; ---

; HORIZONTAL ELLIPSIS
^;::Send {U+2026}
; MIDLINE HORIZONTAL ELLIPSIS
^+;::Send {U+22EF}

;#################################################
;#                   Chinese                    ##
;#################################################

; LEFT CORNER BRACKET
!^[::Send {U+300C}
; RIGHT CORNER BRACKET
!^]::Send {U+300D}

; LEFT WHITE CORNER BRACKET
!^+[::Send {U+300E}
; RIGHT WHITE CORNER BRACKET
!^+]::Send {U+300F}

; ---

; FULLWIDTH FULL STOP
!^.::Send {U+FF0E}
