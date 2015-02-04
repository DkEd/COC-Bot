#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <GUIEdit.au3>
#include <GUIComboBox.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPIProc.au3>
#include <ScreenCapture.au3>
#include <Date.au3>
#include <Misc.au3>
#include <File.au3>
#include <TrayConstants.au3>
#include <GUIMenu.au3>
#include <ColorConstants.au3>
#include <GDIPlus.au3>
#include <GuiRichEdit.au3>
#include <GuiTab.au3>

GLOBAL CONST $COLOR_ORANGE = 0xFFA500

Global $Compiled
If @Compiled Then
	$Compiled = "Executable"
Else
	$Compiled = "Au3 Script"
EndIf

Global $hBitmap; Image for pixel functions
Global $hHBitmap; Handle Image for pixel functions

Global $Title = "BlueStacks App Player" ; Name of the Window
Global $HWnD = WinGetHandle($Title) ;Handle for Bluestacks window

Global $config = @ScriptDir & "\config.ini"
Global $dirLogs = @ScriptDir & "\logs\"
Global $dirLoots = @ScriptDir & "\Loots\"
Global $dirAllTowns = @ScriptDir & "\AllTowns\"
Global $sLogPath ; `Will create a new log file every time the start button is pressed
Global $hLogFileHandle
Global $Restart = False
Global $RunState = False
Global $TakeLootSnapShot = True
Global $TakeAllTownSnapShot = False


Global $cmbTroopComp ;For Event change on ComboBox Troop Compositions
Global $iCollectCounter = 0 ; Collect counter, when reaches $COLLECTATCOUNT, it will collect
Global $COLLECTATCOUNT = 8 ; Run Collect() after this amount of times before actually collect
;---------------------------------------------------------------------------------------------------
Global $BSpos[2] ; Inside BlueStacks positions relative to the screen
;---------------------------------------------------------------------------------------------------
;Search Settings
Global $searchGold, $searchElixir, $searchDark, $searchTrophy, $searchTH ;Resources of bases when searching
Global $MinGold, $MinElixir, $MinDark, $MinTrophy, $MaxTH ; Minimum Resources conditions
Global $chkConditions[6] ;Conditions (meet gold...)
Global $icmbTH
Global $THLocation
Global $THx = 0, $THy = 0
Global $THText[5] ; Text of each Townhall level
$THText[0] = "4-6"
$THText[1] = "7"
$THText[2] = "8"
$THText[3] = "9"
$THText[4] = "10"
Global $SearchCount = 0 ;Number of searches

;Troop types
Global Enum $eBarbarian, $eArcher, $eGiant, $eGoblin, $eWallbreaker, $eKing, $eQueen, $eCastle, $eLSpell

;Attack Settings
Global $TopLeft[5][2] = [[110, 250], [170, 205], [234, 162], [296, 115], [368, 66]]
Global $TopRight[5][2] = [[480, 63], [540, 104], [589, 146], [655, 190], [717, 240]]
Global $BottomLeft[5][2] = [[79, 342], [142, 389], [210, 446], [276, 492], [339, 539]]
Global $BottomRight[5][2] = [[523, 537], [595, 484], [654, 440], [715, 393], [779, 344]]
Global $Edges[4] = [$BottomRight, $TopRight, $BottomLeft, $TopLeft ]

Global $atkTroops[9][2] ;9 Slots of troops -  Name, Amount
Global $icmbAlgorithm ;Algorithm to use when attacking

Global $fullArmy ;Check for full army or not
Global $deploySettings ;Method of deploy found in attack settings

Global $KingAttack[3] ;King attack settings
Global $QueenAttack[3] ;Queen attack settings

Global $checkKPower = False ; Check for King activate power
Global $checkQPower = False ; Check for Queen activate power
Global $delayActivateKQ = 6000 ;Delay before activating KQ
Global $checkUseClanCastle ; Use Clan Castle settings
Global $iradAttackMode ;Attack mode, 0 1 2

Global $THLoc
Global $chkATH

Global $King, $Queen, $CC, $Barb, $Arch
Global $LeftTHx, $RightTHx, $BottomTHy, $TopTHy
Global $AtkTroopTH
Global $GetTHLoc

;Boosts Settings
Global $remainingBoosts = 0 ;  remaining boost to active during session
Global $boostsEnabled = 1 ; is this function enabled

; Traps Settings
Global $TrapPos[2] = [-1, -1] ;Position of trap
;Donate Settings
Global $CCPos[2] = [-1, -1] ;Position of clan castle

Global $ichkRequest = 0 ;Checkbox for Request box
Global $itxtRequest = "" ;Request textbox

Global $ichkDonateAllBarbarians = 0
Global $ichkDonateBarbarians = 0
Global $itxtDonateBarbarians = ""

Global $ichkDonateAllArchers = 0
Global $ichkDonateArchers = 0
Global $itxtDonateArchers = ""

Global $ichkDonateAllGiants = 0
Global $ichkDonateGiants = 0
Global $itxtDonateGiants = ""

;Troop Settings
Global $icmbTroopComp ;Troop Composition
Global $icmbTroopCap ;Troop Capacity
Global $BarbariansComp
Global $ArchersComp
Global $GiantsComp
Global $GoblinsComp
Global $WBComp
Global $CurBarb
Global $CurArch
Global $CurGiant
Global $CurGoblin
Global $CurWB
Global $ArmyComp

Global $barrackPos[4][2] ;Positions of each barracks
Global $barrackTroop[4] ;Barrack troop set

;General Settings
Global $botPos[2] ; Position of bot used for Hide function
Global $frmBotPosX ; Position X of the GUI
Global $frmBotPosY ; Position Y of the GUI
Global $Hide = False ; If hidden or not

Global $itxtMaxTrophy ; Max trophy before drop trophy
Global $ichkBackground ; Background mode enabled disabled
Global $collectorPos[17][2] ;Positions of each collectors