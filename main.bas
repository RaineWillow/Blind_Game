'Main file
#include "fbgfx.bi"
using FB
#include "vbcompat.bi"

dim ImgPth as string = "res/img/tiles/"

screenres 800, 600, 32

dim shared FPS_TEST as integer

dim shared ImageList(0 to 4) as any ptr
for x as integer = 0 to 3
    ImageList(x) = imagecreate(32, 32)
next

ImageList(4) = imagecreate(64, 90)

line ImageList(0), (0, 0)-(32, 32), rgb(20, 20, 20), bf                         'Solid floor
line ImageList(0), (0, 0)-(32, 32), rgb(40, 40, 40), b                          'Solid floor outline
line ImageList(1), (0, 0)-(32, 32), rgb(255, 255, 255), bf                      'Solid tile
line ImageList(2), (0, 0)-(31, 31), rgb(160, 100, 100), b                       'Mouse
line ImageList(3), (4, 4)-(28, 28), rgb(100, 100, 180), bf                      'exit square
line ImageList(4), (0, 0)-(64, 90), rgb(200, 200, 200), bf


dim shared MOVEMENT_AMOUNT as double

dim shared UP_KEY as integer
dim shared DOWN_KEY as integer
dim shared LEFT_KEY as integer
dim shared RIGHT_KEY as integer
dim shared INTERACT_KEY as integer

open "key_layout.dat" for input as #2
input #2, UP_KEY
input #2, DOWN_KEY
input #2, LEFT_KEY
input #2, RIGHT_KEY
input #2, INTERACT_KEY
close #2

#include "source/utils/split.bas"
#include "source/utils/mouse.bas"
#include "source/box.bas"
#include "source/game.bas"

type App
   private:
      dim Fps as integer
      dim Max_Fps as integer = 200
      dim Game as Engine
   public:
      declare Function FrameCounter() As Integer
      declare Function Regulate(ByVal MyFps As Integer,ByRef fps As Integer) As Integer
      declare sub Main()
end type

'=============================================================================== Dodicat
Function App.FrameCounter() As Integer
    Var t1=Timer,t2=t1
    Static As Double t3,frames,answer
    frames+=1
    If (t2-t3) >= 1 Then t3 = t2 : answer = frames : frames = 0
    Function= answer
End Function
'==============================================================================
Function App.Regulate(ByVal MyFps As Integer, ByRef fps As Integer) As Integer
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
   this.Game.Init()
   dim TheTime as integer
   dim TheLastTime as integer
   dim TrueFPS as integer
   TheTime = timer
   TheLastTime = TheTime
   do 'The main rendering loop
      TheTime = timer
      screenlock 'locks the screen so you can put stuff on it
      cls 'clears the screen
      this.Game.Render() 'Renders the game onto the screen
      print "FPS:"; this.fps; " Test FPS: "; TrueFPS
      screenunlock 'Unlocks the screen
      sleep this.Regulate(this.Max_FPS, this.fps) 'sleeps for a specified amount of time
      
      Mouse.Update()
      
      
      'Test FPS
      FPS_TEST = FPS_TEST + 1
      if TheTime > TheLastTime then
          TrueFPS = FPS_TEST
          FPS_TEST = 0
          TheLastTime = TheTime
      end if
      
      if FPS > 0 then 'Sets the global movement speed
          MOVEMENT_AMOUNT = 1/FPS
      end if
      this.Game.Update() 'Updates the engine
   loop until inkey = chr(255) + "k" or multikey(SC_ESCAPE) 'loops until the escape key is hit or the close button is hit
   
end sub

dim Self as App
Self.Main()
