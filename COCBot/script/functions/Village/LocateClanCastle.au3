;Locates Clan Castle manually (Temporary)

Func LocateClanClastle()
	While 1
		$MsgBox = MsgBox(1 + 262144, "Locate Clan Castle", "Click OK then click on your Clan Castle", 0, $frmBot)
		If $MsgBox = 1 Then
			$CCPos[0] = FindPos()[0]
			$CCPos[1] = FindPos()[1]
			SetLog("-Clan Castle =  " & "(" & $CCPos[0] & "," & $CCPos[1] & ")")
		EndIf
		ExitLoop
	WEnd
EndFunc   ;==>LocateClanClastle