;==>ReArm
Func ReArm()
	While 1
		If $TrapPos[0] = -1 Then
			LocateTrap()
			SaveConfig()
			If _Sleep(1000) Then ExitLoop
		EndIf
		Click(1, 1)
		If _Sleep(1000) Then ExitLoop
		Click($TrapPos[0], $TrapPos[1])
		If _Sleep(1000) Then ExitLoop
		_CaptureRegion()
		$Rearm = _PixelSearch(446, 591, 604, 614, Hex(0xB2A79B, 6), 10)
		If IsArray($Rearm) Then
			Click($Rearm[0], $Rearm[1])
			If _Sleep(1000) Then Return
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(350, 420), Hex(0xC83B10, 6), 20) Then
				Click(515, 400)
			Else
				SetLog("All traps armed", $COLOR_ORANGE)
			EndIf
			If _Sleep(500) Then ExitLoop
			Click(1, 1)
		Else
			SetLog("Traps not found", $COLOR_RED)
			If _Sleep(10000) Then Return
		EndIf
		ExitLoop
	WEnd
EndFunc   ;==>ReArm