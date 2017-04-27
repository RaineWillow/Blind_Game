declare sub Split(Text As String, Delim As String = " ", Count As Long = -1, Ret() As String)

sub Split(Text As String, Delim As String = " ", Count As Long = -1, Ret() As String)

   Dim As Long x, p
   If Count < 1 Then
      Do 
         x = InStr(x + 1, Text, Delim)
         p += 1
      Loop Until x = 0
      Count = p - 1
   ElseIf Count = 1 Then
      ReDim Ret(Count)
      Ret(0) = Text
   Else
      Count -= 1
   End If
   Dim RetVal(Count) As Long
   x = 0
   p = 0
   Do Until p = Count
      x = InStr(x + 1,Text,Delim)
      RetVal(p) = x
      p += 1
   Loop
   ReDim Ret(Count)
   Ret(0) = Left(Text, RetVal(0) - 1 )
   p = 1
   Do Until p = Count
      Ret(p) = Mid(Text, RetVal(p - 1) + 1, RetVal(p) - RetVal(p - 1) )
      p += 1
   Loop
   Ret(Count) = Mid(Text, RetVal(Count - 1) + 1)
   
End Sub
