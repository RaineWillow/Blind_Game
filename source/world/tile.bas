'Tile object

type Tile
    private:
        dim Solid as integer
        dim IsExit as integer
    public:
        dim BoundingBox as Box
        
        declare sub Update()
        declare sub Render(byval X as integer, byval Y as integer)
        
        declare sub SetSolid(byval NewID as integer)
        declare function GetSolid() as integer
        
        declare sub SetExit(byval NewVal as integer)
        declare function GetExit() as integer
        
        declare sub LoadTile(byval TileData as string)
end type

sub Tile.Update()
    
end sub

sub Tile.Render(byval X as integer, byval Y as integer)
    if this.IsExit = 1 then
        put (X, Y), ImageList(3), trans
    end if
end sub

sub Tile.SetSolid(byval NewID as integer) 'Sets the solidity
    this.Solid = NewID
end sub

function Tile.GetSolid() as integer 'Gets the tile ID
    return this.Solid
end function

sub Tile.SetExit(byval NewVal as integer)
    this.IsExit = NewVal
end sub

function Tile.GetExit() as integer
    return this.IsExit
end function

sub Tile.LoadTile(byval TileData as string)
    dim FileData() as string
    split(TileData, , , FileData())
    this.Solid = val(FileData(0))
    this.IsExit = val(FileData(1))
end sub
