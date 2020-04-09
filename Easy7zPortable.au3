#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\Package.ico
#AutoIt3Wrapper_Res_Icon_Add=C:\Proyectos\PortableEditor\Package.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 1)
$Form1_1 = GUICreate("Easy7zPortable", 563, 431, 315, 105)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1_1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1_1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1_1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1_1Restore")
$PageControl1 = GUICtrlCreateTab(8, 8, 548, 352)
GUICtrlSetOnEvent(-1, "PageControl1Change")
$TabSheet1 = GUICtrlCreateTabItem("MS-DOS")
$Label2 = GUICtrlCreateLabel("Folder to SFX:", 16, 50, 72, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Label2Click")
$Input2 = GUICtrlCreateInput("", 96, 46, 417, 22)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Input2Change")
$Edit1 = GUICtrlCreateEdit("", 16, 136, 257, 169)
GUICtrlSetData(-1, "Edit1")
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Edit1Change")
$Label3 = GUICtrlCreateLabel("DOSBox config:", 16, 117, 81, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Label3Click")
$Label4 = GUICtrlCreateLabel("SFX config:", 288, 117, 60, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Label4Click")
$Edit2 = GUICtrlCreateEdit("", 288, 136, 257, 169)
GUICtrlSetData(-1, "Edit1")
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Edit2Change")
$Button2 = GUICtrlCreateButton("Create SFX", 288, 320, 105, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Button2Click")
$Button1 = GUICtrlCreateButton("...", 520, 44, 25, 24)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Button1Click")
$Button3 = GUICtrlCreateButton("Save cfg", 200, 109, 73, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Button3Click")
$Button4 = GUICtrlCreateButton("Save cfg", 472, 109, 73, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Button4Click")
$Button5 = GUICtrlCreateButton("Test App", 168, 320, 105, 25)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Button5Click")
$Label1 = GUICtrlCreateLabel("Icon SFX:", 40, 82, 50, 18)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Label1Click")
$Input1 = GUICtrlCreateInput("", 96, 78, 417, 22)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Input1Change")
$Button6 = GUICtrlCreateButton("...", 520, 76, 25, 24)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Button6Click")
$Checkbox1 = GUICtrlCreateCheckbox("Delete app temp folder", 16, 324, 129, 17)
GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetOnEvent(-1, "Checkbox1Click")
GUICtrlCreateTabItem("")
$Label5 = GUICtrlCreateLabel("OUT Folder:", 12, 401, 62, 17)
GUICtrlSetOnEvent(-1, "Label5Click")
$Input3 = GUICtrlCreateInput("", 76, 397, 433, 21)
GUICtrlSetOnEvent(-1, "Input3Change")
$Button7 = GUICtrlCreateButton("...", 516, 395, 25, 24)
GUICtrlSetOnEvent(-1, "Button7Click")
$Label6 = GUICtrlCreateLabel("OUT Name:", 156, 369, 61, 17)
GUICtrlSetOnEvent(-1, "Label6Click")
$Input4 = GUICtrlCreateInput("", 220, 365, 185, 21)
GUICtrlSetOnEvent(-1, "Input4Change")
$Pic1 = GUICtrlCreatePic("dosbox.bmp", 504, 312, 41, 41)
GUICtrlSetOnEvent(-1, "Pic1Click")
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)

; Carga Configuración inicial

$file = FileOpen("dosbox.conf")
GUICtrlSetData($Edit1, FileRead($file))
FileClose($file)
$file = FileOpen("config.txt", 128)
GUICtrlSetData($Edit2, FileRead($file))
FileClose($file)

While 1
	Sleep(100)
WEnd

Func Button1Click()
    $sDir = FileSelectFolder("Select folder to make it portable", "", 0, @HomeDrive)
    If StringRight($sDir, 1) <> "\" Then $sDir &= "\"

    If $sDir = "\" Then
        ToolTip("Aborted by the user",0,0)
        Sleep(500)
        ToolTip("",0,0)
    Else 
		GUICtrlSetData($Input2,$sDir)
    EndIf
 EndFunc
 
 Func Button7Click()
    $sDir = FileSelectFolder("Select output folder where you make portable", "", 0, @HomeDrive)
    If StringRight($sDir, 1) <> "\" Then $sDir &= "\"

    If $sDir = "\" Then
        ToolTip("Aborted by the user",0,0)
        Sleep(500)
        ToolTip("",0,0)
    Else 
		GUICtrlSetData($Input3,$sDir)
    EndIf
 EndFunc
 
 Func Button6Click()
    $sFile = FileOpenDialog("Select icon", @HomeDrive, "Icons (*.ico)", 3)
    
    If @error Then
        ToolTip("Aborted by the user",0,0)
        Sleep(500)
        ToolTip("",0,0)
    Else
		GUICtrlSetData($Input1,$sFile)
    EndIf
EndFunc
Func Button2Click()
	If FileExists(GUICtrlRead($Input2)) And FileExists(GUICtrlRead($Input3)) And GUICtrlRead($Input4) <> "" Then
		If StringRight(GUICtrlRead($Input2),1) <> "\" Then
			GUICtrlSetData($Input2, GUICtrlRead($Input2) & "\")
		 EndIf
		 If GuiCtrlRead($Checkbox1) = $GUI_CHECKED Then
			If FileExists(@ScriptDir & "\apptemp") Then
			   DirRemove(@ScriptDir & "\apptemp", 1)
			EndIf
	     EndIf
		If FileExists(@ScriptDir & "\app.7z") Then
			FileDelete(@ScriptDir & "\app.7z")
		EndIf		
	    If Not FileExists(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4)) Then
			DirCopy(GUICtrlRead($Input2), @ScriptDir & "\apptemp\" & GUICtrlRead($Input4), 1)
		 Else
			DirCopy(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4), @ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "_tmp", 1)
			DirCopy(GUICtrlRead($Input2), @ScriptDir & "\apptemp\" & GUICtrlRead($Input4), 1)
			DirCopy(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "_tmp", @ScriptDir & "\apptemp\" & GUICtrlRead($Input4), 1)
			DirRemove(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "_tmp", 1)
		 EndIf
	    FileCopy(@ScriptDir & "\DOSBox.exe",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\DOSBox.exe", 8)
		$file = FileOpen(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\dosbox.conf", 2)
		FileWrite($file,GUICtrlRead($Edit1))
		FileClose($file)
		FileCopy(@ScriptDir & "\SDL.dll",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\SDL.dll")
		FileCopy(@ScriptDir & "\SDL_net.dll",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\SDL_net.dll")		
		FileCopy(GUICtrlRead($Input1), @ScriptDir & "\Icon.ico")
		
				
		$appname = GUICtrlRead($Input4)		
		$pid = Run(Chr(34) & @ScriptDir & "\7zg.exe" & Chr(34) & " a -mx9 -r " & Chr(34) & @ScriptDir & "\" & $appname & ".7z" & Chr(34) & " *",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4), @SW_HIDE)		
		ProgressOn("Creating portable...", "0 %", "")
		While ProcessExists($pid)
			$title = WinGetTitle("[REGEXPTITLE:.+Compr.+7z]", "")
			$perc = StringSplit($title, "%")
			ProgressSet($perc[1], "Compressing '" & GUICtrlRead($Input2) & "'" , $perc[1] & " %")
			Sleep(100)
		WEnd
		
		$file = FileOpen(@ScriptDir & "\configtemp.txt", 130)
		FileWrite($file,GUICtrlRead($Edit2))
		FileClose($file)
	  			
		 If FileExists(GUICtrlRead($Input1)) Then  					   
		   $pid = Run(Chr(34) & @ScriptDir & "\ResHacker.exe" & Chr(34) & " -addoverwrite " & Chr(34) & @ScriptDir & "\7zsd.sfx" & Chr(34) & ", " & Chr(34) & @ScriptDir & "\7zsdtemp.sfx" & Chr(34) & ", Icon.ico,icongroup,101,0",@ScriptDir, @SW_HIDE)
		   While ProcessExists($pid)		 
		   WEnd
		 Else
			FileCopy(@ScriptDir & "\7zsd.sfx", @ScriptDir & "\7zsdtemp.sfx")
		 EndIf	    		 	 
		 
		 $pid = Run("cmd /c copy /b " & Chr(34) & @ScriptDir & "\7zsdtemp.sfx" & Chr(34) & " + " & Chr(34) & @ScriptDir & "\configtemp.txt" & Chr(34) & " + " & Chr(34) & @ScriptDir & "\" & $appname & ".7z" & Chr(34) & " " & Chr(34) & GUICtrlRead($Input3) & $appname & ".exe" & Chr(34),"", @SW_HIDE)
		 While ProcessExists($pid)		 
		 WEnd				
		
		$pid = Run(Chr(34) & @ScriptDir & "\upx.exe" & Chr(34) & " -9 " & Chr(34) & GUICtrlRead($Input3) & $appname & ".exe" & Chr(34),@ScriptDir, @SW_HIDE)
		While ProcessExists($pid)		 
	    WEnd
		
		FileDelete(@ScriptDir & "\configtemp.txt")
		FileDelete(@ScriptDir & "\7zsdtemp.sfx")
		FileDelete(@ScriptDir & "\" & $appname & ".7z")
		FileDelete(@ScriptDir & "\Icon.ico")
		DirRemove(@ScriptDir & "\apptemp", 1)
		
		ProgressOff()
	Else
		MsgBox(16, "Error", "The folders to SFX or Output not exist, select output name too.")
	EndIf
EndFunc
Func Button3Click()

	$file = FileOpen("dosbox.conf", 2)
	FileWrite($file,GUICtrlRead($Edit1))
	FileClose($file)
	MsgBox(64, "Error", "The DOSBox config file has been saved succesfully as template.")

EndFunc
Func Button4Click()

	$file = FileOpen(@ScriptDir & "\config.txt", 130)
	FileWrite($file,GUICtrlRead($Edit2))
	FileClose($file)
	MsgBox(64, "Error", "The SFX config file has been saved succesfully as template.")

EndFunc
Func Button5Click()
	If FileExists(GUICtrlRead($Input2)) And GUICtrlRead($Input4) <> "" Then
		If StringRight(GUICtrlRead($Input2),1) <> "\" Then
			GUICtrlSetData($Input2, GUICtrlRead($Input2) & "\")
		EndIf
		 If GuiCtrlRead($Checkbox1) = $GUI_CHECKED Then
			If FileExists(@ScriptDir & "\apptemp") Then
			   DirRemove(@ScriptDir & "\apptemp", 1)
			EndIf
	     EndIf
		
		If Not FileExists(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4)) Then
			DirCopy(GUICtrlRead($Input2), @ScriptDir & "\apptemp\" & GUICtrlRead($Input4), 1)
		 Else
			DirCopy(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4), @ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "_tmp", 1)
			DirCopy(GUICtrlRead($Input2), @ScriptDir & "\apptemp\" & GUICtrlRead($Input4), 1)
			DirCopy(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "_tmp", @ScriptDir & "\apptemp\" & GUICtrlRead($Input4), 1)
			DirRemove(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "_tmp", 1)
	    EndIf
		FileCopy(@ScriptDir & "\DOSBox.exe",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\DOSBox.exe", 8)		
		$file = FileOpen(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\dosbox.conf", 2)
		FileWrite($file,GUICtrlRead($Edit1))
		FileClose($file)
		FileCopy(@ScriptDir & "\SDL.dll",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\SDL.dll")
		FileCopy(@ScriptDir & "\SDL_net.dll",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\SDL_net.dll")		
		Run(@ScriptDir & "\apptemp\" & GUICtrlRead($Input4) & "\dosbox.exe -noconsole",@ScriptDir & "\apptemp\" & GUICtrlRead($Input4))

	Else
		MsgBox(16, "Error", "The folder to SFX not exists, select output name too.") 
	EndIf
EndFunc
Func Edit1Change()
EndFunc
Func Edit2Change()

EndFunc
Func Form1_1Close()
Exit
EndFunc
Func Form1_1Maximize()

EndFunc
Func Form1_1Minimize()

EndFunc
Func Form1_1Restore()

EndFunc
Func Input2Change()
EndFunc
Func Label2Click()

EndFunc
Func Label3Click()

EndFunc
Func Label4Click()

EndFunc
Func PageControl1Change()

EndFunc
