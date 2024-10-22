Set WshShell = WScript.CreateObject("WScript.Shell")
'WshShell.Run "git", 9
'WScript.Sleep 1000
'WshShell.sendkeys "%{F4}"
WScript.Sleep 500
'wshShell.AppActivate "Git" 'here put the name of the window
WshShell.AppActivate "/usr/bin/bash --login -i C:\Users\User\Downloads\testfolder12\start_menu.sh"  
WScript.Sleep 1000
WshShell.SendKeys "{PRTSC}"
WScript.Sleep 1000 
WshShell.Run "snippingtool" 
' Send Alt + M to set the mode (Rectangular Snip, Free-form Snip, Window Snip, Full-screen Snip)  
'WshShell.SendKeys "%(m)+(s)" ' Alt + M to select the mode  
'Set WshShell = CreateObject("WScript.Shell")  
'WshShell.SendKeys "{PRTSC}" ' This sends the Print Screen command (may not work in all cases)
'Set WshShell = CreateObject("WScript.Shell")  
'WshShell.SendKeys "^{ESC}"  ' Simulates pressing Ctrl + Esc
'WshShell.SendKeys "^{ESC}" ' This step is optional, it just ensures that no application is focused.  
'Delay Default to screenshot Enter key: 1000
'WScript.Sleep 1000
'WshShell.SendKeys "{ENTER}"
'Delay to capture screenshot: 2000
'WScript.Sleep 2000
'WshShell.SendKeys "{ENTER}"
'WScript.Sleep 500
'WshShell.sendkeys "^w"
WScript.Sleep 5000
WshShell.SendKeys "%(m)+(s)" ' Alt + M to select the mode  
WScript.Sleep 5000
WshShell.sendkeys "^%{TAB}"
wscript.sleep 500
WshShell.sendkeys "{TAB}"
wscript.sleep 1000
WshShell.SendKeys "{ENTER}"
WScript.Sleep 100
'Msgbox "Audit completed - please close any left over windows."