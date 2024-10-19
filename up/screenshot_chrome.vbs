Set WshShell = WScript.CreateObject("WScript.Shell")
'WshShell.Run "cmd", 9
'WScript.Sleep 1000
'WshShell.sendkeys "%{F4}"
WScript.Sleep 500
wshShell.AppActivate "Chrome" 'here put the name of the window
WScript.Sleep 1000
WshShell.SendKeys "^+i"
WScript.Sleep 1000
WshShell.sendkeys "{ESC}"
WScript.Sleep 500
WshShell.SendKeys "^+P"
'Delay Default to run screenshot: 2000
WScript.Sleep 2000
WshShell.SendKeys "Capture full size screenshot"
'Delay Default to screenshot Enter key: 1000
WScript.Sleep 1000
WshShell.SendKeys "{ENTER}"
'Delay to capture screenshot: 2000
WScript.Sleep 2000
WshShell.SendKeys "{ENTER}"
'WScript.Sleep 500
'WshShell.sendkeys "^w"
WScript.Sleep 1000
WshShell.sendkeys "^%{TAB}"
wscript.sleep 500
WshShell.sendkeys "{TAB}"
wscript.sleep 1000
WshShell.SendKeys "{ENTER}"
WScript.Sleep 100
'Msgbox "Audit completed - please close any left over windows."