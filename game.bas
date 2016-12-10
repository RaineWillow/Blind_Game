'Game Class

type Engine
   private:
      dim State as integer
   public:
      declare sub Update()
      declare sub Render()
end type


sub Engine.update()
   this.state = 2
end sub

sub Engine.render()
   print this.state
end sub
