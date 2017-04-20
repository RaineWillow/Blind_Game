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
end type

sub Chunk.Init(byval ChunkX as integer, byval ChunkY as integer)
    open "Chk1.chunk" for input as #1
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            dim newtile as integer
            this.TileList(x, y).BoundingBox.Init(ChunkX + (32*x), ChunkY + (32*y), 32, 32)
            input #1, newtile
            this.TileList(x, y).SetTileID(newtile)
        next
    next
    close #1
end sub

sub Chunk.Update() 'updates the chunk
    
end sub

sub Chunk.Render(byval Viewer as Camera) 'Renders the chunk
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            put (ChunkX + (32*x) + Viewer.GetCameraX(), ChunkY + (32*y) + Viewer.GetCameraY()), ImageList(this.TileList(x, y).GetTileID()), trans
            put (ChunkX + (32*x) + Viewer.GetCameraX(), ChunkY + (32*y) + Viewer.GetCameraY()), ImageList(2), trans
        next
    next
end sub

function Chunk.GetTileX(byval TileX as integer) as integer
    return TileX * 32
end function

function Chunk.GetTileY(byval TileY as integer) as integer
    return TileY * 32
end function

