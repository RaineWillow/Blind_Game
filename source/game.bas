'Game Class
#include "world/world.bas"

type Engine
   private:
      dim State as integer
      dim World as ZaWarudo
   public:
      declare sub Init()
      declare sub Update()
      declare sub Render()
end type

sub Engine.Init()
    World.Init()
end sub

sub Engine.Update()
    World.Update()
end sub

sub Engine.Render()
    World.Render()
end sub
