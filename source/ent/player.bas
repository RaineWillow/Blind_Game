'Player class

type Player
    private:
        dim PlayerSpeed as integer = 300
    public:
        
        dim BoundingBox as Box
        
        declare sub Init(byval PlayerX as integer, byval PlayerY as integer)
        declare sub Update()
        declare sub Render()
end type

sub Player.Init(byval PlayerX as integer, byval PlayerY as integer)
    this.BoundingBox.Init(PlayerX, PlayerY, 32, 32)
end sub

sub Player.Update()
    if multikey(SC_UP) then
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() - MovementAmount*PlayerSpeed)
    end if
    
    if multikey(SC_DOWN) then
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() + MovementAmount*PlayerSpeed)
    end if
    
    if multikey(SC_RIGHT) then
        this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() + MovementAmount*PlayerSpeed)
    end if
    
    if multikey(SC_LEFT) then
        this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() - MovementAmount*PlayerSpeed)
    end if
    
end sub

sub Player.Render()
    line (this.BoundingBox.GetBoxX(), this.BoundingBox.GetBoxY())-(this.BoundingBox.GetBoxX2(), this.BoundingBox.GetBoxY2()), rgb(255, 255, 255), B
    print MovementAmount
end sub

