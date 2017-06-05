#include "fbgfx.bi"
using FB

open "key_layout.dat" for output as #1
write #1, SC_W 'Up
write #1, SC_S 'Down
write #1, SC_A 'Left
write #1, SC_D 'Right
write #1, SC_E 'Interact
close #1

