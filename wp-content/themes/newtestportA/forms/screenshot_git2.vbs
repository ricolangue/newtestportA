Set WshShell = CreateObject("WScript.Shell")  

' Activate the desired application (replace "YourApplication" with the actual title of the window)  
WshShell.AppActivate "/usr/bin/bash --login -i C:\Users\User\Downloads\testfolder12\start_menu.sh"  

' Give the user time to make the selection  
WScript.Sleep 2000 ' Wait for 2 seconds for the user to snip  


' Note: You will still need to manually paste (Ctrl + V) and save it from Paint.