;Locates collectors manually (Temporary)

Func LocateCollectors()
	SetLog("Locating Collectors...", $COLOR_BLUE)
	Local $MsgBox
	While 1
	   For $i = 0 To 16
		   $MsgBox = MsgBox(6 + 262144, "Locate collector #" & $i + 1, "Click Continue then click on your collector #" & $i + 1 & ". Cancel if not available. Try again to start over.", 0, $frmBot)
		   If $MsgBox = 11 Then
			   $collectorPos[$i][0] = FindPos()[0]
			   $collectorPos[$i][1] = FindPos()[1]
			   If _Sleep(500) Then ExitLoop
		   ElseIf $MsgBox = 10 Then
			   ExitLoop
		   Else
			   For $i=$i To 16
				  $collectorPos[$i][0] = ""
				  $collectorPos[$i][1] = ""
			   Next
			   ExitLoop (2)
		   EndIf
		   SetLog("-Collector #" & $i + 1 & " = " & "(" & $collectorPos[$i][0] & "," & $collectorPos[$i][1] & ")", $COLOR_GREEN)
		Next
	 ExitLoop
	 WEnd
	SaveConfig()
	SetLog("-Locating Complete-", $COLOR_BLUE)
EndFunc   ;==>LocateCollectors