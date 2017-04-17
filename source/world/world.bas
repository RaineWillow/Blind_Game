'World Class
#include "chunk.bas"
type ZaWarudo
    private:
        dim ChunkList as Chunk ptr
        
        dim Player1 as Player
        dim TestChunk as Chunk
    public:
        declare sub Init()
        declare sub Update()
        declare sub Render()
end type

sub ZaWarudo.Init()
    this.TestChunk.Init(0, 0)
    this.Player1.Init(40, 40)
end sub

sub ZaWarudo.Update()
    this.Player1.Update()
end sub

sub ZaWarudo.Render()
    this.TestChunk.Render()
    this.Player1.Render()
end sub
