Set WshShell = WScript.CreateObject("WScript.Shell")
wshShell.Run("https://www.google.com/")
'WshShell.Run "cmd", 9
'WScript.Sleep 500
'WshShell.sendkeys "%{F4}"
WScript.Sleep 500
wshShell.AppActivate "Firefox" 'here put the name of the window
WScript.Sleep 2000
'WshShell.SendKeys "^+i"
'WScript.Sleep 500
'WshShell.sendkeys "{ESC}"
'WScript.Sleep 2000
'WshShell.SendKeys "^+P"
'WScript.Sleep 2000
'WshShell.SendKeys "Capture full size screenshot"
'WScript.Sleep 2000
'WshShell.SendKeys "{ENTER}"
'WScript.Sleep 2000
'WshShell.SendKeys "{ENTER}"
'WScript.Sleep 5000
'WshShell.sendkeys "%{F4}"
'WScript.Sleep 1000
WshShell.sendkeys "%{TAB}"
WScript.Sleep 2000
'Msgbox "Audit completed - please close any left over windows."