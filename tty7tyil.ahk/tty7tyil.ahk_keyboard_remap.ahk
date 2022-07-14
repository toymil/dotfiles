#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode, Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, Force

customize_tray_icon() {
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
;#             Magic FN (Tap/Hold)              ##
;#################################################

fn1 := False
fn2 := False
fn3 := False

;#         fn1         ##
CapsLock::
    fn1 := True
    KeyWait, CapsLock
    fn1 := False
    If (A_PriorKey == "CapsLock") {
        ; Tap action goes here
        Send, {Escape}
    }
Return

#If, fn1 == True
    ; Magic FN layer goes here
    Tab::Escape  ; in case the tap action could not function properly

    BackSpace::Delete

    w::Up
    a::Left
    s::Down
    d::Right

    h::Home
    j::PgDn
    k::PgUp
    l::End

    Left::Home
    Right::End
    Up::PgUp
    Down::PgDn
#If

;-----

+CapsLock::CapsLock
Escape::`  ; some keyboard put {Escape} in the place of {Tilde}, we need tilde in vscode
^+CapsLock::^+Escape  ; so that we can launch task manager

;#################################################
;#                Multimedia Key                ##
;#################################################

!^Up::Volume_Up
!^Down::Volume_Down
!^m::Volume_Mute

!^Left::Media_Prev
!^Right::Media_Next
!^Space::Media_Play_Pause

;-----

!^t::WinSet, AlwaysOnTop, Toggle, A
