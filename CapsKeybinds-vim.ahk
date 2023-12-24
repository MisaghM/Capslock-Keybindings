#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

SetCapsLockState, AlwaysOff

#'::
  Suspend
  if (A_IsSuspended)
    SetCapsLockState, Off
  else
    SetCapsLockState, AlwaysOff
return

#if GetKeyState("CapsLock", "P")

*j::Send {blind}{Down}
*l::Send {blind}{Right}
*h::Send {blind}{Left}  
*k::Send {blind}{Up}
*u::Send {blind}{BackSpace}
*i::Send {blind}{Del}
*y::Send {blind}{Home}
*o::Send {blind}{End}
*d::Send {blind}{PgDn}
*f::Send {blind}{PgUp}
*;::Send {blind}{Escape}

t::
  hwnd := WinExist("ahk_exe cmd.exe")
  if (hwnd) {
    if (WinActive("ahk_id" hwnd))
      ; WinMinimize, ahk_id %hwnd% ; www.autohotkey.com/docs/commands/WinMinimize.htm#Remarks
      PostMessage, 0x0112, 0xF020,,, ahk_id %hwnd% ; 0x0112 = WM_SYSCOMMAND, 0xF020 = SC_MINIMIZE
    else
      WinActivate, ahk_id %hwnd%
  }
  else Run, cmd.exe, %A_Desktop%
return