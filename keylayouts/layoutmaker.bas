#include "fbgfx.bi"
using FB

open "key_layout.dat" for output as #1
write #1, SC_W
write #1, SC_S
write #1, SC_A
write #1, SC_E
close #1

