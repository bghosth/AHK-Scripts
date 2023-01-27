; Sets if the user interfaced is allowed to be displayed.
; Default: true
InterfaceAllowed := true

; Set how long the tooltip will be displayed in millisecond.
; This will ONLY work if "InterfaceAllowed" is set to "false".
; Default: 3000
ToolTipDisplayTime := 3000

; Set the language of the text being displayed.
; Default: english
; Make sure the value input here matches the name of the corresponding language file.
; Note: Do NOT remove the quotation marks.
Language := "english"

; Set the general font color.
; Default: FFA500
; RGB color code is recommended, however, color name is also accepted.
; Note: Do NOT remove the quotation marks.
GeneralColor := "FFA500"

; Set the display color of the time.
; Default: FFFFF0
; RGB color code is recommended, however, color name is also accepted.
; Note: Do NOT remove the quotation marks.
TimeColor := "FFFFF0"

; Set the display color of the "On" text.
; Default: 00FF00
; RGB color code is recommended, however, color name is also accepted.
; Note: Do NOT remove the quotation marks.
OnColor := "00FF00"

; Set the display color of the "Off" text.
; Default: FF0000
; RGB color code is recommended, however, color name is also accepted.
; Note: Do NOT remove the quotation marks.
OffColor := "FF0000"

; Set the size of the text being displayed on the interface.
; Default: 11
; Min. value: 9
; Max. value: 12
FontSize := 11

; Set if the digital clock is allowed to be displayed.
; Default: true
ClockAllowed := true

; Set the time format of the digital clock.
; Default: HH
; Value: HH = 24-hour, hh = 12-hour.
; Note: Do NOT remove the quotation marks.
HourFormat := "HH"

; Set if Attack Remap is allowed.
; Once Attack Remap is enabled, light attack can be triggered by scrolling the mouse wheel up & down.
; Pressing the left mouse button will then trigger the hard attack.
; Default: true
RemapAllowed := true

; Set the key being used to enable/disable Attack Remap.
; Default: F1
; Note: Do NOT remove the quotation marks.
RemapKey := "F1"

; Set how long the left mouse button should be held in millisecond to form the hard attack.
; Default: 500
; Min. value: 300
; Max. value: 600
AttackDelay := 500

; Set if Auto Tag is allowed.
; Default: true
AutoTagAllowed := true

; Set the key being used to enable/disable Auto Tag.
; Default: F2
; Note: Do NOT remove the quotation marks.
AutoTagKey := "F2"

; Set the time in millisecond between each tag.
; Default: 500
; Min. value: 50
; Max. value: 3000
TagInterval := 500