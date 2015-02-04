;Goes into a match, breaks shield if it has to

Func PrepareSearch() ;Click attack button and find match button, will break shield
	While 1
		Click(60, 614);Click Attack Button
		If _Sleep(1000) Then ExitLoop
		Click(217, 510);Click Find a Match Button
		If _Sleep(4000) Then ExitLoop
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(513, 416), Hex(0x5DAC10, 6), 50) Then
			Click(513, 416);Click Okay To Break Shield
		EndIf
		ExitLoop
	WEnd
EndFunc   ;==>PrepareSearch