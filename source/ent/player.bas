'Player class

type Player
    private:
        dim PlayerSpeed as integer = 300
        
        dim IsColliding as integer
    public:
        dim BoundingBox as Box
        
        declare function WillCollide(byref CurrChunk as Chunk, byval TestBox as Box) as Tile
        
        declare sub Init(byval PlayerX as integer, byval PlayerY as integer)
        declare sub Update(byref CurrChunk as Chunk)
        declare sub Render(byval Viewer as Camera)
        declare sub SetTile(byval TileX as integer, byval TileY as integer)
        
        declare function GetTileX() as integer
        declare function GetTileY() as integer
end type

sub Player.Init(byval PlayerX as integer, byval PlayerY as integer)
    this.BoundingBox.Init(PlayerX, PlayerY, 32, 32)
end sub

function Player.WillCollide(byref CurrChunk as Chunk, byval TestBox as Box) as Tile
    for x as integer = (this.GetTileX() - 1) to (this.GetTileX + 1)
        for y as integer = (this.GetTileY() - 1) to (this.GetTileY + 1)
            dim CurrTile as Tile
            CurrTile = CurrChunk.GetTile(x, y)
            if CurrTile.GetTileID() = 1 then 'This may be changed later
                if GetBoxIntersect(TestBox, CurrTile.BoundingBox) then
                    return CurrTile
                end if
            end if
        next
    next
    dim EndTile as Tile
    EndTile.SetTileID(-1)
    return EndTile
end function

sub Player.Update(byref CurrChunk as Chunk)
    dim TestBox as Box
    dim TestTile as Tile
    TestBox = this.BoundingBox
    
    if multikey(SC_W) then
        TestBox.SetBoxY(this.BoundingBox.GetBoxY() - MOVEMENT_AMOUNT*PlayerSpeed)
        TestTile = this.WillCollide(CurrChunk, TestBox)
        if TestTile.GetTileID() = 1 then
            this.BoundingBox.SetBoxY(TestTile.BoundingBox.GetBoxY2)
        else
            this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() - MOVEMENT_AMOUNT*PlayerSpeed)
        end if
    end if
    
    TestBox = this.BoundingBox
    
    if multikey(SC_S) then
        TestBox.SetBoxY(this.BoundingBox.GetBoxY() + MOVEMENT_AMOUNT*PlayerSpeed)
        TestTile = this.WillCollide(CurrChunk, TestBox)
        if TestTile.GetTileID() = 1 then
            this.BoundingBox.SetBoxY(TestTile.BoundingBox.GetBoxY-this.BoundingBox.GetBoxHeight())
        else
            this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY() + MOVEMENT_AMOUNT*PlayerSpeed)
        end if
    end if
    
    TestBox = this.BoundingBox
    
    if multikey(SC_D) then
        TestBox.SetBoxX(this.BoundingBox.GetBoxX() + MOVEMENT_AMOUNT*PlayerSpeed)
        TestTile = this.WillCollide(CurrChunk, TestBox)
        if TestTile.GetTileID() = 1 then
            this.BoundingBox.SetBoxX(TestTile.BoundingBox.GetBoxX-this.BoundingBox.GetBoxWidth())
        else
            this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() + MOVEMENT_AMOUNT*PlayerSpeed)
        end if
    end if
    
    TestBox = this.BoundingBox
    
    if multikey(SC_A) then
        TestBox.SetBoxX(this.BoundingBox.GetBoxX() - MOVEMENT_AMOUNT*PlayerSpeed)
        TestTile = this.WillCollide(CurrChunk, TestBox)
        if TestTile.GetTileID() = 1 then
            this.BoundingBox.SetBoxX(TestTile.BoundingBox.GetBoxX2)
        else
            this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX() - MOVEMENT_AMOUNT*PlayerSpeed)
        end if
    end if
    
    'dim TestTile as Tile
    'TestTile = this.WillCollide(CurrChunk)
    'if TestTile.GetTileID() = 1 then
    '    this.IsColliding = 1
    'elseif TestTile.GetTileID() = -1 then
    '    this.IsColliding = 0
    'end if
    
end sub

sub Player.Render(byval Viewer as Camera)
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
