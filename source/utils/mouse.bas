'Mouse class

type MouseC
    private:
        dim MouseX as integer
        dim MouseY as integer
        
        dim MouseWheel as integer
        dim MouseButton as integer
        
    public:
        dim TileX as integer
        dim TileY as integer
        
        declare sub Update()
        
        declare function GetMouseX() as integer
        declare function GetMouseY() as integer
        
        declare function GetMouseWheel() as integer
        
        declare function GetButton1() as integer
        declare function GetButton2() as integer
        declare function GetButton3() as integer 
end type

sub MouseC.Update()
    getmouse this.MouseX, this.MouseY, this.MouseWheel, this.MouseButton
end sub

function MouseC.GetMouseX() as integer
    return this.MouseX
end function

function MouseC.GetMouseY() as integer
    return this.MouseY
end function

function MouseC.GetMouseWheel() as integer
    return this.MouseWheel
end function

function MouseC.GetButton1 as integer
    if this.MouseButton and 1 then
        return 1
    else
        return 0
    end if
end function

function MouseC.GetButton2 as integer
    if this.MouseButton and 2 then
        return 1
    else
        return 0
    end if
end function

function MouseC.GetButton3 as integer
    if this.MouseButton and 2 then
        return 1
    else
        return 0
    end if
end function

dim shared Mouse as MouseC
