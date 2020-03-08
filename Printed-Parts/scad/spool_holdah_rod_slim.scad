// Increase to increase mesh resolution
$fn = 100;
// Outer diameter (mm)
diameter = 30; 

intersection(){
    import("../stl/spool_holdah_rod.stl");
    translate([0, 0, -20])
        cylinder(d=diameter, h=170);
}