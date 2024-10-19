Set WshShell = WScript.CreateObject("WScript.Shell")
'WshShell.Run "git", 9
'WScript.Sleep 1000
'WshShell.sendkeys "%{F4}"
WScript.Sleep 500
'wshShell.AppActivate "Git" 'here put the name of the window
'WshShell.AppActivate "MINGW64:/c/Users/User/Downloads/testfolder12/Web-Accounts"  
WshShell.AppActivate "/usr/bin/bash --login -i C:\Users\User\Downloads\testfolder12\start_menu.sh" 
'WshShell.AppActivate "testfolder12"  
WScript.Sleep 1000
WshShell.SendKeys "{PRTSC}"
WScript.Sleep 1000 
WshShell.Run "snippingtool" 
' Send Alt + M to set the mode (Rectangular Snip, Free-form Snip, Window Snip, Full-screen Snip)  
WScript.Sleep 1000
WshShell.SendKeys "%(m)+(w)" ' Alt + M to select the mode  
WScript.Sleep 500
WshShell.SendKeys "{ENTER}"
WScript.Sleep 500
WshShell.SendKeys "{ENTER}"
WScript.Sleep 500
WshShell.SendKeys "^s"
WScript.Sleep 1000
WshShell.SendKeys "C:\Users\User\Downloads\testfolder12\screenshot\test2.png"
WScript.Sleep 500
WshShell.SendKeys "{ENTER}"
WScript.Sleep 1000
' Close Snipping Tool (optional)  
WshShell.SendKeys "%{F4}" ' Alt + F4 to close the Snipping Tool window 
WScript.Sleep 100
'Msgbox "Audit completed - please close any left over windows."