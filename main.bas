'Main file
#include "fbgfx.bi"
using FB
#include "box.bas"
#include "game.bas"

type App
   private:
      dim Fps as integer
      dim Max_Fps as integer = 60
      dim Game as Engine
   public:
      declare Function FrameCounter() As Integer
      declare Function Regulate(ByVal MyFps As Integer,ByRef fps As Integer) As Integer
      declare sub Main()
end type



screenres 800, 600, 32

'===============================================================================
Function App.FrameCounter() As Integer
    Var t1=Timer,t2=t1
    Static As Double t3,frames,answer
    frames+=1
    If (t2-t3) >= 1 Then t3 = t2 : answer = frames : frames = 0
    Function= answer
End Function
'==============================================================================
Function App.Regulate(ByVal MyFps As Integer,ByRef fps As Integer) As Integer
    fps=FrameCounter()
    Static As Double timervalue,lastsleeptime
    Dim As Double delta
    Var k=fps-myfps,i=1/myfps
    If Abs(k)>1 Then delta+=i*Sgn(k)
    Var sleeptime=lastsleeptime+(i-Timer+timervalue)*2000+delta
    If sleeptime<1 Then sleeptime=1
    lastsleeptime=sleeptime
    timervalue=Timer
    Return sleeptime
End Function
'===============================================================================

sub App.Main()
   do 'The main rendering loop
      screenlock 'locks the screen so you can
      cls
      print "FPS:"; this.fps
      this.Game.Render() 'Renders the game onto the screen
      screenunlock
      sleep this.Regulate(this.Max_FPS, this.fps)
      this.Game.Update() 'Updates the engine
   loop until inkey = chr(255) + "k" or multikey(SC_ESCAPE)
end sub

dim Self as App
Self.Main()
