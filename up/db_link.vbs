Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "cmd", 9
WScript.Sleep 500
WshShell.sendkeys "%{F4}"
wshShell.Run("Firefox db_link")
WScript.Sleep 5000
wshShell.AppActivate "Firefox"
WScript.Sleep 1000
WshShell.SendKeys "+{TAB}"
WScript.Sleep 500
WshShell.SendKeys "^{BACKSPACE}"
WScript.Sleep 500
'Db username
WshShell.SendKeys "db_username"
WScript.Sleep 500
WshShell.SendKeys "{TAB}"
WScript.Sleep 1000
'DB password
WshShell.SendKeys "db_password"
WScript.Sleep 2000
WshShell.SendKeys "{ENTER}"
WScript.Sleep 2000
'Msgbox "Audit completed - please close any left over windows."