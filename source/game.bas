'Game Class

type Engine
   private:
      dim State as integer
   public:
      declare sub Update()
      declare sub Render()
end type


sub Engine.Update()
   this.state = 2
end sub

sub Engine.Render()
   print "hi"
end sub
