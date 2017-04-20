'A test Map generator

declare function GetRandomNumber(byval Min as integer, byval Max as integer, byval Seed as integer)

declare function ChunkGenerator() as Chunk

type Room
    dim X as integer
    dim Y as integer
    dim W as integer
    dim H as integer
end type

type ExitRoom
    dim X as integer
    dim Y as integer
end type

function GetRandomNumber(byval Min as integer, byval Max as integer, byval Seed as integer) as integer
   randomize (timer+Seed)
   dim Number as integer
   Number = (rnd * (Max - Min) + Min)
   return Number
end function

dim shared Rooms() as Room
dim shared RoomExits(0, 3) as integer

function ChunkGenerator() as Chunk
    dim Chunk(0 to 63, 0 to 63) as integer
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            Chunk(x, y) = 1
        next
    next
    'Generate rooms based on a random number of attempts between 10 and 40
    for Attempts as integer = 1 to GetRandomNumber(10, 40, 1)
        redim preserve Rooms(1 to Attempts) as Room
        'Will finish later
end function
            
