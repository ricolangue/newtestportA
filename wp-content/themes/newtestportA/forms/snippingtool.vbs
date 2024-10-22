Option Explicit  

' Create a WScript.Shell object  
Dim WshShell  
Set WshShell = CreateObject("WScript.Shell")  
WshShell.Run "snippingtool" 
' Activate the desired application (replace "YourApplication" with the actual title of the window)  
WshShell.AppActivate "/usr/bin/bash --login -i C:\Users\User\Downloads\testfolder12\start_menu.sh"  

' Give the user time to make the selection  
WScript.Sleep 500 ' Wait for 2 seconds for the user to snip  

' Run the Snipping Tool  
WshShell.Run "snippingtool" 
WScript.Sleep 2000 ' Wait for 2 seconds for the user to snip   
'WScript.Sleep 1000 ' Wait for 1 second to ensure Snipping Tool is open  

' Send Alt + M to set the mode (Rectangular Snip, Free-form Snip, Window Snip, Full-screen Snip)  
'WshShell.SendKeys "%(m)+(s)" ' Alt + M to select the mode  

' You can also send the Enter key to start snipping  
'WshShell.SendKeys "{ENTER}"  

' Give the user time to make the selection  
WScript.Sleep 2000 ' Wait for 2 seconds for the user to snip  

' Close Snipping Tool (optional)  
'WshShell.SendKeys "%{F4}" ' Alt + F4 to close the Snipping Tool window  

' Clean up  
Set WshShell = Nothing