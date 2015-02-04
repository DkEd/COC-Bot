;Searches for a village that until meets conditions

Func VillageSearch($TakeSS = 0) ;Control for searching a village that meets conditions
	While 1
		Switch $iradAttackMode
			Case 0
				SetLog("============Searching For Dead Base============")
			Case 1
				SetLog("============Searching For Weak Base============")
			Case 2
				SetLog("============Searching For All Base============")
		EndSwitch
		SetLog("~Gold: " & $MinGold & "; Elixir: " & $MinElixir & "; Dark: " & $MinDark & "; Trophy: " & $MinTrophy & "; Townhall: " & $MaxTH, $COLOR_GREEN)
		If $TakeSS = 1 Then SetLog("Will save all of the towns when searching", $COLOR_GREEN)
		$SearchCount = 0
		While 1
			If _Sleep(1000) Then ExitLoop (2)
			GetResources() ;Reads Resource Values

			If $Restart = True Then ExitLoop (2)

			If $TakeSS = True Then
			   Local $Date = @MDAY & "." & @MON & "." & @YEAR
			   Local $Time = @HOUR & "." & @MIN & "." & @SEC
			   _CaptureRegion()
			   _GDIPlus_ImageSaveToFile($hBitmap, @ScriptDir & "\AllTowns\" & $Date & " at " & $Time & ".png")
			EndIf
			If CompareResources() Or ($THLoc = "Outside" And GUICtrlRead($chkMeetTHO) <> $GUI_CHECKED And GUICtrlRead($chkAttackTH) = $GUI_CHECKED) Then
				If $THLoc = "Outside" And GUICtrlRead($chkMeetTHO) <> $GUI_CHECKED And GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
					SetLog("~~~~~~~Outside Townhall Found!~~~~~~~", $COLOR_PURPLE)
					ExitLoop
				ElseIf $iradAttackMode = 0 Then
					If checkDeadBase() Then
						SetLog("~~~~~~~Dead Base Found!~~~~~~~", $COLOR_GREEN)
						ExitLoop
					Else
						SetLog("~~~~~~~Not dead base, skipping~~~~~~~", $COLOR_RED)
						Click(750, 500) ;Click Next
					EndIf
				Else
					ExitLoop
				EndIf
			Else
				Click(750, 500) ;Click Next
			EndIf
		WEnd
		If GUICtrlRead($chkAlertSearch) = $GUI_CHECKED Then
			TrayTip("Match Found!", "Gold: " & $searchGold & "; Elixir: " & $searchElixir & "; Dark: " & $searchDark & "; Trophy: " & $searchTrophy  & "; Townhall: " & $searchTH & ", " & $THLoc, 0)
			If FileExists(@WindowsDir & "\media\Windows Exclamation.wav") Then
			   SoundPlay(@WindowsDir & "\media\Windows Exclamation.wav", 1)
			Else
			   SoundPlay(@WindowsDir & "\media\Festival\Windows Exclamation.wav", 1)
			EndIf
		EndIf
		SetLog("===============Searching Complete===============")
		readConfig()
		ExitLoop
	WEnd
EndFunc   ;==>VillageSearch