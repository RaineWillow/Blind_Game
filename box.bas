'It's a box
type Box
   private:
      dim BoxX as integer
      dim BoxY as integer
      dim BoxWidth as integer
      dim BoxHeight as integer
   public:
      declare function GetBoxX() as integer
      declare function GetBoxY() as integer
      declare function GetBoxWidth() as integer
      declare function GetBoxHeight() as integer
      declare function GetBoxX2() as integer
      declare function GetBoxY2() as integer
      
      declare sub SetBoxX(byval NBoxX as integer)
      declare sub SetBoxY(byval NBoxY as integer)
      declare sub SetBoxWidth(byval NBoxW as integer)
      declare sub SetBoxHeight(byval NBoxH as integer)
      
      declare sub Init(byval NBoxX as integer, byval NBoxY as integer, NBoxW as integer, NBoxH as integer)
end type

function Box.GetBoxX() as integer
   return this.BoxX
end function

function Box.GetBoxY() as integer
   return this.BoxY
end function

function Box.GetBoxWidth() as integer
   return this.BoxWidth
end function

function Box.GetBoxHeight() as integer
   return this.BoxHeight
end function

function Box.GetBoxX2() as integer
   return this.BoxX + this.BoxWidth
end function

function Box.GetBoxY2() as integer
   return this.BoxY + this.BoxHeight
end function

sub Box.SetBoxX(byval NBoxX as integer)
   this.BoxX = NBoxX
end sub

sub Box.SetBoxY(byval NBoxY as integer)
   this.BoxY = NBoxY
end sub

sub Box.SetBoxWidth(byval NBoxW as integer)
   this.BoxWidth = NBoxW
end sub

sub Box.SetBoxHeight(byval NBoxH as integer)
   this.BoxHeight = NBoxH
end sub

sub Box.Init(byval NBoxX as integer, byval NBoxY as integer, NBoxW as integer, NBoxH as integer)
   this.BoxX = NBoxX
   this.BoxY = NBoxY
   this.BoxWidth = NBoxW
   this.BoxHeight = NBoxH
end sub


declare function GetBoxIntersect(byval Box1 as Box, byval Box2 as Box) as integer
declare function GetBoxInPoint(byval Box1 as Box, byval Px as integer, byval Py as integer) as integer

function GetBoxIntersect(byval Box1 as Box, byval Box2 as Box) as integer
   if Box1.GetBoxX() < Box2.GetBoxX2() and Box1.GetBoxX2 > Box2.GetBoxX and Box1.GetBoxY() < Box2.GetBoxY2() and Box1.GetBoxY2() > Box2.GetBoxY() then
      return 1
   else
      return 0
   end if
end function

function GetBoxInPoint(byval Box1 as Box, byval Px as integer, byval Py as integer) as integer
   if Box1.GetBoxX < Px and Box1.GetBoxX2 > Px and Box1.GetBoxY < Py and Box1.GetBoxY2 > Py then
      return 1
   else
      return 0
   end if
end function


