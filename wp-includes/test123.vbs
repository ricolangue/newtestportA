Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "cmd", 9
WScript.Sleep 1000
WshShell.sendkeys "%{F4}"
WScript.Sleep 1000
wshShell.AppActivate "Firefox" 'here put the name of the window
WScript.Sleep 1000
WshShell.SendKeys "^+i"
WScript.Sleep 1000
WshShell.SendKeys "^+K"
WScript.Sleep 1000
WshShell.SendKeys "_screenshot"
WScript.Sleep 1000
WshShell.SendKeys "{ENTER}"
WScript.Sleep 2000
'Msgbox "Audit completed - please close any left over windows."