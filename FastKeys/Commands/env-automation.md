## Start Launch Env with exercises on VS Code

```
CoordMode, Mouse, Screen
Send, #2
Sleep, 500
Send, #3
Sleep, 500
Send, #1
IfWinNotActive, Windows Terminal ahk_class CASCADIA_HOSTING_WINDOW_CLASS,, WinActivate, Windows Terminal ahk_class CASCADIA_HOSTING_WINDOW_CLASS
WinWaitActive, Windows Terminal ahk_class CASCADIA_HOSTING_WINDOW_CLASS
Sleep, 5000
Send, cd ~/dev/launch/js101-2{Enter}
Send, {LShift down}{LControl down}1{LShift up}{LControl up}
Sleep, 5000
Send, cd ~/dev/launch/js101-small-problems{Enter}
Sleep, 300
Send, code .{Enter}
```
