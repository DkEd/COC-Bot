;Checks the troops when in battle, checks for type, slot, and quantity.
;Saved in $atkTroops[SLOT][TYPE/QUANTITY] variable

Func PrepareAttack($remainding = false) ;Assigns troops
  If $remainding Then
	  SetLog("Checking remainding unlaunched troops")
   Else
	  SetLog("Preparing to attack")
   EndIf
  _CaptureRegion()
  For $i = 0 To 8
	  Local $troopKind = IdentifyTroopKind($i)
		  If $icmbAlgorithm = 8 Then
			For $x = 0 To 3
			 $troopKind = IdentifyTroopKind($i)
			 If $troopKind = $eBarbarian And $barrackTroop[$x] = 0 Then
				$atkTroops[$i][0] = $troopKind
				ExitLoop
			 ElseIf $troopKind = $eArcher And $barrackTroop[$x] = 1 Then
				$atkTroops[$i][0] = $troopKind
				ExitLoop
			 ElseIf $troopKind = $eGiant And $barrackTroop[$x] = 2 Then
				$atkTroops[$i][0] = $troopKind
				ExitLoop
			 ElseIf $troopKind = $eGoblin And $barrackTroop[$x] = 3 Then
				$atkTroops[$i][0] = $troopKind
				ExitLoop
			 ElseIf $troopKind = $eWallbreaker And $barrackTroop[$x] = 4 Then
				$atkTroops[$i][0] = $troopKind
				ExitLoop
			 ElseIf $troopKind <> $eKing And $troopKind <> $eQueen And $troopKind <> $eCastle And $troopKind <> $eLSpell Then
				$troopKind = -1
			 EndIf
			Next
		  ElseIf $troopKind <> $eKing And $troopKind <> $eQueen And $troopKind <> $eCastle And $troopKind <> $eLSpell And ($troopKind = $eBarbarian And ($icmbAlgorithm = 0 Or $icmbAlgorithm = 2)) Or ($troopKind = $eArcher And ($icmbAlgorithm = 1 Or $icmbAlgorithm = 2)) Or ($troopKind = $eGiant And ($icmbAlgorithm = 0 Or $icmbAlgorithm = 1 Or $icmbAlgorithm = 2 Or $icmbAlgorithm = 3 Or $icmbAlgorithm = 6)) Or ($troopKind = $eGoblin And ($icmbAlgorithm = 0 Or $icmbAlgorithm = 1 Or $icmbAlgorithm = 3 Or $icmbAlgorithm = 5)) Or ($troopKind = $eWallbreaker And ($icmbAlgorithm <> 7 And $icmbAlgorithm <> 8 And $icmbAlgorithm <> 9)) Then
			 $troopKind = -1
		  EndIf

	  If ($troopKind == -1) Then
		 $atkTroops[$i][1] = 0
	  ElseIf ($troopKind = $eKing) Or ($troopKind = $eQueen) Or ($troopKind = $eCastle) Then
		 $atkTroops[$i][1] = 1
	  Else
		 $atkTroops[$i][1] = ReadTroopQuantity($i)
	  EndIf
	  $atkTroops[$i][0] = $troopKind
	  If $troopKind <> -1 Then SetLog("-" & NameOfTroop($atkTroops[$i][0]) & " " & $atkTroops[$i][1])
  Next
EndFunc   ;==>PrepareAttack
