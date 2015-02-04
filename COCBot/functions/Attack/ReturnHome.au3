;Returns home when in battle, will take screenshot and check for gold/elixir change unless specified not to.

Func ReturnHome($TakeSS = 1, $GoldChangeCheck = True) ;Return main screen
		If $GoldChangeCheck = True Then
			If $checkKPower Or $checkQPower Then
				If _Sleep(50000 - $delayActivateKQ) Then Return
			Else
				If _Sleep(50000) Then Return
			EndIf
			While GoldElixirChange()
				If _Sleep(1000) Then Return
			WEnd
		EndIf

		$checkKPower = False
		$checkQPower = False
		SetLog("Returning Home", $COLOR_BLUE)
		If $RunState = False Then Return
		Click(62, 519) ;Click Surrender
		If _Sleep(500) Then Return
		Click(512, 394) ;Click Confirm
		If _Sleep(2000) Then Return

		If $TakeSS = 1 Then
			SetLog("Taking snapshot of your loot", $COLOR_ORANGE)
			Local $Date = @MDAY & "." & @MON & "." & @YEAR
			Local $Time = @HOUR & "." & @MIN
			_CaptureRegion()
			_GDIPlus_ImageSaveToFile($hBitmap, $dirLoots & $Date & " at " & $Time & ".jpg")
		EndIf

		If _Sleep(2000) Then Return
		Click(428, 544) ;Click Return Home Button

		Local $counter = 0
		While 1
			If _Sleep(2000) Then Return
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Then
				_GUICtrlEdit_SetText($txtLog, "")
				Return
			EndIf

			$counter += 1

			If $counter >= 50 Then
				SetLog("Cannot return home.", $COLOR_RED)
				checkMainScreen()
				Return
			EndIf
		WEnd
EndFunc   ;==>ReturnHome