;Clickes the collector locations

Func Collect()
	If $collectorPos[0][0] = "" Then
		LocateCollectors()
		SaveConfig()
		If _Sleep(2000) Then Return
	EndIf
	SetLog("Collecting Resources", $COLOR_BLUE)
	_Sleep(250)
	Click(1, 1) ;Click Away
	For $i = 0 To 16
		If _Sleep(150) Or $RunState = False Then ExitLoop
		Click($collectorPos[$i][0], $collectorPos[$i][1]) ;Click collector
		Click(1, 1) ;Click Away
	Next
EndFunc   ;==>Collect