LangFile := % "locale\" Language ".ahk"

FileReadLine, ClockTitle, %LangFile%, 1
FileReadLine, RemapTitle, %LangFile%, 2
FileReadLine, AutoTagTitle, %LangFile%, 3