'Tile object

type Tile
    private:
        dim ID as integer
        dim IsExit as integer
    public:
        dim BoundingBox as Box
        
        declare sub Init()
        declare sub Update()
        
        declare sub SetTileID(byval NewID as integer)
        declare function GetTileID() as integer
        
        declare sub SetExit(byval NewVal as integer)
        declare function GetExit() as integer
end type

sub Tile.SetTileID(byval NewID as integer) 'Sets the tile ID
    this.ID = NewID
end sub

function Tile.GetTileID() as integer 'Gets the tile ID
    return this.ID
end function

sub Tile.SetExit(byval NewVal as integer)
    this.IsExit = NewVal
end sub

function Tile.GetExit() as integer
    return this.IsExit
end function
