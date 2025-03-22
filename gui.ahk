#SingleInstance, Force
#Persistent
SetBatchLines, -1
CoordMode, Pixel, screen

Width := 470
Height := 330
CornerRadius := 30
TopBarVisible := true

Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
WinSet, Transparent, 255
Gui, Color, 242424
Gui, Margin, 10, 10

hRgn := DllCall("CreateRoundRectRgn", "int", 0, "int", 0, "int", Width + 1, "int", Height + 1, "int", CornerRadius, "int", CornerRadius, "ptr")
DllCall("SetWindowRgn", "ptr", WinExist(), "ptr", hRgn, "int", true)
DllCall("DeleteObject", "ptr", hRgn)

Gui, Add, Button, x432 y-2 w40 h30 gExitApp +E0x80000 +BackgroundTrans, X
Gui, Add, Button, x5 y-2 w40 h30 gToggleTopBar +E0x80000 +BackgroundTrans, -

Gui, Add, Progress, % "x-1 y-1 w" (Width+2) " h31 BackgroundFCECB3 Disabled hwndHPROG"
Control, ExStyle, -0x20000, , ahk_id %HPROG%
Gui, Add, Text, % "x75 y-2 w" Width " h34 BackgroundTrans Center 0x200 gGuiMove vCaption c232323", TESTETESTESTETSETSE                                        X
Gui, Add, Text, % "x5 y-2 w40 h30 BackgroundTrans Center 0x200", % Chr(8595)

Gui, Font, s10 c181818, Tahoma
Gui, Add, Edit, vJsonEdit w380 h200 -WantTab x50 y70 +VScroll, test

Gui, Font, s10 cFCECB3, Tahoma
Gui, Add, Text, x130 y291 w80 h25 BackgroundTrans Center, test
Gui, Add, Text, x230 y291 w100 h25 BackgroundTrans Center, test

Gui, Add, Button, x130 y287 w80 h25 +E0x80000 vBtnSave
Gui, Add, Button, x230 y287 w100 h25 +E0x80000 vBtnOpen

Gui, Show, w%Width% h%Height%, ZyuL.io AHK  by @mk3o

Return

GuiMove:
    PostMessage, 0xA1, 2,,, A
Return

ToggleTopBar:
    if (TopBarVisible) {
        TopBarVisible := false
        hRgn := DllCall("CreateRoundRectRgn", "int", 0, "int", 0, "int", Width + 1, "int", 40, "int", CornerRadius, "int", CornerRadius, "ptr")
    } else {
        TopBarVisible := true
        hRgn := DllCall("CreateRoundRectRgn", "int", 0, "int", 0, "int", Width + 1, "int", Height + 1, "int", CornerRadius, "int", CornerRadius, "ptr")
    }
    DllCall("SetWindowRgn", "ptr", WinExist(), "ptr", hRgn, "int", true)
    DllCall("DeleteObject", "ptr", hRgn)
Return

ExitApp:
   ExitApp
Return

GuiClose:
    ExitApp
Return
