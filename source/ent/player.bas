'Player class

type Player
    private:
        dim PlayerSpeed as integer = 200
        
        dim IsColliding as integer
    public:
    
        dim PlayerText as string = ""
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
    this.BoundingBox.Init(PlayerX, PlayerY, 24, 24)
end sub

function Player.WillCollide(byref CurrChunk as Chunk, byval TestBox as Box) as Tile
    dim CurrTile as Tile
    for x as integer = (this.GetTileX() - 1) to (this.GetTileX + 1)
        for y as integer = (this.GetTileY() - 1) to (this.GetTileY + 1)
            CurrTile = CurrChunk.GetTile(x, y)
            if CurrTile.GetSolid() = 1 then 'This may be changed later
                if GetBoxIntersect(TestBox, CurrTile.BoundingBox) then
                    return CurrTile
                end if
            end if
        next
    next
    dim EndTile as Tile
    EndTile.SetSolid(-1)
    return EndTile
end function

sub Player.Update(byref CurrChunk as Chunk)
    dim TestBox as Box
    dim TestTile as Tile
    dim upDown as Integer
    dim leftRight as Integer
    dim moveX as double
    dim moveY as double

    leftRight = multikey(LEFT_KEY) + -1*multikey(RIGHT_KEY)
    upDown = multikey(UP_KEY) + -1*multikey(DOWN_KEY)
    moveX = leftRight*MOVEMENT_AMOUNT*this.PlayerSpeed
    moveY = upDown*MOVEMENT_AMOUNT*this.PlayerSpeed

    ' Check X-axis collision
    TestBox = this.BoundingBox
    TestBox.SetBoxX(this.BoundingBox.GetBoxX() + moveX)
    TestTile = this.WillCollide(CurrChunk, TestBox)

    if TestTile.GetSolid() = 1 then
        if leftRight < 0 then
            this.BoundingBox.SetBoxX(TestTile.BoundingBox.GetBoxX2)
        else
            this.BoundingBox.SetBoxX(TestTile.BoundingBox.GetBoxX-this.BoundingBox.GetBoxWidth())
        end if
    else 
        this.BoundingBox.SetBoxX(this.BoundingBox.GetBoxX + moveX)
    end if

    ' Check Y-axis collision
    TestBox = this.BoundingBox
    TestBox.SetBoxY(this.BoundingBox.GetBoxY() + moveY)
    TestTile = this.WillCollide(CurrChunk, TestBox)

    if TestTile.GetSolid() = 1 then
        if upDown < 0 then
            this.BoundingBox.SetBoxY(TestTile.BoundingBox.GetBoxY2)
        else
            this.BoundingBox.SetBoxY(TestTile.BoundingBox.GetBoxY-this.BoundingBox.GetBoxHeight())
        end if
    else
        this.BoundingBox.SetBoxY(this.BoundingBox.GetBoxY + moveY)
    end if
    
    this.PlayerText = str(moveX)
    
end sub

sub Player.Render(byval Viewer as Camera)
    line (this.BoundingBox.GetBoxX() + Viewer.GetCameraX(), this.BoundingBox.GetBoxY() + Viewer.GetCameraY())-(this.BoundingBox.GetBoxX2() + Viewer.GetCameraX(), this.BoundingBox.GetBoxY2() + Viewer.GetCameraY()), rgb(100, 150, 225), B
    draw string (this.BoundingBox.GetBoxX2 - (len(this.PlayerText)*8)/2 + Viewer.GetCameraX(), this.BoundingBox.GetBoxY2 + 6 + Viewer.GetCameraY()), this.PlayerText 
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
