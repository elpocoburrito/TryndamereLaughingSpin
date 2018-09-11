#InstallKeybdHook
#UseHook
#SingleInstance, Force
#NoEnv
Menu, Tray, NoIcon
SavedDataFile := "TryndLaugh.dat"

IfExist, %SavedDataFile%
    FileReadLine, pixCol, %SavedDataFile%, 1
return

#IfWinActive ahk_exe League of Legends.exe
numpad0::
    PixelGetColor, pixCol, 917, 1013
    FileDelete, %SavedDataFile%
    FileAppend, %pixCol%, %SavedDataFile%
    msgbox, Your Tryndamere Macro is now ready! If it does not work, make sure you are in borderless
return

~e::
    PixelGetColor, currentCol, 917, 1013
    if ErrorLevel != 0
        Return
    else if (currentCol == pixCol)
    {
        sleep 40
        send ^{4 down}
        sleep 10
        send ^{4 up}
    }
return

#IfWinActive
#enter::
    hidStatus = %A_IconHidden%
    if (hidStatus = 0)
        Menu, Tray, NoIcon
    else if (hidStatus = 1)
        Menu, Tray, Icon
return
