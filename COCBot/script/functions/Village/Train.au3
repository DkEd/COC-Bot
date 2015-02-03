;Uses the location of manually set Barracks to train specified troops

; Train the troops (Fill the barracks)

Func GetTrainPos($troopKind)
   Switch $troopKind
   Case $eBarbarian ; 261, 366: 0x39D8E0
	  Return $TrainBarbarian
   Case $eArcher ; 369, 366: 0x39D8E0
	  Return $TrainArcher
   Case $eGiant ; 475, 366: 0x3DD8E0
	  Return $TrainGiant
   Case $eGoblin ; 581, 366: 0x39D8E0
	  Return $TrainGoblin
   Case $eWallbreaker ; 688, 366, 0x3AD8E0
	  Return $TrainWallbreaker
   Case Else
	  SetLog("Don't know how to train the troop " & $troopKind & " yet")
	  Return 0
   EndSwitch
EndFunc

Func TrainIt($troopKind, $howMuch=1, $iSleep = 700)
   _CaptureRegion()
   Local $pos = GetTrainPos($troopKind)
   If IsArray($pos) Then
	  If CheckPixel($pos) Then
		 ClickP($pos, $howMuch)
		 if _Sleep($iSleep) Then Return False
		 Return True
	  EndIf
   EndIf
EndFunc

Func Train()
	If $barrackPos[0][0] = "" Then
		LocateBarrack()
		SaveConfig()
		If _Sleep(2000) Then Return
	EndIf
	SetLog("Training Troops...", $COLOR_BLUE)

	For $i = 0 To 3
		If _Sleep(500) Then ExitLoop

		ClickP($TopLeftClient) ;Click Away

		If _Sleep(500) Then ExitLoop

		Click($barrackPos[$i][0], $barrackPos[$i][1]) ;Click Barrack

		If _Sleep(500) Then ExitLoop

		Local $TrainPos = _PixelSearch(155, 603, 694, 605, Hex(0x603818, 6), 5) ;Finds Train Troops button
		If IsArray($TrainPos) = False Then
			SetLog("Barrack " & $i + 1 & " is not available", $COLOR_RED)
			If _Sleep(500) Then ExitLoop
		Else
			Click($TrainPos[0], $TrainPos[1]) ;Click Train Troops button
			If _Sleep(700) Then ExitLoop

			CheckFullArmy()
			If _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 8 Then
				While TrainIt($barrackTroop[$i], 5)
				WEnd
			Else
				; More Troops Settings
				If $ArmyComp >= $icmbTroopCap Then
					SetLog("Troops Capacity is full, waiting for full camps...")
					$ArmyComp = 0
			    EndIf
				If $ArmyComp = 0 Then
					$CurGiant = GUICtrlRead($txtNumGiants)*5
					$CurWB = GUICtrlRead($txtNumWallbreakers)*2
					$CurArch = ($icmbTroopCap-(GUICtrlRead($txtNumGiants)*5)-(GUICtrlRead($txtNumWallbreakers)*2))*GUICtrlRead($txtArchers)/100
					$CurArch = Round($CurArch)
					$CurBarb = ($icmbTroopCap-(GUICtrlRead($txtNumGiants)*5)-(GUICtrlRead($txtNumWallbreakers)*2))*GUICtrlRead($txtBarbarians)/100
					$CurBarb = Round($CurBarb)
					$CurGoblin = ($icmbTroopCap-(GUICtrlRead($txtNumGiants)*5)-(GUICtrlRead($txtNumWallbreakers)*2))*GUICtrlRead($txtGoblins)/100
					$CurGoblin = Round($CurGoblin)
				EndIf

				If GUICtrlRead($txtNumGiants) <> "0" And ($CurGiant <> -1 Or $CurGiant > 0) Then
					While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20) And ($CurGiant <> -1 Or $CurGiant > 0)
						If $CurGiant > 0 Then
							$CurGiant -= 5
							$ArmyComp += 5
							Click(432, 320) ;Giant
							If _Sleep(300) Then ExitLoop (2)
							_CaptureRegion()
						Else
							$CurGiant = "-1"
						EndIf
					WEnd
				ElseIf GUICtrlRead($txtNumWallbreakers) <> "0" And ($CurWB <> -1 Or $CurWB > 0) Then
					While _ColorCheck(_GetPixelColor(648, 292), Hex(0xE0E4D0, 6), 20) = False And _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20) And ($CurWB <> -1 Or $CurWB > 0)
						If $CurWB > 0 Then
							$CurWB -= 2
							$ArmyComp += 2
							Click(647, 320) ;WB
							If _Sleep(300) Then ExitLoop (2)
							_CaptureRegion()
						Else
							$CurWB = "-1"
						EndIf
					WEnd
				 ElseIf GUICtrlRead($txtGoblins) <> "0" And ($CurGoblin <> -1 Or $CurGoblin > 0) Then
					While _ColorCheck(_GetPixelColor(509, 305), Hex(0xE0E4D0, 6), 20) = False And _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20) And ($CurGoblin <> -1 Or $CurGoblin > 0)
						If $CurGoblin > 0 Then
							$CurGoblin -= 1
							$ArmyComp += 1
							Click(546, 320) ;Goblin
							If _Sleep(300) Then ExitLoop (2)
							_CaptureRegion()
						Else
							$CurGoblin = "-1"
						EndIf
					WEnd
				 ElseIf GUICtrlRead($txtBarbarians) <> "0" And ($CurBarb <> -1 Or $CurBarb > 0) Then
					While _ColorCheck(_GetPixelColor(329, 297), Hex(0xDC3F70, 6), 20) And ($CurBarb <> -1 Or $CurBarb > 0)
						If $CurBarb > 0 Then
							$CurBarb -= 1
							$ArmyComp += 1
							Click(220, 320) ;Barbarian
							If _Sleep(300) Then ExitLoop (2)
							_CaptureRegion()
						Else
							$CurBarb = "-1"
						EndIf
					WEnd
				 ElseIf GUICtrlRead($txtArchers) <> "0" And ($CurArch <> -1 Or $CurArch > 0) Then
					While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20) And ($CurArch <> -1 Or $CurArch > 0)
						If $CurArch > 0 Then
							$CurArch -= 1
							$ArmyComp += 1
							Click(331, 320) ;Archer
							If _Sleep(300) Then ExitLoop (2)
							_CaptureRegion()
						Else
							$CurArch = "-1"
						EndIf
					WEnd
				EndIf
			EndIf
		EndIf
		If _Sleep(500) Then ExitLoop
		Click($TopLeftClient[0], $TopLeftClient[1], 2, 250); Click away twice with 250ms delay
	Next

	SetLog("Training Troops Complete", $COLOR_BLUE)
 EndFunc   ;==>Train
