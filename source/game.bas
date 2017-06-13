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
    this.World.Init()
end sub

sub Engine.Update()
    this.World.Update()
end sub

sub Engine.Render()
    this.World.Render()
end sub
