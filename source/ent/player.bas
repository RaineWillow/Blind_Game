'Player class

type Player
    private:
        dim PlayerSpeed as integer = 300
    public:
        dim BoundingBox as Box
        
        declare sub Init(byval PlayerX as integer, byval PlayerY as integer)
        declare sub Update()
        declare sub Render(byval Viewer as Camera)
        declare sub SetTile(byval TileX as integer, byval TileY as integer)
end type

sub Player.Init(byval PlayerX as integer, byval PlayerY as integer)
    this.BoundingBox.Init(PlayerX, PlayerY, 32, 32)
end sub

sub Player.Update()
    if multikey(SC_UP) then
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() - MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
    if multikey(SC_DOWN) then
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() + MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
    if multikey(SC_RIGHT) then
        this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() + MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
    if multikey(SC_LEFT) then
        this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() - MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
end sub

sub Player.Render(byval Viewer as Camera)
    line (this.BoundingBox.GetBoxX() + Viewer.GetCameraX(), this.BoundingBox.GetBoxY() + Viewer.GetCameraY())-(this.BoundingBox.GetBoxX2() + Viewer.GetCameraX(), this.BoundingBox.GetBoxY2() + Viewer.GetCameraY()), rgb(255, 255, 255), B
    line (this.BoundingBox.GetBoxX() + Viewer.GetCameraX(), this.BoundingBox.GetBoxY() + Viewer.GetCameraY())-(this.BoundingBox.GetBoxX2() + Viewer.GetCameraX(), this.BoundingBox.GetBoxY2() + Viewer.GetCameraY()), rgb(255, 255, 255), B
end sub

sub Player.SetTile(byval TileX as integer, byval TileY as integer)
    this.BoundingBox.SetBoxX(TileX*32)
    this.BoundingBox.SetBoxY(TileY*32)
end sub
