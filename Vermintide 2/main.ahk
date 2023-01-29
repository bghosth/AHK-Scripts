#NoEnv
#SingleInstance, Force
#IfWinActive, ahk_exe vermintide2.exe

#HotkeyInterval, 1000
#MaxHotkeysPerInterval, 100

SendMode Input
SetWorkingDir %A_ScriptDir%

#Include loader.ahk

if (FontSize < 9) {
	SizeValue := 9
} else if (FontSize > 12) {
	SizeValue := 12
} else {
	SizeValue := FontSize
}

winPosX := A_ScreenWidth - 320
winPosY := 20
PeriodValue := ""
RemapEnabled := false
AutoTagEnabled := false
UnitValue := ""

if (%InterfaceAllowed%) {
	Gui, Color, 000000
	Gui, Margin, 10, 10
	Gui, Font, s%SizeValue% Bold, Comic Sans MS
	Gui +LastFound +AlwaysOnTop +ToolWindow
	WinSet, TransColor, 000000

	if (%ClockAllowed%) {
		Gui, Add, Text, w120 c%GeneralColor% BackgroundTrans, %ClockTitle%
		Gui, Add, Text, x+0 yp w10 c%GeneralColor% BackgroundTrans, :
		Gui, Add, Text, x+0 yp w60 c%TimeColor% BackgroundTrans vDisplayTime, 00:00:00
		Gui, Add, Text, x+4 yp w30 c%GeneralColor% BackgroundTrans vDayPeriod, %PeriodValue%
	}

	if (%RemapAllowed%) {
		if (%ClockAllowed%) {
			Gui, Add, Text, xs w120 c%GeneralColor% BackgroundTrans, %RemapTitle%
		} else {
			Gui, Add, Text, w120 c%GeneralColor% BackgroundTrans, %RemapTitle%
		}
		
		Gui, Add, Text, x+0 yp w10 c%GeneralColor% BackgroundTrans, :
		Gui, Add, Text, x+0 yp w30 c%OffColor% BackgroundTrans vRemapStatus, OFF
	}

	if (%AutoTagAllowed%) {
		if (%ClockAllowed% || %RemapAllowed%) {
			Gui, Add, Text, xs w120 c%GeneralColor% BackgroundTrans, %AutoTagTitle%
		} else {
			Gui, Add, Text, w120 c%GeneralColor% BackgroundTrans, %AutoTagTitle%
		}
		
		Gui, Add, Text, x+0 yp w10 c%GeneralColor% BackgroundTrans, :
		Gui, Add, Text, x+0 yp w30 c%OffColor% BackgroundTrans vAutoTagStatus, OFF
		Gui, Add, Text, x+0 yp w20 c%GeneralColor% BackgroundTrans vIntervalUnit, %UnitValue%
	}

	Gui -Caption
	Gui, Show, x%winPosX% y%winPosY% w240 h400
}

if (InterfaceAllowed && ClockAllowed) {
	SetTimer, UpdateTime, 1000
}

Hotkey, %RemapKey%, AttackRemap
Hotkey, %AutoTagKey%, AutoTag
Hotkey, %ExitKey%, ExitAHK
Return

UpdateTime:
	if (HourFormat == "hh") {
		if (A_Hour >= 12) {
			PeriodValue := "pm"
		} else {
			PeriodValue := "am"
		}
	} else {
		PeriodValue := ""
	}
	
	FormatTime, CurrentTime,, %HourFormat%:mm:ss
	GuiControl,, DisplayTime, %CurrentTime%
	GuiControl,, DayPeriod, %PeriodValue%
Return

AttackRemap:
	if (RemapAllowed) {
		if (!RemapEnabled) {
			RemapEnabled := true
			
			HotKey, WheelUp, LightAttack, On
			HotKey, WheelDown, LightAttack, On
			HotKey, ^WheelUp, LightAttack, On
			HotKey, ^WheelDown, LightAttack, On
			HotKey, +WheelUp, LightAttack, On
			HotKey, +WheelDown, LightAttack, On
			Hotkey, LButton, HardAttack, On
			
			if (InterfaceAllowed) {
				GuiControl, +c%OnColor%, RemapStatus
				GuiControl,, RemapStatus, ON
			} else {
				ToolTip, %RemapTitle%: ON
				SetTimer, RemoveToolTip, -%ToolTipDisplayTime%
				Return
			}
		} else {
			RemapEnabled := false
			
			HotKey, WheelUp, LightAttack, Off
			HotKey, WheelDown, LightAttack, Off
			HotKey, ^WheelUp, LightAttack, Off
			HotKey, ^WheelDown, LightAttack, Off
			HotKey, +WheelUp, LightAttack, Off
			HotKey, +WheelDown, LightAttack, Off
			Hotkey, LButton, HardAttack, Off
			
			if (InterfaceAllowed) {
				GuiControl, +c%OffColor%, RemapStatus
				GuiControl,, RemapStatus, OFF
			} else {
				ToolTip, %RemapTitle%: OFF
				SetTimer, RemoveToolTip, -%ToolTipDisplayTime%
				Return
			}
		}
	}
Return

LightAttack:
	SendInput, {LButton}
Return

HardAttack:
	if (AttackDelay < 300) {
		DelayValue := 300
	} else if (AttackDelay > 600) {
		DelayValue := 600
	} else {
		DelayValue := AttackDelay
	}
	
	SendInput, {LButton down}
	Sleep %DelayValue%
	SendInput, {LButton up}
Return

AutoTag:
	if (AutoTagAllowed) {
		if (!AutoTagEnabled) {
			AutoTagEnabled := true
			IntervalValue := TagInterval
			
			if (IntervalValue < 50) {
				IntervalValue := 50
			} else if (IntervalValue > 3000) {
				IntervalValue := 3000
			}
			
			if (IntervalValue > 1000) {
				IntervalValue := Round(IntervalValue / 1000, 1)
				UnitValue := "s"
			} else {
				UnitValue := "ms"
			}
			
			SetTimer TargetTag, %TagInterval%
			
			if (InterfaceAllowed) {
				GuiControl, +c%OnColor%, AutoTagStatus
				GuiControl,, AutoTagStatus, %IntervalValue%
				GuiControl,, IntervalUnit, %UnitValue%
			} else {
				ToolTip, %AutoTagTitle%: %IntervalValue% %UnitValue%
				SetTimer, RemoveToolTip, -%ToolTipDisplayTime%
				Return
			}
		} else {
			AutoTagEnabled := false
			UnitValue := ""
			
			SetTimer TargetTag, Off
			
			if (InterfaceAllowed) {
				GuiControl, +c%OffColor%, AutoTagStatus
				GuiControl,, AutoTagStatus, OFF
				GuiControl,, IntervalUnit, %UnitValue%
			} else {
				ToolTip, %AutoTagTitle%: OFF
				SetTimer, RemoveToolTip, -%ToolTipDisplayTime%
				Return
			}
		}
	}
Return

TargetTag:
	SendInput, {t}
Return

RemoveToolTip:
	ToolTip
Return

ExitAHK:
	ExitApp
Return
