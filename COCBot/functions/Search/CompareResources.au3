;Compares the searched values to the minimum values, returns false if doesn't meet.
;Every 20 searches, it will decrease minimum by certain amounts.

Func CompareResources() ;Compares resources and returns true if conditions meet, otherwise returns false
	If $SearchCount <> 0 And Mod($SearchCount, 20) = 0 Then
		If $MinGold - 5000 >= 0 Then $MinGold -= 5000
		If $MinElixir - 5000 >= 0 Then $MinElixir -= 5000
		If $MinDark - 100 >= 0 Then $MinDark -= 100
		If $MinTrophy - 2 >= 0 Then $MinTrophy -= 2
		SetLog("~Gold: " & $MinGold & "; Elixir: " & $MinElixir & "; Dark: " & $MinDark & "; Trophy: " & $MinTrophy & "; Townhall: " & $MaxTH, $COLOR_GREEN)
	EndIf
	Local $G = (Number($searchGold) >= Number($MinGold)), $E = (Number($searchElixir) >= Number($MinElixir)), $D = (Number($searchDark) >= Number($MinDark)), $T = (Number($searchTrophy) >= Number($MinTrophy))
	Local $THL = -1, $THLO = -1

	For $i = 0 To 4
		If $searchTH = $THText[$i] Then $THL = $i
	Next
	
	Switch $THLoc
	Case "Inside"
		$THLO = 0
	Case "Outside"
		$THLO = 1
	EndSwitch

	If GUICtrlRead($chkMeetGxE) = $GUI_CHECKED Then
		If $G = False Or $E = False Then Return False
	EndIf

	If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
		If $D = False Then Return False
	EndIf

	If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
		If $T = False Then Return False
	 EndIf

	If GUICtrlRead($chkMeetGorE) = $GUI_CHECKED Then
		If $G = False And $E = False Then Return False
	 EndIf

	If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
		If $THL = -1 Or $THL > _GUICtrlComboBox_GetCurSel($cmbTH) Then Return False
    EndIf

	If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
		If $THLO <> 1 Then Return False
    EndIf

	Return True
EndFunc   ;==>CompareResources