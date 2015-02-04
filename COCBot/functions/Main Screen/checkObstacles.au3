;Checks whether something is blocking the pixel for mainscreen and tries to unblock
;Returns True when there is something blocking

Func checkObstacles() ;Checks if something is in the way for mainscreen
	$Message = _PixelSearch(457, 300, 458, 330, Hex(0x33B5E5, 6), 10) ;Check for out of sync or inactivity
	If IsArray($Message) Then
		Click(416, 399);Check for out of sync or inactivity
		If _Sleep(7000) Then Return
		Return True
	EndIf

	_CaptureRegion()
	If _ColorCheck(_GetPixelColor(235, 209), Hex(0x9E3826, 6), 20) Then
		Click(429, 493);See if village was attacked, clicks Okay
		Return True
	EndIf

	If _ColorCheck(_GetPixelColor(284, 28), Hex(0x215B69, 6), 20) Then
		Click(1, 1) ;Click away If things are open
		Return True
	EndIf

	If _ColorCheck(_GetPixelColor(819, 55), Hex(0xD80400, 6), 20) Then
		Click(819, 55) ;Clicks X
		Return True
	EndIf

	If _ColorCheck(_GetPixelColor(822, 48), Hex(0xD80408, 6), 20) Or _ColorCheck(_GetPixelColor(830, 59), Hex(0xD80408, 6), 20) Then
		Click(822, 48) ;Clicks X
		Return True
	EndIf

	If _ColorCheck(_GetPixelColor(331, 330), Hex(0xF0A03B, 6), 20) Then
		Click(331, 330) ;Clicks chat thing
		If _Sleep(1000) Then Return
		Return True
	EndIf

	If _ColorCheck(_GetPixelColor(429, 519), Hex(0xB8E35F, 6), 20) Then
		Click(429, 519) ;If in that victory or defeat scene
		Return True
	EndIf

	If _ColorCheck(_GetPixelColor(71, 530), Hex(0xC00000, 6), 20) Then
		ReturnHome(False, False) ;If End battle is available
		Return True
	EndIf

	Return False
EndFunc   ;==>checkObstacles
