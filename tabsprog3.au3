#include <Misc.au3>
#include <Array.au3>
#include <Memory.au3>
#include <GuiButton.au3>
;#include <Container.au3>
#include <TabConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ComboConstants.au3>
#include <WindowsConstants.au3>

;Building get cpu process gui.
;@ beamtic,melba23,hargrove,evilertoaster,skitty,SmOke_N,autoitscript,rizz,
;@ Vikasthange,thetechgame,cax,wiseone,sudarkrao,rama,nurzaly,mrt
;Methods: GUI,Send,Loop,Case,Run,Tab,Button,Label,Koda,Opt,Local,Func,
;CaseID,SetState,WEnd,Input,txt,msg,MouseClick,IsPressed,StringStripWS

;Step 1. Gui box, first tab, second tab.
#Region ### START Koda GUI section ### form=
Opt('MustDeclareVars',1)
MainGUI()
func MainGUI()
Local $AMD,$MSI,$RT,$TM,$CAMD,$CMSI,$CRT,$ZID,$SCP,$CCP,$DPR,$msg,$tab
Local $CaseID,$hGUI,$CDR,$RPC,$BPW,$CGT1,$textbox,$aButtonText,$hWnd
Local $edit,$shutdown,$reboot,$cancel,$t,$browset
Local $DAMD,$DMSI,$DRT,$DCPUZ,$DEVGA,$userdata
Local $setxt1,$setxt2,$setxt3,$setxt4,$setxt5

$hGUI=GUICreate("Multi Program Clocking Tool.",600,600)
;$NewTabButton=GUICtrlCreateButton("+",475,10,50,20)
 ;GUISetState()
 GUICtrlCreateTab(0,0,600,600)
 ; Create child GUIs to hold tabs
 ;$Tab1=GUICreate("",400,200,50,20,$WS_POPUP,$WS_EX_MDICHILD,$hGUI)
 $tab=GUICtrlCreateTabItem("tab1")
 $tab=GUICtrlCreateLabel("label1",0,0,50,20)
 ;$hTab_11=GUICtrlCreateTabitem("11")
 $AMD=GUICtrlCreateButton  ("Call AMD OverDrive",0,30,150,30)
 ;$hTab_12=GUICtrlCreateTabitem("12")
 $MSI=GUICtrlCreateButton("Call MSI AfterBurner",0,60,150,30)
 ;$hTab_11=GUICtrlCreateTabitem("11")
 $RT=GUICtrlCreateButton       ("Call RivaTuner",0,90,150,30)
 ;$hTab_12=GUICtrlCreateTabitem("12")
 $TM=GUICtrlCreateButton   ("Start TaskManager",0,120,150,30)

 $ZID=GUICtrlCreateButton   ("Call cpuz",0,150,150,30)

 $SCP=GUICtrlCreateButton ("Call Control Panel",0,180,150,30)

 ;GUICtrlCreateTabitem ("")
; GUISetState()

 ;$Tab2=GUICreate("",400,200,50,250,$WS_POPUP,$WS_EX_MDICHILD,$hGUI)

 ;$hTab_21=GUICtrlCreateTabitem("21")
  $CAMD=GUICtrlCreateInput("Clock with AMD",150,30,150,30)
 ;$hTab_22=GUICtrlCreateTabitem("22")
  $CMSI=GUICtrlCreateInput("Clock with MSI",150,60,150,30)
 ;$hTab_21=GUICtrlCreateTabitem("21")
  $CRT= GUICtrlCreateInput("Clock with RT",150,90,150,30)
 ;$hTab_22=GUICtrlCreateTabitem("22")
  $CCP= GUICtrlCreateButton("CPU Specs",150,120,150,30)
  ;$hTab_21=GUICtrlCreateTabitem("21")
  $BPW=GUICtrlCreateButton("Clock with Win Panel",150,150,150,30)
  ;$RPC=GUICtrlCreateButton("Restart PC",200,180,120,30)

  ;$CDR= GUICtrlCreateButton("Download progs",200,180,120,30)

   $textbox =GUICtrlCreateInput("enter file path here then press download option then enter",00,210,450,30)


  ;$edit=GUICtrlCreateInput("",10,10)

  $shutdown= GUICtrlCreateButton("shutdown",300,30,150,30)

  $reboot= GUICtrlCreateButton("reboot",300,60,150,30)

  $cancel= GUICtrlCreateButton("cancel",300,90,150,30)

  ;$DPR=GUICtrlCreateInput("",40,10)

  $DAMD= GUICtrlCreateButton("Download AMD Overdirve",450,30,150,30)

  $DMSI= GUICtrlCreateButton("Download MSI AfterBurner",450,60,150,30)

  $DRT= GUICtrlCreateButton("Download RivaTuner",450,90,150,30)

  $DCPUZ= GUICtrlCreateButton("Download CPUZ",450,120,150,30)

  $DEVGA= GUICtrlCreateButton("Download EVGA",450,150,150,30)

  ;$setxt1 = GUICtrlCreateInput($CGT1, 10, 30, 150)
  ;$setxt2 = GUICtrlCreateInput("My text", 10, 60, 150)
  ;$setxt3 = GUICtrlCreateInput("My text", 10, 90, 150)
  ;$setxt4 = GUICtrlCreateInput("My text", 10,120, 150)
  ;$setxt5 = GUICtrlCreateInput("My text", 10,150, 150)

$tab=GUICtrlCreateTabItem("tab2")
$tab=GUICtrlCreateTabItem("tab3")
$tab=GUICtrlCreateTabItem("tab4")
 GUICtrlCreateTabitem ("")
 GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$CaseID=1
While 1
	$msg=GUIGetMsg()
	Select
		 Case $msg=$GUI_EVENT_CLOSE
			ExitLoop
;Step 1.1. Auto return cpu model info.
	 Case $msg=$CCP
		Run("control.exe SYSDM.cpl")
;Step 1.2. Auto return cpu load info.

;Step 2. Button to call AMD OverDrive.
		 Case $msg=$AMD
			Run("path to AMD OverDrive.exe")
;Step 3. Button to call MSI AfterBurner.
	     Case $msg=$MSI
			Run("path to MSIAfterburner.exe")
;Step 4. Button to call RivaTuner.
         Case $msg=$RT
			Run("path to RivaTuner.exe")
;Step 5. Button to call Task Manager.
         Case $msg=$TM
		    MouseClick($MOUSE_CLICK_RIGHT,1270,1060,1)
			MouseClick($MOUSE_CLICK_LEFT,1510,960,1)
			;MouseClick($MOUSE_CLICK_RIGHT,1136,884,1)
			;MouseClick($MOUSE_CLICK_LEFT,452,646,1)
			;Send("{LCTRL}{Lshift}{esc}")just closes the program
;Step 6. Button to Call CPUID.
		 Case $msg=$ZID
			Run("path to CPUZ.exe")
;Step 7. Button to call the Control Panel.
		 Case $msg=$SCP
		Run("control.exe powercfg.cpl")
;Step 8. Button to clock through AMD Overdrive.
		Case $msg=$CAMD
			Run("path to AMD OverDrive.exe")
			$t=WinWait("[CLASS:QWidget35]","",10)
			if WinExists("QWidget35") then
			$CGT1=ControlGetText("QWidget35","","[CLASS:QWidget;INSTANCE:44]")
			endif
			$setxt1=ControlSetText($t,"","QWidget44",$CGT1)
			if Send("{ENTER}") then
			ControlSend($setxt1,"","QWidget44","C:\Users\User1\Saved Games\Science\graph\AMD OverDrive\AMD OverDrive.exe")
			endif
;Step 9. Button to clock through MSI AfterBurner.
		Case $msg=$CMSI
			Run("path to MSIAfterburner.exe")
;Step 10. Button to clock through Riva Tuner.
		Case $msg=$CRT
			Run("path to RivaTuner.exe")

;Step 11. Button to clock through Control Panel.
         Case $msg=$BPW
	    Run("control.exe powercfg.cpl,,2")
       WinWait("[CLASS:Power Options;Instance:4]","",10)
        ControlClick($hWnd,"","Change plan settings")
;Step 12. Buttons to restart PC.

			Case $msg=$shutdown
			   Shutdown(1)
			Case $msg=$reboot
               Shutdown(2)
            Case $msg=$cancel
             Return

;Step 13. Buttons to download the 5 progs from repos.
         ;Case $msg=$DPR
		;	MsgBox(1+1,"Select Browser","Paste FilePath of Browser")
		;	$textbox =GUICtrlCreateInput("enter filepath here",10,210,150)
			;$userdata=GUICtrlRead($textbox,$GUI_READ_EXTENDED)

		;	MsgBox(1+1,"downloads","Click Options as Below")

        Case $msg=$browset

			 ;If _IsPressed("0D",$hGUI) Then
				 $userdata=StringStripWS(GUICtrlRead($textbox),4)
				 run("$userdata")
				 Run("$textbox")
				 ;EndIf
				 ;Send("!d")
				 ;Run("$userdata")



		Case $msg=$DAMD
			Run("$browset")
			;Send("!d")
			;Run("$userdata")
		    Send ("!dhttp://download.amd.com/Desktop/aod_setup_4.3.1.0698.exe{ENTER}")
		Case $msg=$DMSI
			Run("$browset")
			Send("http://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip{ENTER}")
		Case $msg=$DRT
			Run("$browset")
			Send("https://www.softpedia.com/dyn-postdownload.php/b80d4a9fbb122d7dc53ef05026b6ef07/5cd8eaf9/1ad3/4/2{ENTER}")
		Case $msg=$DEVGA
			Run("$browset")
			Send("https://www.evga.com/precisionxoc/{ENTER}")
		Case $msg=$DCPUZ
			Run("$browset")
			Send("https://cpuid.com/softwares/cpu-z.html{ENTER}");Then pick a customized version.

	    EndSelect
	WEnd
EndFunc