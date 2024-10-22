Dim folderName1
folderName1 = ""

Dim fso1
Set fso = CreateObject("Scripting.FileSystemObject") 
'wscript.Echo fso.GetParentFolderName(wscript.ScriptFullName) 
mydir = fso.GetParentFolderName(wscript.ScriptFullName)
Set OutPutFile = fso.OpenTextFile(mydir & "\test.txt" ,8 , True)
sname = "test.txt"
If fso.FileExists(sname) Then
  'Set spoFile = fso.OpenTextFile(sname, 2, True)
  Set OutPutFile = fso.OpenTextFile(mydir & "\test.txt" ,8 , True)
  OutPutFile.WriteLine(mydir)
Else
  'Set spoFile = fso.CreateTextFile(sname, True)
  Set OutPutFile = fso.OpenTextFile(mydir & "\test.txt" ,8 , True)
  OutPutFile.WriteLine(mydir)
End If

OutPutFile.WriteLine(mydir)
Set objFolderItem = Nothing
Set objFolder = Nothing
Set objApplication = Nothing
Set fso = Nothing
OutPutFile.Close

'Dim fullpath
'fullpath = fso1.GetAbsolutePathName(folderName1)

'response.write("folder spec: " & folderName1)
'response.write( "fullpath:    " & fullpath)
'response.write(Server.MapPath("."))
'parentFolder = Request.ServerVariables("APPL_PHYSICAL_PATH")