'Camera class

type Camera
    private:
        dim CameraX as integer
        dim CameraY as integer
    public:
        
        declare sub Update(byval PlayerX as integer, byval PlayerY as integer)
        declare function GetCameraX() as integer
        declare function GetCameraY() as integer
end type

sub Camera.Update(byval PlayerX as integer, byval PlayerY as integer)
    this.CameraX = 384 - PlayerX
    this.CameraY = 284 - PlayerY
end sub

function Camera.GetCameraX as integer
    return this.CameraX
end function

function Camera.GetCameraY as integer
    return this.CameraY
end function
