'World Class
#include "camera.bas"
#include "chunk.bas"
#include "source/ent/player.bas"
'#include "source/utils/chunkgen.bas"

type ZaWarudo
    private:
        dim Player1 as Player
        dim LoadedChunk as Chunk
        dim Viewer as Camera
        
        'World event handlers---------------------------------------------------------
        
        declare sub CheckExit()
        
        declare sub Events()
        
    public:
        declare sub Init()
        declare sub Update()
        declare sub Render()
end type

sub ZaWarudo.CheckExit()
    dim CheckTile as Tile
    CheckTile = LoadedChunk.GetTile(this.Player1.GetTileX, this.Player1.GetTileY)
    if CheckTile.GetExit() = 1 then
        'this.Player1.PlayerText = "Press <Interact Key> to descend"
        'Check for E
    end if
end sub

sub ZaWarudo.Events()
    this.CheckExit()
end sub

sub ZaWarudo.Init()
    this.LoadedChunk.Init(0, 0)
    this.Player1.Init(0, 0)
    this.Player1.SetTile(16, 16)
end sub

sub ZaWarudo.Update()
    this.Player1.Update(LoadedChunk)
    this.Viewer.Update(this.Player1.BoundingBox.GetBoxX(), this.Player1.BoundingBox.GetBoxY())
    
    this.Events()
end sub

sub ZaWarudo.Render()
    this.LoadedChunk.Render(this.Viewer)
    this.Player1.Render(this.Viewer)
    print "Player Tile X: "; this.Player1.GetTileX(); " ";
    print "Player Tile Y: "; this.Player1.GetTileY()
    print "Mouse X: "; Mouse.TileX; " Mouse Y: "; Mouse.TileY
End sub
