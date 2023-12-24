; REMOVED: #NoEnv
SendMode("Input")
SetWorkingDir(A_ScriptDir)

SetCapsLockState("AlwaysOff")

#'::
{ ; V1toV2: Added bracket
  Suspend()
  if (A_IsSuspended)
    SetCapsLockState("Off")
  else
    SetCapsLockState("AlwaysOff")
return
} ; V1toV2: Added bracket in the end

#HotIf GetKeyState("CapsLock", "P")

*j::Send("{blind}{Left}")
*l::Send("{blind}{Right}")
*i::Send("{blind}{Up}")
*k::Send("{blind}{Down}")
*u::Send("{blind}{Home}")
*o::Send("{blind}{End}")
*;::Send("{blind}{Del}")
*h::Send("{blind}{BackSpace}")
*d::Send("{blind}{PgUp}")
*f::Send("{blind}{PgDn}")
*m::Send("{blind}{Escape}")

t::
{ ; V1toV2: Added bracket
  hwnd := WinExist("ahk_exe cmd.exe")
  if (hwnd) {
    if (WinActive("ahk_id" hwnd))
      ; WinMinimize, ahk_id %hwnd% ; www.autohotkey.com/docs/commands/WinMinimize.htm#Remarks
      PostMessage(0x0112, 0xF020, , , "ahk_id " hwnd) ; 0x0112 = WM_SYSCOMMAND, 0xF020 = SC_MINIMIZE
    else
      WinActivate("ahk_id " hwnd)
  }
  else   Run("cmd.exe", A_Desktop)
return
} ; V1toV2: Added bracket in the end
