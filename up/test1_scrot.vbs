Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "cmd", 9
WScript.Sleep 2000
WshShell.sendkeys "%{F4}"
'WshShell.SendKeys "c:\program files\winzip\wzzip.exe"
'firefox = "C:\Program Files\Mozilla Firefox\firefox.exe"
'WshShell.SendKeys "myname"

'WshShell.SendKeys "cd" & " " & "C:\"&"Program Files"&"\"&"Mozilla Firefox"&"\"
'WScript.Sleep 2000
'WshShell.SendKeys "{ENTER}"

'WshShell.SendKeys "firefox.exe testing.com"
'WScript.Sleep 2000
'WshShell.SendKeys "{ENTER}"

'Wscript.Sleep 1000
wshShell.AppActivate "Chrome" 'here put the name of the window
'Wscript.Sleep 1000

'WScript.Sleep 2000
'msgbox "about to prnt screen"
'WshShell.SendKeys "%{PRTSC}"
'WScript.Sleep 2000
'WshShell.Run "outlook.exe", 9

WScript.Sleep 1000
'WshShell.SendKeys "^+M"
WshShell.SendKeys "^+i"
WScript.Sleep 1000
'WshShell.SendKeys "^+M"
WshShell.SendKeys "^+K"
WScript.Sleep 1000
WshShell.SendKeys ":screenshot 'C:\Users\User\Downloads\testfolder6\test' --fullpage"
WScript.Sleep 1000
WshShell.SendKeys "{ENTER}"
'WScript.Sleep 2000
'WshShell.SendKeys "{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}"
'WScript.Sleep 2000
'WshShell.SendKeys "^V"
'WScript.Sleep 2000
'WshShell.SendKeys "%S"
WScript.Sleep 2000
'Msgbox "Audit completed - please close any left over windows."