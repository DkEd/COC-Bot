Func LocateBarrack()
	SetLog("Locating Barracks...", $COLOR_BLUE)
	Local $MsgBox
	While 1
		While 1
			$MsgBox = MsgBox(6 + 262144, "Locate first barrack", "Click Continue then click on your first barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[0][0] = FindPos()[0]
				$barrackPos[0][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=0 To 3
				   $barrackPos[$i][0] = ""
				   $barrackPos[$i][1] = ""
			    Next
				ExitLoop (2)
			EndIf
			If _Sleep(500) Then ExitLoop
			$MsgBox = MsgBox(6 + 262144, "Locate second barrack", "Click Continue then click on your second barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[1][0] = FindPos()[0]
				$barrackPos[1][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=1 To 3
				   $barrackPos[$i][0] = ""
				   $barrackPos[$i][1] = ""
			    Next
				ExitLoop (2)
			EndIf
			If _Sleep(500) Then ExitLoop
			$MsgBox = MsgBox(6 + 262144, "Locate third barrack", "Click Continue then click on your third barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[2][0] = FindPos()[0]
				$barrackPos[2][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				For $i=2 To 3
				   $barrackPos[$i][0] = ""
				   $barrackPos[$i][1] = ""
			    Next
				ExitLoop (2)
			EndIf
			If _Sleep(500) Then ExitLoop
			$MsgBox = MsgBox(6 + 262144, "Locate fourth barrack", "Click Continue then click on your fourth barrack. Cancel if not available. Try again to start over.", 0, $frmBot)
			If $MsgBox = 11 Then
				$barrackPos[3][0] = FindPos()[0]
				$barrackPos[3][1] = FindPos()[1]
			ElseIf $MsgBox = 10 Then
				ExitLoop
			Else
				$barrackPos[3][0] = ""
				$barrackPos[3][1] = ""
			EndIf
			If GUICtrlRead($chkRequest) = $GUI_CHECKED And $CCPos[0] = -1 Then LocateClanClastle()
			ExitLoop (2)
		WEnd
	WEnd
	SaveConfig()
	SetLog("-Locating Complete-", $COLOR_BLUE)
	SetLog("-Barrack 1 = " & "(" & $barrackPos[0][0] & "," & $barrackPos[0][1] & ")", $COLOR_GREEN)
	SetLog("-Barrack 2 = " & "(" & $barrackPos[1][0] & "," & $barrackPos[1][1] & ")", $COLOR_GREEN)
	SetLog("-Barrack 3 = " & "(" & $barrackPos[2][0] & "," & $barrackPos[2][1] & ")", $COLOR_GREEN)
	SetLog("-Barrack 4 = " & "(" & $barrackPos[3][0] & "," & $barrackPos[3][1] & ")", $COLOR_GREEN)
EndFunc   ;==>LocateBarrack