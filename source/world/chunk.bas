#include "tile.bas"
'Chunk class

type Chunk
    private:
        dim ChunkID as integer
        dim ChunkX as integer
        dim ChunkY as integer
        dim TileList(0 to 63, 0 to 63) as Tile
    public:
        declare sub Init(byval ChunkX as integer, byval ChunkY as integer)
        declare sub Update()
        declare sub Render(byval Viewer as Camera)
        
        declare function GetTileX(byval TileX as integer) as integer
        declare function GetTileY(byval TileY as integer) as integer
        declare function GetTile(byval TileX as integer, byval TileY as integer) as Tile
end type

sub Chunk.Init(byval ChunkX as integer, byval ChunkY as integer)
    dim newtile as string
    dim FileData() as string
    open "saves/Chk1.chunk" for input as #1
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            this.TileList(x, y).BoundingBox.Init(ChunkX + (32*x), ChunkY + (32*y), 32, 32)
            input #1, newtile
            split(newtile, , , FileData())
            this.TileList(x, y).SetTileID(val(FileData(0)))
            this.TileList(x, y).SetExit(val(FileData(1)))
        next
    next
    close #1
end sub

sub Chunk.Update() 'updates the chunk
    
end sub

sub Chunk.Render(byval Viewer as Camera) 'Renders the chunk
    dim StartX1 as integer = (ChunkX + Viewer.GetCameraX())/32 + 1
    dim StartY1 as integer = (ChunkY + Viewer.GetCameraY())/32 + 1
    dim StartX2 as integer = abs((ChunkX + Viewer.GetCameraX()-800)/32)
    dim StartY2 as integer = abs((ChunkY + Viewer.GetCameraY()-600)/32)
    if StartX1 >= 0 then
        StartX1 = 0
    end if
    if StartY1 >= 0 then
        StartY1 = 0
    end if
    if StartX2 >= 63 then
        StartX2 = 63
    end if
    if StartY2 >= 63 then
        StartY2 = 63
    end if
    StartX1 = abs(StartX1)
    StartY1 = abs(StartY1)
    for x as integer = StartX1 to StartX2
        for y as integer = StartY1 to StartY2
            put (ChunkX + (32*x) + Viewer.GetCameraX(), ChunkY + (32*y) + Viewer.GetCameraY()), ImageList(this.TileList(x, y).GetTileID()), trans
            dim TestTile as Tile
            TestTile.BoundingBox.Init(ChunkX + (32*x) + Viewer.GetCameraX(), ChunkY + (32*y) + Viewer.GetCameraY(), 32, 32)
            if GetBoxInPoint(TestTile.BoundingBox, Mouse.GetMouseX(), Mouse.GetMouseY()) then
                put (ChunkX + (32*x) + Viewer.GetCameraX(), ChunkY + (32*y) + Viewer.GetCameraY()), ImageList(2), trans
                Mouse.TileX = x
                Mouse.TileY = y
            end if
        next
    next
end sub

function Chunk.GetTileX(byval TileX as integer) as integer
    return TileX * 32
end function

function Chunk.GetTileY(byval TileY as integer) as integer
    return TileY * 32
end function

function Chunk.GetTile(byval TileX as integer, byval TileY as integer) as Tile
    return TileList(TileX, TileY)
end function
