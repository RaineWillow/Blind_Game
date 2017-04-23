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
        
        declare function GetTileX() as integer
        declare function GetTileY() as integer
end type

sub Player.Init(byval PlayerX as integer, byval PlayerY as integer)
    this.BoundingBox.Init(PlayerX, PlayerY, 32, 32)
end sub

sub Player.Update()
    if multikey(SC_W) then
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() - MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
    if multikey(SC_S) then
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() + MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
    if multikey(SC_D) then
        this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() + MOVEMENT_AMOUNT*PlayerSpeed)
    end if
    
    if multikey(SC_A) then
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

function Player.GetTileX() as integer
    return ((this.BoundingBox.GetBoxX) / 32)
end function

function Player.GetTileY() as integer
    return ((this.BoundingBox.GetBoxY) / 32)
end function
