;Returns complete value of other

Func getOther($x_start, $y_start, $type)
	_CaptureRegion(0, 0, $x_start + 90, $y_start + 20)
	;-----------------------------------------------------------------------------
	Local $x = $x_start, $y = $y_start
	Local $Number, $i = 0

	Switch $type
		Case "Trophy"
			$Number = getDigit($x, $y, "Other")

			While $Number = ""
				If $i >= 50 Then ExitLoop
				$i += 1
				$x += 1
				$Number = getDigit($x, $y, "Other")
			WEnd

			$Number &= getDigit($x, $y, "Other")
			$Number &= getDigit($x, $y, "Other")
			$Number &= getDigit($x, $y, "Other")
	EndSwitch

	Return $Number
EndFunc   ;==>getOther