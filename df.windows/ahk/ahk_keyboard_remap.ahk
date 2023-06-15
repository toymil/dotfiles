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

Escape::`  ; some keyboard put {Escape} in the place of {Tilde}, we need tilde

;#################################################
;#                 Tap/Hold FN                  ##
;#################################################

fn1 := False
fn2 := False

*CapsLock::
    fn1 := True
    KeyWait, CapsLock
    fn1 := False
    If (A_PriorKey == "CapsLock") {
        ; Tap action goes here
        ;# ; Send, {Blind}{Escape}
        ;# A note here: the above line achives the effect of `CapsLock::Escape` remap upon releasing `CapsLock` in most situations, except a few:
        ;#     Windows Explorer:
        ;#         - focus on Explorer window
        ;#         - {Alt}-{Tab} once and keep holding {Alt}
        ;#         - {Escape} ({CapsLock}) once to cancel and close the {Alt}-{Tab} window switcher
        ;#         - release {Alt}
        ;#         + Notice there are tooltips for Alt access keys all over Explorer's UI now.  This is consistent with the behaviour of {Escape Down} to close the window switcher and then {Alt Up} before {Escape Up}.
        ;#         + A delay of 1ms is enough to avoid this problem.
        ;#     Elden Ring:
        ;#         - {Escape} ({CapsLock}) works extremely unreliably, triggers maybe 1 in 20
        ;#         + A delay of 1ms greatly improves the reliability, but not all the way; 100ms seems to be enough.
        ;# These annoyances can be fixed by sending the {Down} signal first, wait a bit, then send the {Up} signal.  The time delay needed varies with situations and programs.
        Send, {Blind}{Escape DownR}
        Sleep, 20
        Send, {Blind}{Escape Up}
    }
Return

#If, fn2 == True
    Up::Volume_Up
    Down::Volume_Down
    Left::Media_Prev
    Right::Media_Next
    m::Volume_Mute
    Space::Media_Play_Pause

    w::Volume_Up
    s::Volume_Down
    a::Media_Prev
    d::Media_Next
    x::Volume_Mute
    z::Media_Play_Pause

    q::#^Left
    e::#^Right
    t::WinSet, AlwaysOnTop, Toggle, A
#If

#If, fn1 == True
    Tab::Escape  ; in case the tap action could not function properly
    LShift::CapsLock

    BackSpace::Delete

    ; navigation keys
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

    ; F1 - F12
    1::F1
    2::F2
    3::F3
    4::F4
    5::F5
    6::F6
    7::F7
    8::F8
    9::F9
    0::F10
    -::F11
    =::F12

    *LAlt::
        fn2 := True
        KeyWait, LAlt
        fn2 := False
    Return
#If
