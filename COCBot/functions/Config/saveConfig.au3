;Saves all of the GUI values to the config.

Func saveConfig() ;Saves the controls settings to the config
	;Search Settings------------------------------------------------------------------------
	IniWrite($config, "search", "searchGold", GUICtrlRead($txtMinGold))
	IniWrite($config, "search", "searchElixir", GUICtrlRead($txtMinElixir))
	IniWrite($config, "search", "searchDark", GUICtrlRead($txtMinDarkElixir))
	IniWrite($config, "search", "searchTrophy", GUICtrlRead($txtMinTrophy))

	If GUICtrlRead($chkMeetGxE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionGoldElixir", 1)
	Else
		IniWrite($config, "search", "conditionGoldElixir", 0)
	 EndIf

	If GUICtrlRead($chkMeetGorE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionGoldorElixir", 1)
	Else
		IniWrite($config, "search", "conditionGoldorElixir", 0)
	EndIf

	If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDark", 1)
	Else
		IniWrite($config, "search", "conditionDark", 0)
	EndIf

	If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTrophy", 1)
	Else
		IniWrite($config, "search", "conditionTrophy", 0)
	 EndIf

	If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTownHall", 1)
	Else
		IniWrite($config, "search", "conditionTownHall", 0)
	 EndIf

	If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTownHallO", 1)
	Else
		IniWrite($config, "search", "conditionTownHallO", 0)
	 EndIf
	 
	If GUICtrlRead($chkTakeLootSS) = $GUI_CHECKED Then
		IniWrite($config, "search", "TakeLootSnapShot", 1)
	Else
		IniWrite($config, "search", "TakeLootSnapShot", 0)
	 EndIf

	If GUICtrlRead($chkTakeTownSS) = $GUI_CHECKED Then
		IniWrite($config, "search", "TakeAllTownSnapShot", 1)
	Else
		IniWrite($config, "search", "TakeAllTownSnapShot", 0)
	 EndIf

   IniWrite($config, "search", "THLevel", _GUICtrlComboBox_GetCurSel($cmbTH))
	;Attack Settings-------------------------------------------------------------------------
	IniWrite($config, "attack", "deploy", _GUICtrlComboBox_GetCurSel($cmbDeploy))
	IniWrite($config, "attack", "algorithm", _GUICtrlComboBox_GetCurSel($cmbAlgorithm))

	If GUICtrlRead($radDeadBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "mode", 0)
	ElseIf GUICtrlRead($radWeakBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "mode", 1)
	ElseIf GUICtrlRead($radAllBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "mode", 2)
	EndIf

	If GUICtrlRead($chkKingAttackDeadBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-dead", 1)
	Else
		IniWrite($config, "attack", "king-dead", 0)
	EndIf
	If GUICtrlRead($chkKingAttackAllBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-all", 1)
	Else
		IniWrite($config, "attack", "king-all", 0)
	EndIf

	If GUICtrlRead($chkQueenAttackDeadBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-dead", 1)
	Else
		IniWrite($config, "attack", "queen-dead", 0)
	EndIf
	If GUICtrlRead($chkQueenAttackAllBases) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-all", 1)
	Else
		IniWrite($config, "attack", "queen-all", 0)
	EndIf

	If GUICtrlRead($chkUseClanCastle) = $GUI_CHECKED Then
		IniWrite($config, "attack", "use-cc", 1)
	Else
		IniWrite($config, "attack", "use-cc", 0)
	 EndIf

	If GUICtrlRead($chkAttackTH) = $GUI_CHECKED Then
		IniWrite($config, "attack", "townhall", 1)
	Else
		IniWrite($config, "attack", "townhall", 0)
	EndIf
	;Donate Settings-------------------------------------------------------------------------
	If GUICtrlRead($chkRequest) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkRequest", 1)
	Else
		IniWrite($config, "donate", "chkRequest", 0)
	EndIf
	;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	If GUICtrlRead($chkDonateAllBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateAllArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateAllGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllGiants", 0)
	EndIf
	;```````````````````````````````````````````````
	If GUICtrlRead($chkDonateBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateGiants", 0)
	EndIf

	IniWrite($config, "donate", "xCCPos", $CCPos[0])
	IniWrite($config, "donate", "yCCPos", $CCPos[1])

	IniWrite($config, "donate", "txtRequest", GUICtrlRead($txtRequest))

	IniWrite($config, "donate", "txtDonateBarbarians", StringReplace(GUICtrlRead($txtDonateBarbarians), @CRLF, "|"))
	IniWrite($config, "donate", "txtDonateArchers", StringReplace(GUICtrlRead($txtDonateArchers), @CRLF, "|"))
	IniWrite($config, "donate", "txtDonateGiants", StringReplace(GUICtrlRead($txtDonateGiants), @CRLF, "|"))
	;Troop Settings--------------------------------------------------------------------------
	IniWrite($config, "troop", "composition", _GUICtrlComboBox_GetCurSel($cmbTroopComp))
	IniWrite($config, "troop", "capacity", GUICtrlRead($txtCapacity))
	If _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 9 Then
	   IniWrite($config, "troop", "barbarian", GUICtrlRead($txtBarbarians))
	   IniWrite($config, "troop", "archer", GUICtrlRead($txtArchers))
	   IniWrite($config, "troop", "goblin", GUICtrlRead($txtGoblins))
	EndIf
	IniWrite($config, "troop", "giant", GUICtrlRead($txtNumGiants))
	IniWrite($config, "troop", "WB", GUICtrlRead($txtNumWallbreakers))
	IniWrite($config, "troop", "troop1", _GUICtrlComboBox_GetCurSel($cmbBarrack1))
	IniWrite($config, "troop", "troop2", _GUICtrlComboBox_GetCurSel($cmbBarrack2))
	IniWrite($config, "troop", "troop3", _GUICtrlComboBox_GetCurSel($cmbBarrack3))
	IniWrite($config, "troop", "troop4", _GUICtrlComboBox_GetCurSel($cmbBarrack4))
	For $i = 0 To 3 ;Covers all 4 Barracks
		IniWrite($config, "troop", "xBarrack" & $i + 1, $barrackPos[$i][0])
		IniWrite($config, "troop", "yBarrack" & $i + 1, $barrackPos[$i][1])
	Next
	;General Settings--------------------------------------------------------------------------
	Local $frmBotPos = WinGetPos($sBotTitle)
	IniWrite($config, "general", "frmBotPosX", $frmBotPos[0])
	IniWrite($config, "general", "frmBotPosY", $frmBotPos[1])
	IniWrite($config, "general", "MaxTrophy", GUICtrlRead($txtMaxTrophy))

	If GUICtrlRead($chkBackground) = $GUI_CHECKED Then
		IniWrite($config, "general", "Background", 1)
	Else
		IniWrite($config, "general", "Background", 0)
	EndIf

	For $i = 0 To 16 ;Covers all Collectors
		IniWrite($config, "general", "xCollector" & $i + 1, $collectorPos[$i][0])
		IniWrite($config, "general", "yCollector" & $i + 1, $collectorPos[$i][1])
	 Next
	 ;Traps Settings
	 IniWrite($config, "general", "xTrap", $TrapPos[0])
	IniWrite($config, "general", "yTrap", $TrapPos[1])
EndFunc   ;==>saveConfig