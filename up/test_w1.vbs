' Create The Object
Set FSO = CreateObject("Scripting.FileSystemObject")

' How To Write To A File
Set File = FSO.CreateTextFile("C:\Users\User\Downloads\testfolder8\bar.txt",True)
File.Write "Example String"
File.Close

' How To Read From A File
Set File = FSO.OpenTextFile("C:\Users\User\Downloads\testfolder8\bar.txt")
Do Until File.AtEndOfStream
    Line = File.ReadLine
    WScript.Echo(Line)
Loop
File.Close

' Another Method For Reading From A File
Set File = FSO.OpenTextFile("C:\Users\User\Downloads\testfolder8\bar.txt")
Set Text = File.ReadAll
WScript.Echo(Text)
File.Close