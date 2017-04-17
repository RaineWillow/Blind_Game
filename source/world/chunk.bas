#include "tile.bas"
'Chunk class

type Chunk
    private:
        dim ChunkID as integer
        dim ChunkX as integer
        dim ChunkY as integer
        dim TileList(0 to 31, 0 to 31) as Tile
    public:
        declare sub Init(byval ChunkX as integer, byval ChunkY as integer)
        declare sub Update()
        declare sub Render(byval Viewer as Camera)
end type

sub Chunk.Init(byval ChunkX as integer, byval ChunkY as integer)
    for x as integer = 0 to 31
        for y as integer = 0 to 31
            this.TileList(x, y).BoundingBox.Init(ChunkX + (32*x), ChunkY + (32*y), 32, 32)
            this.TileList(x, y).SetTileID(0)
        next
    next
end sub

sub Chunk.Update() 'updates the chunk
    
end sub

sub Chunk.Render(byval Viewer as Camera) 'Renders the chunk
    for x as integer = 0 to 31
        for y as integer = 0 to 31
            put (ChunkX + (32*x) + Viewer.GetCameraX(), ChunkY + (32*y) + Viewer.GetCameraY()), ImageList(this.TileList(x, y).GetTileID()), trans
        next
    next
end sub
