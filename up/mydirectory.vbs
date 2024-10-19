Dim folderName1
folderName1 = ""

Dim fso1
' Create The Object
Set FSO = CreateObject("Scripting.FileSystemObject")
'Set fso = CreateObject("Scripting.FileSystemObject") 
'wscript.Echo fso.GetParentFolderName(wscript.ScriptFullName) 
mydir = fso.GetParentFolderName(wscript.ScriptFullName)
'Set OutPutFile = fso.OpenTextFile(mydir & "\test.txt" ,8 , True)

' How To Write To A File
Set OutPutFile = FSO.CreateTextFile(mydir & "\mydirectory.txt",True)
'File.Write "Example String2"
OutPutFile.WriteLine(mydir)
OutPutFile.Close