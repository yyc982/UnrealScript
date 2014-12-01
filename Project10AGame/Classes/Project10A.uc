class Project10A extends Actor placeable;

var vector v;
var int step; // use to count ball's moving steps


function PreBeginPlay() {
    step = 1; //initiate ball's first step
    SetTimer(0.05, true);

}


function Timer() {
    // 128 steps to across each side (size:256) of square
    if (step <= 128)
    {
        //move + 256 in Y
        v.X = 0;
        v.Y = 2;
        SetLocation(Location + v);
        step = step +1;
    }
    else if (step <= 256)
    {
        //move + 256 in X
        v.X = 2;
        v.Y = 0;
        SetLocation(Location + v);
        step = step +1;
    }
    else if (step <= 384)
    {
        //move - 256 in Y
        v.Y = 2;
        v.X = 0;
        SetLocation(Location - v);
        step = step +1;
    }
    else if (step <= 512)
    {
        //move - 256 in X
        v.X = 2;
        v.Y = 0;
        SetLocation(Location - v);
        step = step +1;
    }
    else
    {
        ClearTimer();
    }

    //`log("step is :"@ step);
}

defaultproperties
{
    Begin Object Class=StaticMeshComponent Name=PickupMesh
        StaticMesh= StaticMesh'GDC_Materials.Meshes.S_SimpleSphere_01'
    End Object
    Components.Add(PickupMesh)
}
