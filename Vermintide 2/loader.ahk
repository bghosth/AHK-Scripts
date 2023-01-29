ConfigFile := "config.ini"

IniRead, InterfaceAllowed, %ConfigFile%, Config, InterfaceAllowed, true
IniRead, ToolTipDisplayTime, %ConfigFile%, Config, ToolTipDisplayTime, 3000
IniRead, Language, %ConfigFile%, Config, Language, english
IniRead, GeneralColor, %ConfigFile%, Config, GeneralColor, FFA500
IniRead, TimeColor, %ConfigFile%, Config, TimeColor, FFFFF0
IniRead, OnColor, %ConfigFile%, Config, OnColor, 00FF00
IniRead, OffColor, %ConfigFile%, Config, OffColor, FF0000
IniRead, FontSize, %ConfigFile%, Config, FontSize, 11
IniRead, ClockAllowed, %ConfigFile%, Config, ClockAllowed, true
IniRead, HourFormat, %ConfigFile%, Config, HourFormat, HH
IniRead, RemapAllowed, %ConfigFile%, Config, RemapAllowed, true
IniRead, RemapKey, %ConfigFile%, Config, RemapKey, F1
IniRead, AttackDelay, %ConfigFile%, Config, AttackDelay, 500
IniRead, AutoTagAllowed, %ConfigFile%, Config, AutoTagAllowed, true
IniRead, AutoTagKey, %ConfigFile%, Config, AutoTagKey, F2
IniRead, TagInterval, %ConfigFile%, Config, TagInterval, 500
IniRead, ExitKey, %ConfigFile%, Config, ExitKey, ^Esc

LangFile := % "locale\" Language ".ini"
IniRead, ClockTitle, %LangFile%, Text, L_CLOCK_TITLE, Current Time
IniRead, RemapTitle, %LangFile%, Text, L_REMAP_TITLE, Attack Remap
IniRead, AutoTagTitle, %LangFile%, Text, L_AUTO_TAG_TITLE, Auto Tag