Func algorithmTH() ;Attack Algorithm TH
	If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
		$LeftTHx = 40
		$RightTHx = 30
		$BottomTHy = 30
		$TopTHy = 30
		$GetTHLoc = 0
		If $THLocation = 0 Then
			SetLog("Can't get Townhall location")
		ElseIf $THx > 287 And $THx < 584 And $THy > 465 And GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
			SetLog("Townhall location (" & $THx & ", " & $THy &")")
			SetLog("Townhall is in Bottom of Base. Ignore Attacking Townhall")
			$THLocation = 0
		ElseIf $THx > 227 And $THx < 627 And $THy > 151 And $THy < 419 And GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
			SetLog("Townhall location (" & $THx & ", " & $THy &")")
			SetLog("Townhall is in Center of Base. Ignore Attacking Townhall")
			$THLocation = 0
		Else
			SetLog("Townhall location (" & $THx & ", " & $THy &")")
		EndIf
		If _Sleep(100) Then Return
		While 1
		  Local $i = 0
		  If $Barb <> -1 And $THLocation <> 0 Then
				  $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
				  Local $numBarbPerSpot = Ceiling($atkTroops[$Barb][1] / 3)
				  If $atkTroops[$Barb][1] <> 0 Then
					  Click(68 + (72 * $Barb), 595) ;Select Troop
					  If _Sleep(100) Then ExitLoop (2)
					  If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
						  If $GetTHLoc = 0 Then
							 $i = 0
						  $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
						  While $atkTroops[$Barb][1] <> 0
							  Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), 1, 1) ; BottomLeft
							  $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
							  SetLog("Getting Attack Townhall location...")
							  $LeftTHx += 10
							  $i += 1
							  If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 5 Then
								  $GetTHLoc += 1
								  ExitLoop
							  EndIf
						   WEnd
						   $i = 0
						 $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
						  While $atkTroops[$Barb][1] <> 0
							  Click(($THx+$RightTHx), ($THy+$RightTHx-10), 1, 1) ; BottomRight
							  $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
							  SetLog("Getting Attack Townhall location...")
							  $RightTHx += 10
							  $i += 1
							  If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 5 Then
								  $GetTHLoc += 1
								  ExitLoop
							  EndIf
						   WEnd
						   $i = 0
						 $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
						  While $atkTroops[$Barb][1] <> 0
							  Click(($THx+$TopTHy-10), ($THy-$TopTHy), 1, 1) ; TopRight
							  $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
							  SetLog("Getting Attack Townhall location...")
							  $TopTHy += 10
							  $i += 1
							  If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 5 Then
								  $GetTHLoc += 1
								  ExitLoop
							  EndIf
						   WEnd
						   $i = 0
						 $atkTroops[$Barb][1] = Number(getNormal(40 + (72 * $Barb), 565))
						  While $atkTroops[$Barb][1] <> 0
							  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), 1, 1) ; TopLeft
							  $AtkTroopTH = Number(getNormal(40 + (72 * $Barb), 565))
							  SetLog("Getting Attack Townhall location...")
							  $BottomTHy += 10
							  $i += 1
							  If $AtkTroopTH <> $atkTroops[$Barb][1] Or $i >= 5 Then
								  $GetTHLoc += 1
								  ExitLoop
							  EndIf
						   WEnd
						 EndIf
						  SetLog("Attacking Townhall with first wave Barbarians")
						  If $GetTHLoc = 2 Then $numBarbPerSpot = Ceiling($numBarbPerSpot / 2)
						  If $GetTHLoc = 3 Then $numBarbPerSpot = Ceiling($numBarbPerSpot / 3)
						  If $GetTHLoc = 4 Then $numBarbPerSpot = Ceiling($numBarbPerSpot / 4)
						  Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), $numBarbPerSpot, 100) ; BottomLeft
						  Click(($THx+$RightTHx), ($THy+$RightTHx-10), $numBarbPerSpot, 100) ; BottomRight
						  Click(($THx+$TopTHy-10), ($THy-$TopTHy), $numBarbPerSpot, 100) ; TopRight
						  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), $numBarbPerSpot, 100) ; TopLeft
					  EndIf
				  EndIf
		  If _Sleep(1000) Then ExitLoop
		  EndIf
		  If $Arch <> -1 And $THLocation <> 0 Then
			  $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
			  Local $numArchPerSpot = Ceiling($atkTroops[$Arch][1] / 3)
			  If $atkTroops[$Arch][1] <> 0 Then
				  Click(68 + (72 * $Arch), 595) ;Select Troop
				  If _Sleep(100) Then ExitLoop (2)
				  If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
					  If $GetTHLoc = 0 Then
						 $i = 0
					  $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
					  While $atkTroops[$Arch][1] <> 0
						  Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), 1, 1) ; BottomLeft
						  $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
						  SetLog("Getting Attack Townhall location...")
						  $LeftTHx += 10
						  $i += 1
						  If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 5 Then
							  $GetTHLoc += 1
							  ExitLoop
						  EndIf
					   WEnd
					   $i = 0
					 $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
					  While $atkTroops[$Arch][1] <> 0
						  Click(($THx+$RightTHx), ($THy+$RightTHx-10), 1, 1) ; BottomRight
						  $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
						  SetLog("Getting Attack Townhall location...")
						  $RightTHx += 10
						  $i += 1
						  If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 5 Then
							  $GetTHLoc += 1
							  ExitLoop
						  EndIf
					   WEnd
					   $i = 0
					 $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
					  While $atkTroops[$Arch][1] <> 0
						  Click(($THx+$TopTHy-10), ($THy-$TopTHy), 1, 1) ; TopRight
						  $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
						  SetLog("Getting Attack Townhall location...")
						  $TopTHy += 10
						  $i += 1
						  If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 5 Then
							  $GetTHLoc += 1
							  ExitLoop
						  EndIf
					   WEnd
					   $i = 0
					 $atkTroops[$Arch][1] = Number(getNormal(40 + (72 * $Arch), 565))
					  While $atkTroops[$Arch][1] <> 0
						  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), 1, 1) ; TopLeft
						  $AtkTroopTH = Number(getNormal(40 + (72 * $Arch), 565))
						  SetLog("Getting Attack Townhall location...")
						  $BottomTHy += 10
						  $i += 1
						  If $AtkTroopTH <> $atkTroops[$Arch][1] Or $i >= 5 Then
							  $GetTHLoc += 1
							  ExitLoop
						  EndIf
					   WEnd
					 EndIf
					  SetLog("Attacking Townhall with first wave of Archers")
					  $LeftTHx += 10
					  $RightTHx += 10
					  $BottomTHy += 10
					  $TopTHy += 10
					  If $GetTHLoc = 2 Then $numArchPerSpot = Ceiling($numArchPerSpot / 2)
					  If $GetTHLoc = 3 Then $numArchPerSpot = Ceiling($numArchPerSpot / 3)
					  If $GetTHLoc = 4 Then $numArchPerSpot = Ceiling($numArchPerSpot / 4)
					  Click(($THx-$LeftTHx), ($THy+$LeftTHx-30), $numArchPerSpot, 100) ; BottomLeft
					  Click(($THx+$RightTHx), ($THy+$RightTHx-10), $numArchPerSpot, 100) ; BottomRight
					  Click(($THx+$TopTHy-10), ($THy-$TopTHy), $numArchPerSpot, 100) ; TopRight
					  Click(($THx-($BottomTHy+10)), ($THy-$BottomTHy), $numArchPerSpot, 100) ; TopLeft
				  EndIf
			  EndIf
		  EndIf
		  ExitLoop
		WEnd
		If $THLocation <> 0 Then
		   PrepareAttack(True) ;Check remaining quantities
		EndIf
	EndIf
 EndFunc   ;==>algorithmTH