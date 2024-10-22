set wshShell = WScript.CreateObject("wscript.shell")
wshShell.Run("http://localhost/phpmyadmin/db_export.php?db=zoomtruckingll")
Wscript.Sleep 1000
wshShell.AppActivate "Firefox" 'here put the name of the window
Wscript.Sleep 1000
'wshell.senkeys "{F5}"