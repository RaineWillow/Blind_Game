'Fake generator

dim Chunk(0 to 63, 0 to 63) as integer

for x as integer = 0 to 63
    Chunk(x, 0) = 1
    Chunk(x, 63) = 1
next

for y as integer = 0 to 63
    Chunk(0, y) = 1
    Chunk(63, y) = 1
next

open "Chk1.chunk" for output as #1
for x as integer = 0 to 63
    for y as integer = 0 to 63
        write #1, Chunk(x, y)
    next
next
close #1

