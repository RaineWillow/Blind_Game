'Tile object

type Tile
    private:
        dim ID as integer
        dim Solid as integer
        dim TileImage as any pointer
    public:
        dim BoundingBox as Box
        
        declare sub Init()
        declare sub Update()
        declare sub Render()
        declare sub SetTileID(byval NewID as integer)
        declare function GetTileID() as integer
end type

sub Tile.SetTileID(byval NewID as integer) 'Sets the tile ID
    this.ID = NewID
end sub

function Tile.GetTileID() as integer 'Gets the tile ID
    return this.ID
end function

