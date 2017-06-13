'ChunkGen

type ChunkGen
	private:
		dim state as integer
        
        declare function BigEmptyRoom() as Chunk
	public:
		declare function Generate() as Chunk
        
end type

function ChunkGen.BigEmptyRoom() as Chunk
    dim MakeChunk as Chunk
    
    for x as integer = 0 to 63
        dim NewTile1 as Tile
        dim NewTile2 as Tile
        
        NewTile1 = MakeChunk.GetTile(x, 0)
        NewTile1.SetSolid(1)
        MakeChunk.SetTile(x, 0, NewTile1)
        
        NewTile2 = MakeChunk.GetTile(x, 63)
        NewTile2.SetSolid(1)
        MakeChunk.SetTile(x, 63, NewTile2)
    next
    
    for y as integer = 0 to 63
        dim NewTile1 as Tile
        dim NewTile2 as Tile
        
        NewTile1 = MakeChunk.GetTile(0, y)
        NewTile1.SetSolid(1)
        MakeChunk.SetTile(0, y, NewTile1)
        
        NewTile2 = MakeChunk.GetTile(63, y)
        NewTile2.SetSolid(1)
        MakeChunk.SetTile(63, y, NewTile2)
    next ' *puts on orange wig and way too much spray tan* We have built a wall!!
    
end function
