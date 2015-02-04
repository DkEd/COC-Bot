Func LocateTrap()
	While 1
		$MsgBox = MsgBox(1 + 262144, "Locate Trap", "Click OK then click on one of your traps", 0, $frmBot)
		If $MsgBox = 1 Then
			WinActivate($HWnD)
			$TrapPos[0] = FindPos()[0]
			$TrapPos[1] = FindPos()[1]
			SetLog("-Trap =  " & "(" & $TrapPos[0] & "," & $TrapPos[1] & ")", $COLOR_GREEN)
		EndIf
		ExitLoop
	WEnd
	Click(1, 1)
EndFunc   ;==>LocateTrap