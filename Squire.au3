#RequireAdmin
#include <AutoItConstants.au3>
#include <Misc.au3>
#include <ImageSearch.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

MsgBox(0,"Notice","Press OK")
WinActive("Mabinogi")
$ClientSize = WinGetClientSize("[TITLE:Mabinogi]")




Const $Squire = "./Squire.ini"
Const $LoadDelay = IniRead($Squire, "Delay","LoadDelay","20000")
Const $MoveDelay = IniRead($Squire, "Delay","MoveDelay","10000")
Const $Name = IniRead($Squire, "Squires","Squire","0")
Const $Type = IniRead($Squire, "Type","Type","3")
Const $NoChar = IniRead($Squire, "NoChars","NoChars","8")
Const $Stat = IniRead($Squire, "Stat", "Stat", "1")

HotKeySet( "{ESC}", "Terminate")

Sleep(2000)
$Mouse = MouseGetPos()
;$Color = PixelGetColor($Mouse[0],$Mouse[1],1)
;$Color = PixelSearch($Clientsize[0]/2 - 200,$Clientsize[1]/2 - 250,$Clientsize[1]/2,$Clientsize[0]/2,0xC06000,50)
;MouseMove($Mouse[0]+300,$Mouse[1]+300,1)
;$Color = PixelSearch($Mouse[0],$Mouse[1],$Mouse[1]+300,$Mouse[0]+300,0xFF6969)
;MouseMove($Color[0],$Color[1],1)
;MsgBox(0,"",Hex($Color))
;MsgBox(0,"",$Color[0],$Color[1])


$Counter = 0
$Cycle = 0
While 1
Local $StartTimer = TimerInit()

if Search("./pngs/Soulstream.png") = 0 Then
   Send("m")
   Sleep(1000)
EndIf
if Search("./pngs/Soulstream.png") = 1 Then
   Sleep(3000)
   MouseMove(($ClientSize[0] / 2),($ClientSize[1] / 2),1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(3000)
   MouseClick("LEFT")
   Sleep(1000)
   ;hits continue
   MouseMove($ClientSize[0]/2 - 400, $Clientsize[1] - 65,1)
   Sleep(1000)
   Skip()
EndIf

Sleep(1000)
Send("c")
Sleep(1000)

;missions only
if $Type = 2 Then

   CompleteMission()

   If Mod($Cycle, 50) = 0 Then
	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)
	  Sleep(1000)
	  Enter()
	  Counsel()
	  Logout()
	  Local $EndTimer = TimerDiff($StartTimer)
	  Sleep(((2250000 / $NoChar) - $Endtimer))

	  ContinueLoop
   EndIf

   Mission()

   Send("{ESC}")
   Sleep(250)
   Send("{ESC}")
   Sleep(250)
   Send("{ESC}")
   Sleep(250)
   Send("{ESC}")
   Sleep(250)

   Logout()
   Local $EndTimer = TimerDiff($StartTimer)
   Sleep(((2250000 / $NoChar) - $Endtimer))

   ContinueLoop
EndIf

Enter()

If $Cycle = 0 Then
   CompleteMission()
   Sleep(1000)
EndIf

;Interact with Kanna
if $Name = 0 or $Name = 2 Then
   if MoveTo(0) = 1 Then

	  StartConversation()
	  $Conversation = MouseGetPos()

	  If $Type = 1 Then
		 CompleteTraining()
		 Sleep(4000)
		 StartConversation()
		 Training()
	  EndIf


	  If $Type = 0 Then
		 If $Cycle = 0 Then
			CompleteTraining()
			Sleep(4000)
			StartConversation()
		 EndIf
		 MouseClick("LEFT")
		 Sleep(1000)
		 Conversation()
		 Conversation()
		 Conversation()
		 MouseClick("LEFT")
		 Sleep(1000)
	  EndIf

	  MouseMove($Conversation[0],$Conversation[1],1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(100)
	  Send("{TAB}")
	  Sleep(100)
	  Send("`")
	  Sleep(100)
   EndIf
   MouseMove($ClientSize[0],$ClientSize[1],1)
EndIf

Send("{ESC}")
Sleep(250)
Send("{ESC}")
Sleep(250)
Send("{ESC}")
Sleep(250)
Send("{ESC}")
Sleep(250)

;Interact with Logan
if $Name = 1 or $Name = 2 Then
   if MoveTo(1) = 1 Then
	  StartConversation()
	  $Conversation = MouseGetPos()

	  If $Type = 1 Then
		 CompleteTraining()
		 Sleep(4000)
		 StartConversation()
		 Training()
	  EndIf

	  If $Type = 0 Then
		 If $Cycle = 0 Then
			CompleteTraining()
			Sleep(4000)
			StartConversation()
		 EndIf
		 MouseClick("LEFT")
		 Sleep(1000)
		 Conversation()
		 Conversation()
		 Conversation()
		 MouseClick("LEFT")
		 Sleep(1000)
	  EndIf

	  MouseMove($Conversation[0],$Conversation[1],1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(100)
	  Send("{TAB}")
	  Sleep(100)
	  Send("`")
	  Sleep(100)
   EndIf
   MouseMove($ClientSize[0],$ClientSize[1],1)
EndIf


Send("{ESC}")
Sleep(250)
Send("{ESC}")
Sleep(250)
Send("{ESC}")
Sleep(250)
Send("{ESC}")
Sleep(250)

Logout()

Local $EndTimer = TimerDiff($StartTimer)
Sleep(((2250000 / $NoChar) - $Endtimer))
WEnd

Func Counsel()
   if $Name = 0 or $Name = 2 Then
	  if MoveTo(0) = 1 Then
		 If $Cycle = 0 Then
			StartConversation()
			CompleteTraining()
			Sleep(4000)
		 EndIf
		 StartConversation()
		 $Conversation = MouseGetPos()

		 MouseMove($Conversation[0] + 200,$Conversation[1],1)
		 Sleep(1000)
		 MouseClick("LEFT")
		 Sleep(1000)
		 MouseMove($Conversation[0],$Conversation[1],1)
		 Sleep(1000)
		 Skip()
		 Send("{TAB}")
		 Sleep(100)
		 Send("`")
		 Sleep(100)
	  EndIf
	  MouseMove($ClientSize[0]/2,$ClientSize[1]/2,1)
   EndIf
   Sleep(1000)
   if $Name = 1 or $Name = 2 Then
	  if MoveTo(1) = 1 Then
		 If $Cycle = 0 Then
			StartConversation()
			CompleteTraining()
			Sleep(4000)
		 EndIf
		 StartConversation()
		 $Conversation = MouseGetPos()

		 MouseMove($Conversation[0] + 200,$Conversation[1],1)
		 Sleep(1000)
		 MouseClick("LEFT")
		 Sleep(1000)
		 MouseMove($Conversation[0],$Conversation[1],1)
		 Sleep(1000)
		 Skip()
		 Send("{TAB}")
		 Sleep(100)
		 Send("`")
		 Sleep(100)
	  EndIf
	  MouseMove($ClientSize[0]/2,$ClientSize[1]/2,1)
   EndIf
   Sleep(1000)
EndFunc

Func Terminate()
   Sleep(1000)
   MsgBox(0,"","Thank you for using SquireBot")
   Exit

EndFunc

Func MoveTo($Name)
   Local $Mouse
   Local $CharX, $CharY
   Local $Value
   ;establish a frame of reference
   if Search("./pngs/Avalon.jpg") = 0 Then
	  Send("m")
	  Sleep(1000)
	  $Value = MoveTo($Name)
	  Return $Value
   Else
 	  $Mouse = MouseGetPos()
	  if $Name = 0 Then
		 ;move to kanna
		 $Color = PixelSearch($Mouse[0]-20,$Mouse[1]-75,$Mouse[0]+15,$Mouse[1]-40,0x00FF00)
		 If @error = 1 Then
			Return 0
		 EndIf

		 if Not @error Then
			MouseMove($Mouse[0], $Mouse[1]-60,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep($MoveDelay)
		 EndIf
	  ElseIf $Name = 1 Then
		 ;move to logan
		 $Color = PixelSearch($Mouse[0]-100,$Mouse[1]-75,$Mouse[0]-70,$Mouse[1]-40,0x00FF00)
		 If @error = 1 Then
			Return 0
		 EndIf

		 if Not @error Then
			MouseMove($Mouse[0]-85, $Mouse[1]-60,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep($MoveDelay)
		 EndIf
	  EndIf

	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)


	  Return 1
   EndIf
EndFunc

Func StartConversation()
   Local $CharX,$CharY

   Send("{ESC}")
   Sleep(1000)
   ;Talk to
   MouseMove(($ClientSize[0] / 2),($ClientSize[1] / 2),1)
   Sleep(1000)
   Send("{CTRLDOWN}")
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)
   Send("{CTRLUP}")
   Sleep(1000)
   ;hits continue
   if Search("./pngs/Frame.jpg") = 0 Then
	  Send("{ESC}")
	  Sleep(1000)
	  StartConversation()
   Else
	  MouseMove($ClientSize[0]/2, $Clientsize[1] - 100,1)
	  Sleep(1000)
	  Skip()
   EndIf

   $result = _ImageSearchArea("./pngs/Conversation.png",1,0,$ClientSize[1]/2,$ClientSize[0],$ClientSize[1],$CharX,$CharY,50)
   if $result = 0 Then
	  Skip()
	  Sleep(1000)
	  StartConversation()
   Else
	  MouseMove($CharX,$CharY,1)
	  Sleep(1000)
	  Return

   EndIf

   Return

EndFunc

;talking
Func Conversation()
   Local $Mouse = MouseGetPos()
   Local $CharX,$CharY

   MouseMove($Mouse[0] + 75,$Mouse[1],1)
   Sleep(1000)
   Skip()

   Switch 1
   Case _ImageSearchArea("./pngs/fashion.png",1,0,$ClientSize[1]/2,$ClientSize[0],$ClientSize[1],$CharX,$CharY,50)
	  ;MouseMove($ClientSize[0] - $Mouse[0],$Mouse[1],1)
	  Sleep(1000)
	  MouseMove($ClientSize[0] - $Mouse[0] - 25,$Mouse[1] - 145,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

   Case _ImageSearchArea("./pngs/mission.png",1,0,$ClientSize[1]/2,$ClientSize[0],$ClientSize[1],$CharX,$CharY,50)
	  ;MouseMove($ClientSize[0] - $Mouse[0],$Mouse[1],1)
	  Sleep(1000)
	  MouseMove($ClientSize[0] - $Mouse[0] - 190,$Mouse[1] - 170,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

   Case _ImageSearchArea("./pngs/cooking.png",1,0,$ClientSize[1]/2,$ClientSize[0],$ClientSize[1],$CharX,$CharY,50)
	  ;MouseMove($ClientSize[0] - $Mouse[0],$Mouse[1],1)
	  Sleep(1000)
	  MouseMove($ClientSize[0] - $Mouse[0] - 25,$Mouse[1] - 195,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

   Case _ImageSearchArea("./pngs/training.png",1,0,$ClientSize[1]/2,$ClientSize[0],$ClientSize[1],$CharX,$CharY,50)
	  ;MouseMove($ClientSize[0] - $Mouse[0],$Mouse[1],1)
	  Sleep(1000)
	  MouseMove($ClientSize[0] - $Mouse[0] - 190,$Mouse[1] - 115,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

   Case _ImageSearchArea("./pngs/dating.png",1,0,$ClientSize[1]/2,$ClientSize[0],$ClientSize[1],$CharX,$CharY,50)
	  ;MouseMove($ClientSize[0] - $Mouse[0],$Mouse[1],1)
	  Sleep(1000)
	  MouseMove($ClientSize[0] - $Mouse[0] - 25,$Mouse[1] - 85,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

   Case Else
	  ;MouseMove($ClientSize[0] - $Mouse[0],$Mouse[1],1)
	  Sleep(1000)
	  MouseMove($ClientSize[0] - $Mouse[0] - 190,$Mouse[1] - 50,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

   EndSwitch

   MouseMove($Mouse[0] + 75,$Mouse[1],1)
   Sleep(1000)
   Skip()
   MouseMove($Mouse[0],$Mouse[1],1)
   Sleep(1000)
   Return

EndFunc

Func CompleteTraining()
   Local $Rat = MouseGetPos()
   Local $CharX,$CharY

   MouseMove($Rat[0] + 100,$Rat[1],1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   if Search("./pngs/Frame.jpg") = 0 Then
	  Sleep(1000)
	  CompleteTraining()
   Else
	  $Mouse = MouseGetPos()

	  MouseMove($Mouse[0] + 350, $Mouse[1] + 615,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)
	  MouseMove($ClientSize[0]/2 + 50,$ClientSize[1]/2 + 100,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)
	  MouseMove($Rat[0],$Rat[1],1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(100)
	  Send("{TAB}")
	  Sleep(250)
	  Send("`")
	  Sleep(250)

	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Sleep(250)
	  Send("{ESC}")
	  Return
   EndIf
   Return

EndFunc

;runs your training
Func Training()
   Local $Mouse = MouseGetPos()
   Local $CharX, $CharY

   MouseMove($Mouse[0] + 100,$Mouse[1],1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   if Search("./pngs/Frame.jpg") = 0 Then
	  Sleep(1000)
	  Training()
   Else
	  $Mouse = MouseGetPos()

	  MouseMove($Mouse[0]+ 100, $Mouse[1] + 300,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

	  if $Stat = 0 Then
		 $Temp = Mod($Cycle, 6) + 1
	  Else
		 $Temp = $Stat
	  EndIf
	  MouseMove($Mouse[0] + 100, $Mouse[1] + 315 + (15 * $Temp),1)
	  Sleep(1000)
	  MouseWheel("down",1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

	  $Training = IniRead($Squire, "Training", "Training", "3")
	  MouseMove($Mouse[0] + 100, $Mouse[1] + 345 + (25 * $Training),1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)
	  MouseMove($Clientsize[0]/2 + 65,$Clientsize[1]/2 + 175,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

	  Return
   EndIf
EndFunc

Func CompleteMission()
   Local $Mouse, $Rat, $Squirrel
   Local $CharX, $CharY
   Local $Completed = 2
   ;establish frame of reference with the character menu
   if Search("./pngs/Frame.jpg") = 0 Then
	  Send("c")
	  Sleep(1000)
	  CompleteMission()
   Else
	  $Mouse = MouseGetPos()

	  ;special Unit
	  MouseMove($Mouse[0] + 275,$Mouse[1]+ 75,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)
	  ;quest tracker to missions
	  MouseMove($Mouse[0]+ 325,$Mouse[1] + 415,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)

	  ;missions menu
	  Send("c")
	  Sleep(1000)
	  if Search("./pngs/Frame.jpg") = 0 Then
		 Send("{ESC}")
		 Sleep(1000)
		 CompleteMission()
	  Else
		 $Rat = MouseGetPos()

		 MouseMove($Rat[0] + 100,$Rat[1] + 40,1)
		 Sleep(1000)
		 MouseClick("LEFT")
		 Sleep(1000)
		 $Color = PixelSearch($Rat[0]+100,$Rat[1]+40,$Rat[1]+200,$Rat[0]+200,0xFF6969)
		 If @error = 1 Then
			$Completed = $Completed - 1
		 Else
			MouseMove($Color[0] + 50,$Color[1],1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)

			Search("./pngs/Frame.jpg")
			$Mouse = MouseGetPos()
			;Select squire
			MouseMove($Mouse[0] + 500, $Mouse[1]+ 125,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)
			;Select Mission
			MouseMove($Mouse[0]+ 500, $Mouse[1] + 455,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)

			;hit accept
			MouseMove(($ClientSize[0] / 2) + 55,($ClientSize[1] / 2) + 100,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)
		 EndIf
		 Sleep(2000)
		 MouseMove($Rat[0] + 100,$Rat[1] + 40,1)
		 Sleep(1000)
		 MouseClick("LEFT")
		 Sleep(1000)
		 $Color = PixelSearch($Rat[0]+100,$Rat[1]+40,$Rat[1]+200,$Rat[0]+200,0xFF6969)
		 If @error = 1 Then
			$Completed = $Completed - 1
		 Else
			MouseMove($Color[0] + 50,$Color[1],1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)

			Search("./pngs/Frame.jpg")
			$Mouse = MouseGetPos()
			;Select squire
			MouseMove($Mouse[0] + 500, $Mouse[1]+ 125,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)
			;Select Mission
			MouseMove($Mouse[0]+ 500, $Mouse[1] + 455,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)

			;hit accept
			MouseMove(($ClientSize[0] / 2) + 55,($ClientSize[1] / 2) + 100,1)
			Sleep(1000)
			MouseClick("LEFT")
			Sleep(1000)
		 EndIf
	  EndIf
   EndIf
EndFunc

;runs your missions
Func Mission()

   Search("./pngs/Frame.jpg")
   $Rat = MouseGetPos()

   ;missions
   MouseMove($Rat[0], $Rat[1] + 40,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)
   ;preference
   MouseMove($Rat[0] + 200, $Rat[1] + 65,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   $Order = IniRead($Squire,"Squires","Order","Logan")
   if $Order = "Kanna" Then
	  MouseMove($Rat[0] + 475, $Rat[1] + 100,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)
   EndIf
   ;Select first mission
   MouseMove($Rat[0]+ 100, $Rat[1] + 125,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   Search("./pngs/Frame.jpg")
   $Mouse = MouseGetPos()
   ;Select squire
   MouseMove($Mouse[0] + 500, $Mouse[1]+ 125,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)
   ;Select Mission
   MouseMove($Mouse[0]+ 500, $Mouse[1] + 455,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   ;hit accept
   MouseMove(($ClientSize[0] / 2) + 55,($ClientSize[1] / 2) + 100,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   ;Select first mission
   MouseMove($Rat[0],$Rat[1],1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)
   MouseMove($Rat[0]+ 100, $Rat[1] + 125,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)
   ;Select squire
   MouseMove($Mouse[0] + 500, $Mouse[1]+ 150,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)
   ;Select Mission
   MouseMove($Mouse[0]+ 500, $Mouse[1] + 455,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   ;hit accept
   MouseMove(($ClientSize[0] / 2) + 55,($ClientSize[1] / 2) + 100,1)
   Sleep(1000)
   MouseClick("LEFT")
   Sleep(1000)

   ;MouseMove($Rat[0] + 300, $Rat[1] + 40,1)
   ;Sleep(1000)
   ;MouseClick("LEFT")
   ;Sleep(1000)
   ;MouseMove($Rat[0] + 50, $Rat[1] + 40,1)
   ;Sleep(1000)
   ;MouseClick("LEFT")
   ;Sleep(1000)
   ;MouseMove($Rat[0] + 630, $Rat[1] + 125,1)
   ;Sleep(1000)
   ;MouseClick("LEFT")
   ;Sleep(1000)
   ;MouseMove($Rat[0] + 630, $Rat[1] + 165,1)
   ;Sleep(1000)
   ;MouseClick("LEFT")
   ;Sleep(1000)

   Return
EndFunc

;Enter Avalon
Func Enter()
   Local $Mouse
   Local $CharX, $CharY
   ;establish frame of reference with the character menu
   if Search("./pngs/Frame.jpg") = 0 Then
	  Send("c")
	  Sleep(1000)
	  Enter()
   Else
	  $Mouse = MouseGetPos()

	  ;goes to tracker
	  ;MouseMove($Mouse[0] + 365,$Mouse[1] + 80,1)
	  ;Sleep(1000)
	  ;MouseClick("LEFT")
	  ;Sleep(3000)
	  ;MouseClick("LEFT")
	  ;Sleep(3000)
	  MouseMove($Mouse[0] + 285,$Mouse[1]+ 70,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep(1000)
	  MouseMove($Mouse[0]+ 325,$Mouse[1]+ 375,1)
	  Sleep(1000)
	  MouseClick("LEFT")
	  Sleep($LoadDelay)

	  Return
   EndIf

EndFunc

;im too lazy to call image search everytime
Func Search($Path)
   Local $CharX, $CharY
   $result = _ImageSearch($Path,1,$CharX,$CharY,60)
   if $result = 1 Then
	  MouseMove($CharX,$CharY,1)
	  Sleep(1000)
	  Return 1
   EndIf

   ;MsgBox(0,"","didnt work")
   Sleep(1000)
   Return 0
EndFunc

Func Skip()

   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
   MouseClick("LEFT",Default,Default,2)
   SLeep(200)
EndFunc
;Logout
Func Logout()
   ;Local $LoadDelay = IniRead($Squire, "Delay", "LoadDelay", "20000")

   ;actually logging off
   Send("{ENTER}")
   Sleep(1000)
   Send("/trimram")
   Sleep(1000)
   Send("{ENTER}")
   Sleep(1000)
   Send("/logout")
   Sleep(1000)
   Send("{ENTER}")
   Sleep($LoadDelay)

   ;switching characters
   Send("{LEFT}")
   Sleep(1000)
   Send("{ENTER}")
   Sleep(500)
   Send("{ENTER}")
   $Counter = $Counter + 1
   If $Counter = $NoChar Then
	  $Cycle = $Cycle + 1
	  $Counter = 0
   EndIf
   Sleep($LoadDelay)
EndFunc
