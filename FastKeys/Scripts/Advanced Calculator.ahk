/*
Title: My Calculator
Compiled/Written 01.16.2008 by labouche10
This is just a basic calculator that I wrote that was inspired by my favorite calculator. 
I wrote this for the people in my office to use.
I'm a noob so don't come down on me too hard! I hope someone can use this as much as I know I will.
*/


#NoEnv
#ErrorStdOut
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, tooltip, relative
groupadd, calculatorgroup, %A_Username%'s Calculator

; Add Menus
Menu, FileMenu, add, &Print           Ctrl+P, printout
Menu, FileMenu, add, &Save          Ctrl+S, save
Menu, FileMenu, add, Save &As     Ctrl+Shift+S, saveas
Menu, FileMenu, add, E&xit            Alt+F4, guiclose
Menu, MyMenuBar, Add, &File, :FileMenu
Menu, EditMenu, add, &Copy History      Ctrl+C, copyhistorytoclipboard
Menu, EditMenu, add, Clear History      Ctrl+Backspace, clearhistory
Menu, EditMenu, add, &Undo Clear         Ctrl+Z, undoclearhistory
Menu, MyMenuBar, Add, &Edit, :EditMenu
Menu, OptionsMenu, add, &Set Decimal Places, rounding
Menu, OptionsMenu, add, &Stop Rounding, stoprounding
Menu, MyMenuBar, Add, &Options, :OptionsMenu
Menu, HelpMenu, Add, &Shortcuts	F1, Helpmenushortcuts
Menu, HelpMenu, add, &About..., helpmenuabout
Menu, MyMenuBar, Add, &Help, :HelpMenu

; Gui functions
Gui, Menu, MyMenuBar
;~ Gui, +Resize +MinSize
Gui, Color, 0x173f4f , 0x173f4f  ;0xD2E8F2
Gui, font, s10 bold cWhite, copperplate gothic    :2D7597
Gui, add, text,, Description
Gui, font, s10 norm cWhite, copperplate gothic
Gui, add, edit, w275 R1 +veditdescription
Gui, font, s10 bold cWhite, copperplate gothic
Gui, add, text,, History
Gui, font, s10 norm cWhite, copperplate gothic
Gui, add, edit, w275 h200 +readonly +vedithistory
Gui, font, s10 bold cWhite, copperplate gothic
Gui, add, text,+vinput, Input
Gui, Font, s12 bold cWhite, copperplate gothic
Gui, add, edit, w275 R1 +veditcalculate
Gui, Font, s10 norm, copperplate gothic
Guicontrol, +0x40, edithistory
Guicontrol, focus, editcalculate
Gui, Margin,, 20
Gui, Show,, %A_Username%'s Calculator
;WinSet, ExStyle, ^0x80, %A_Username%'s Calculator
;WinSet, ExStyle, +0x80, %A_Username%'s Calculator
Return

; Context sensitive GUI hotkeys
#IfWinActive ahk_group calculatorgroup

; The following four functions use the most recent result as the first argument when pressing only +,-,*,/ 
NumpadAdd::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, +
			Return
		}
		Else
		{
			Sendraw, answer+
			Return
		}
	}
	Else
	{
		Sendraw, +
		Return
	}
}
Else
	Sendraw, +
Return

+::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, +
			Return
		}
		Else
		{
			Sendraw, answer+
			Return
		}
	}
	Else
	{
		Sendraw, +
		Return
	}
}
Else
	Sendraw, +
Return

~F1::
Gosub, helpmenushortcuts
Return

NumpadSub::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, -
			Return
		}
		Else
		{
			Sendraw, answer-
			Return
		}
	}
	Else
	{
		Sendraw, -
		Return
	}
}
Else
	Sendraw, -
Return

-::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, -
			Return
		}
		Else
		{
			Sendraw, answer-
			Return
		}
	}
	Else
	{
		Sendraw, -
		Return
	}
}
Else
	Sendraw, -
Return

NumpadMult::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, *
			Return
		}
		Else
		{
			Sendraw, answer*
			Return
		}
	}
	Else
	{
		Sendraw, *
		Return
	}
}
Else
	Sendraw, *
Return

*::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, *
			Return
		}
		Else
		{
			Sendraw, answer*
			Return
		}
	}
	Else
	{
		Sendraw, *
		Return
	}
}
Else
	Sendraw, *
Return

NumpadDiv::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, /
			Return
		}
		Else
		{
			Sendraw, answer/
			Return
		}
	}
	Else
	{
		Sendraw, /
		Return
	}
}
Else
	Sendraw, /
Return

/::
Gui, Submit, NoHide
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	controlgettext, temptext, edit3
	if temptext = 
	{
		If answerall =
		{
			Sendraw, /
			Return
		}
		Else
		{
			Sendraw, answer/
			Return
		}
	}
	Else
	{
		Sendraw, /
		Return
	}
}
Else
	Sendraw, /
Return

; This char doesn't belong in the edit box
=::
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	TrayTip, Entry Error,Enter a numerical calculation,,3
	SetTimer, Removetraytip, 5000
	Return
}
Else
	Sendraw, =
Return

; Proceed with the calculation
~NumPadEnter::
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
	Gosub, Calculate
Else
	Sendinput, {Enter}
Return

~Enter::
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
	Gosub, Calculate
Else
	Sendinput, {Enter}
Return

; Print results in a sort of 'adding machine' output.
^p::
printout:
Gui, Submit, NoHide
FormatTime, currentime
edit = 
edit := "`nPrinted by: " . A_Username . "`n`nPrinted time: " . currentime . "`n`n`n`nDescription: " . editdescription . "`n`n`n`nCalculations:`n`n" . answerall
Print(edit)
Return

; Why would you want to save your results? I dunno if you want to then do it.
^s::
save:
If savefilename =
	Fileselectfile, savefilename, 2, %A_Desktop%\calchistory.rtf, Save As, *.rtf
Gui, Submit, NoHide
FormatTime, currentime
edit = 
edit := "`nPrinted by: " . A_Username . "`n`nPrinted time: " . currentime . "`n`n`n`nDescription: " . editdescription . "`n`n`n`nCalculations:`n`n" . answerall
fileappend, %edit%, %savefilename%
Return

^+s::
saveas:
Fileselectfile, savefilename, , %A_Desktop%\calchistory.rtf, Save As, *.rtf
savefilename := savefilename . ".rtf"
Gui, Submit, NoHide
FormatTime, currentime
edit = 
edit := "`nPrinted by: " . A_Username . "`n`nPrinted time: " . currentime . "`n`n`n`nDescription: " . editdescription . "`n`n`n`nCalculations:`n`n" . answerall
fileappend, %edit%, %savefilename%
Return


; Just a helpful idea (hopefully)
^c::
copyhistorytoclipboard:
clipboard := answerall
Return

; Clear the history box
^Backspace::
clearhistory:
controlgettext, temptext, edit2
If answerall = 
{
	TrayTip, Error!,You must have history before you can clear it!,,3
	SetTimer, Removetraytip, 5000
	Return
}
Answerallbackup := Answerall
Answerall = 
Guicontrol, text, edithistory, %Answerall%
Return

; I wished my last calculator actually had this
^z::
Undoclearhistory:
controlgettext, temptext, edit2
If answerallbackup = 
{
	TrayTip, Error!,You must clear the history before you can restore it!,,3
	SetTimer, Removetraytip, 5000
	Return
}
Else If temptext <>
{
	TrayTip, Error!,You cannot restore history after starting new calculations,,3
	SetTimer, Removetraytip, 5000
	Return
}
Answerall := Answerallbackup
Guicontrol, text, edithistory, %Answerall%
ControlSend Edit2, ^{End}, ahk_group calculatorgroup
Return

; While in the 'Input' box this will just bring the last calculation back to be edited
~up::						;Brings back the last calculation
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	Guicontrol, text, edit3, %editcalculatebackup%
	controlsend edit3, ^{End}, ahk_group calculatorgroup
}
Else
	Sendraw, {up}
Return

^::
ControlGetFocus, focusvar, ahk_group calculatorgroup
If focusvar = edit3
{
	Sendraw, **
}
Else
	Sendraw, ^
Return

rounding:
Loop,
{
	Inputbox, roundingvar, Decimal Places to round, Enter the number of decimal places (between 0 and 10) to round your answers to:
	If errorlevel
		Break
	If rounding var is not integer
	{
		Msgbox, Error you must enter a whole number beween 0 and 10!
		Continue
	}
	Else If (roundingvar < 0 or roundingvar > 10)
	{
		Msgbox, Error you must enter a value beween 0 and 10!
		Continue
	}
	Else
		Break
}
Return

stoprounding:
roundingvar = 
Return

; The superficial portion of the calculation
Calculate:
Gui, Submit, NoHide
if editcalculate = 
	Return
editcalculate := RegExReplace(editcalculate,"answer",answer)
editcalculate := RegExReplace(editcalculate,"pi","3.1415926535897932384626433832795")
editcalculate := RegExReplace(editcalculate,"p","3.1415926535897932384626433832795")
editcalculatebackup := editcalculate
filedelete, tempcalc.ahk
filedelete, tempanswer
fileappend,
(
#NoTrayIcon
#ErrorStdOut
answer := %editcalculate%
fileappend, `%answer`%, tempanswer                                      ; This is the simple solution
filesetattrib, h, tempanswer
exit
), tempcalc.ahk
filesetattrib, h, tempcalc.ahk
RunWait, %A_AhkPath% /E tempcalc.ahk
IfExist, tempanswer
{
	fileread, answer, tempanswer
	filedelete, tempcalc.ahk
	filedelete, tempanswer
}
Else
{
	filedelete, tempcalc.ahk
	If answerall = 
	{
		answerall := "ERROR"
		TrayTip, Entry Error, There is an error in your calculation,,3
		SetTimer, Removetraytip, 5000
	}
	Else
	{
		answerall := answerall . "`nERROR"
		TrayTip, Entry Error, There is an error in your calculation,,3
		SetTimer, Removetraytip, 5000
	}
	Guicontrol, text, edithistory, %Answerall%
	ControlSend Edit2, ^{End}, ahk_group calculatorgroup
	Return
}
If answer is not number
{
	If answerall = 
	{
		answerall := "ERROR"
		TrayTip, Entry Error, There is an error in your calculation,,3
		SetTimer, Removetraytip, 5000
	}
	Else
	{
		answerall := answerall . "`nERROR"
		TrayTip, Entry Error, There is an error in your calculation,,3
		SetTimer, Removetraytip, 5000
	}
}
Else
{
	answerround := answer
	Loop,
	{
		stringright, rightvar, answerround, 1
		If roundingvar <>
		{
			answerround := Round(answerround,roundingvar)
			Break			
		}
		Else If instr(answerround,".") = 0
			Break			
		Else If rightvar = .
		{
			Stringtrimright, answerround, answerround, 1
			Continue
		}
		Else If rightvar = 0
		{
			Stringtrimright, answerround, answerround, 1
			Continue
		}
		Else
			Break
	}
	If answerall = 
	{
		answerall := editcalculatebackup . " =`n                " . answerround
		Guicontrol, text, editcalculate, 
	}
	Else
	{
		answerall := answerall . "`n" . editcalculatebackup . " =`n                " . answerround
		Guicontrol, text, editcalculate, 
	}
}
Guicontrol, text, edithistory, %Answerall%
ControlSend Edit2, ^{End}, ahk_group calculatorgroup
Return

removetooltip:
settimer, removetooltip, off
tooltip
return

removetraytip:
settimer, removetraytip, off
traytip
return

guiclose:
exitapp



; FUNCTIONS



Eval(x)								; Thanks to Laszlo for this function! http://www.autohotkey.com/forum/topic26435.html&highlight=calculator
{ 
   StringGetPos i, x, +, R 
   StringGetPos j, x, -, R 
   If (i > j)
      Return Left(x,i)+Right(x,i) 
   If (j > i) 
      Return Left(x,j)-Right(x,j) 
   StringGetPos i, x, *, R 
   StringGetPos j, x, /, R 
   If (i > j) 
      Return Left(x,i)*Right(x,i) 
   If (j > i) 
      Return Left(x,j)/Right(x,j) 
   Return x 
} 

Left(x,i) 
{ 
   StringLeft x, x, i 
   Return Eval(x) 
} 
Right(x,i) 
{ 
   StringTrimLeft x, x, i+1 
   Return Eval(x) 
}

helpmenuabout:
MsgBox, 0, My Calculator, Version 1.04.02`n`nBuilt 01.12.08`n`nby Mike Marrs
Return

helpmenushortcuts:
Gui, 2:Font, s16 Bold, Arial
Gui, 2:Add, Text, +xm w900 Center,Shortcuts
Gui, 2:Font, s8 Norm, Arial
Gui, 2:Add, Text, +xm +ys+20, Print:			Ctrl + P
Gui, 2:Add, Text, +xm +ys+40, Save History:		Ctrl + S
Gui, 2:Add, Text, +xm +ys+60, Save As:		Ctrl + Shift + S
Gui, 2:Add, Text, +xm +ys+80, Exit:			Alt + F4
Gui, 2:Add, Text, +xm +ys+100,
Gui, 2:Add, Text, +xm +ys+120, Copy History:		Ctrl + C
Gui, 2:Add, Text, +xm +ys+140, Clear History:		Ctrl + Backspace
Gui, 2:Add, Text, +xm +ys+160, Undo Clear History:	Ctrl + Z
Gui, 2:Font, s16 Bold, Arial
Gui, 2:Add, Text, +xm w900 center,Functionality
Gui, 2:Font, s8 Bold, Arial
Gui, 2:Add, Text, +xm +ys+210 w900 center,Rounding:
Gui, 2:Font, s8 Norm, Arial
Gui, 2:Add, Text, +xm +ys+240 w900, Set Decimal Places: Use this option to automatically round answers to a set number of digits. After enabling the Set Decimal Places option, all significant digits are actually maintained throughout all calculations. To view these digits select Stop Rounding from the options menu then add '0' to your answer.
Gui, 2:Font, s8 Bold, Arial
Gui, 2:Add, Text, +xm +ys+280 w900 center, General Math
Gui, 2:Font, s8 Norm, Arial
Gui, 2:Add, Text, +xm +ys+295 w900, Note: Basic Operators: Add: +, Subtract: -, Multiply: *, Divide: /, Exponent **`n`nAbs(Number): Returns the absolute value of Number. The return value is the same type as Number (integer or floating point).`n`nCeil(Number): Returns Number rounded up to the nearest integer (without any .00 suffix). For example, Ceil(1.2) is 2 and Ceil(-1.2) is -1.Exp(N): Returns e (which is approximately 2.71828182845905) raised to the Nth power. N may be negative and may contain a decimal point. To raise numbers other than e to a power, use the ** operator.`n`nFloor(Number): Returns Number rounded down to the nearest integer (without any .00 suffix). For example, Floor(1.2) is 1 and Floor(-1.2) is -2.`n`nLog(Number): Returns the logarithm (base 10) of Number. The result is formatted as floating point. If Number is negative, an empty string is returned.`n`nLn(Number): Returns the natural logarithm (base e) of Number. The result is formatted as floating point. If Number is negative, an empty string is returned.`n`nMod(Dividend, Divisor): Modulo. Returns the remainder when Dividend is divided by Divisor. The sign of the result is always the same as the sign of the first parameter. For example, both mod(5, 3)and mod(5, -3) yield 2, but mod(-5, 3) and mod(-5, -3) yield -2. If either input is a floating point number, the result is also a floating point number. For example, mod(5.0, 3) is 2.0 and mod(5, 3.5) is 1.5. If the second parameter is zero, the function yields a blank result (empty string).`n`nRound(Number [, N]): If N is omitted or 0, Number is rounded to the nearest integer. If N is positive number, Number is rounded to N decimal places. If N is negative, Number is rounded by N digits to the leftof the decimal point. For example, Round(345, -1) is 350 and Round (345, -2) is 300. Unlike Transform Round, the result has no .000 suffix whenever N is omitted or less than 1. In v1.0.44.01+, a value of N greater than zero displays exactly N decimal places rather than obeying SetFormat. To avoid this, perform another math operation on Round()'s return value; for example: Round(3.333, 1)+0.`n`nSqrt(Number): Returns the square root of Number. The result is formatted as floating point. If Number is negative, the function yields a blank result (empty string).
Gui, 2:Font, s8 Bold, Arial
Gui, 2:Add, Text, +xm Section w900 center, Trigonometry
Gui, 2:Font, s8 Norm, Arial
Gui, 2:Add, Text, +xm +ys+15 w900, Sin(Number) | Cos(Number) | Tan(Number) : Returns the trigonometric sine|cosine|tangent of Number. Number must be expressed in radians.`n`nASin(Number): Returns the arcsine (the number whose sine is Number) in radians. If Number is less than -1 or greater than 1, the function yields a blank result (empty string).`n`nACos(Number): Returns the arccosine (the number whose cosine is Number) in radians. If Number is less than -1 or greater than 1, the function yields a blank result (empty string).`n`nATan(Number): Returns the arctangent (the number whose tangent is Number) in radians.`n`nNote: To convert a radians value to degrees, multiply it by 180/pi (approximately 57.29578). To convert a degrees value to radians, multiply it by pi/180 (approximately 0.01745329252). The value of pi (approximately 3.141592653589793) is 4 times the arctangent of 1.`n
Gui, 2:Font, s8 Bold, Arial
Gui, 2:Add, Text, +xm w900 center, Press 'Esc' to close this window
Gui, 2:Color, White
Gui, 2:Show, , Help File
;Gui, 2:+LastFound +0x200000 +Resize +0x2000000
;Winset, Style, +0x200000, Help File
;OnMessage(0x115, "OnScroll") ; WM_VSCROLL
;OnMessage(0x114, "OnScroll") ; WM_HSCROLL
;Gui, 2:; WS_VSCROLL | WS_HSCROLL
;Gui, 2:+Resize
Return

2GuiEscape:
Gui, 1:-Disabled
Gui Destroy
Return

Guisize:
settitlematchmode, 3
;Guicontrol, Move, edithistory, w100 h100
Anchor("editdescription", "w")
Anchor("edithistory", "wh")
Anchor("editcalculate", "yw")
Anchor("history", "yw")
Anchor("input", "yw")
controlgetpos, , yvar,,,edit2,Mike's Calculator
controlmove, static2,, yvar - 20,,,Mike's Calculator
Return

Answer(x) 
{
return x
}

Anchor(i, a = "", r = false) {						; Thanks to Titan and all who contributed to the anchor function!
	static c, cs = 12, cx = 255, cl = 0, g, gs = 8, z = 0, k = 0xffff, gx = 1
	If z = 0
		VarSetCapacity(g, gs * 99, 0), VarSetCapacity(c, cs * cx, 0), z := true
	If a =
	{
		StringLeft, gn, i, 2
		If gn contains :
		{
			StringTrimRight, gn, gn, 1
			t = 2
		}
		StringTrimLeft, i, i, t ? t : 3
		If gn is not digit
			gn := gx
	}
	Else gn := A_Gui
	If i is not xdigit
	{
		GuiControlGet, t, Hwnd, %i%
		If ErrorLevel = 0
			i := t
		Else ControlGet, i, Hwnd, , %i%
	}
	gb := (gn - 1) * gs
	Loop, %cx%
		If (NumGet(c, cb := cs * (A_Index - 1)) == i) {
			If a =
			{
				cf = 1
				Break
			}
			Else gx := A_Gui
			d := NumGet(g, gb), gw := A_GuiWidth - (d >> 16 & k), gh := A_GuiHeight - (d & k), as := 1
				, dx := NumGet(c, cb + 4, "Short"), dy := NumGet(c, cb + 6, "Short")
				, dw := NumGet(c, cb + 8, "Short"), dh := NumGet(c, cb + 10, "Short")
			Loop, Parse, a, xywh
				If A_Index > 1
					av := SubStr(a, as, 1), as += 1 + StrLen(A_LoopField)
						, d%av% += (InStr("yh", av) ? gh : gw) * (A_LoopField + 0 ? A_LoopField : 1)
			DllCall("SetWindowPos", "UInt", i, "Int", 0, "Int", dx, "Int", dy, "Int", dw, "Int", dh, "Int", 4)
			If r != 0
				DllCall("RedrawWindow", "UInt", i, "UInt", 0, "UInt", 0, "UInt", 0x0101) ; RDW_UPDATENOW | RDW_INVALIDATE
			Return
		}
	If cf != 1
		cb := cl, cl += cs
	If (!NumGet(g, gb)) {
		Gui, +LastFound
		WinGetPos, , , , gh
		VarSetCapacity(pwi, 68, 0), DllCall("GetWindowInfo", "UInt", WinExist(), "UInt", &pwi)
			, NumPut(((bx := NumGet(pwi, 48)) << 16 | by := gh - A_GuiHeight - NumGet(pwi, 52)), g, gb + 4)
			, NumPut(A_GuiWidth << 16 | A_GuiHeight, g, gb)
	}
	Else d := NumGet(g, gb + 4), bx := d >> 16, by := d & k
	ControlGetPos, dx, dy, dw, dh, , ahk_id %i%
	If cf = 1
	{
		Gui, +LastFound
		WinGetPos, , , gw, gh
		d := NumGet(g, gb), dw -= gw - bx * 2 - (d >> 16), dh -= gh - by - bx - (d & k)
	}
	NumPut(i, c, cb), NumPut(dx - bx, c, cb + 4, "Short"), NumPut(dy - by, c, cb + 6, "Short")
		, NumPut(dw, c, cb + 8, "Short"), NumPut(dh, c, cb + 10, "Short")
	Return, true
}

Print( edit ){						;Thanks to Fry for this and for majkinetor for surprising him with a better version!
	FileAppend %edit%, Calculations.txt
	Run, notepad /p calculations.txt
	Sleep, 1500
	FileDelete, calculations.txt
}