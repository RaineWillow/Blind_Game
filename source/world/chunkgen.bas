'A test Map generator

declare function GetRandomNumber(byval Min as integer, byval Max as integer, byval Seed as integer)

declare function ChunkGenerator() as Chunk

function GetRandomNumber(byval Min as integer, byval Max as integer, byval Seed as integer) as integer
   randomize (timer+Seed)
   dim Number as integer
   Number = (rnd * (Max - Min) + Min)
   return Number
end function

function ChunkGenerator() as Chunk
    dim Chunk(0 to 63, 0 to 63) as integer
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            Chunk(x, y) = 1
        next
    next
end function
            
