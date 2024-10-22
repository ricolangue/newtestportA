' Create The Object
Set FSO = CreateObject("Scripting.FileSystemObject")

' How To Write To A File
Set File = FSO.CreateTextFile("C:\Users\User\Downloads\testfolder8\bar.txt",True)
File.Write "Example String2"
File.Close

