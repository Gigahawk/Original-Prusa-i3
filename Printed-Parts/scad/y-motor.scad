// PRUSA iteration3
// Y motor mount
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

//include <configuration.scad>

thickness = 20;
joining_screws = 2;

module y_motor_base(){
    // Motor holding part
    translate(v = [29,-21+50,0]){
        translate(v = [-21+4.5,0,thickness/2]) cube(size = [9,31,thickness], center=true);
        translate(v = [-15.5,-15.5,0]) cylinder(h = thickness, r=5.5, $fn=50);
        translate(v = [-15.5,+15.5,0]) cylinder(h = thickness, r=5.5, $fn=50);
        translate([-21,7,0]) rotate([0,0,45]) cube([2, 2, thickness]);

        //end stop
        translate(v = [-10.5,+15.5,0]) cylinder(h = thickness, r=5.5, $fn=50);
        translate([-12,0,0]) cube([7, 15, thickness]);
        translate([-16,16,0]) cube([6, 5, thickness]);
        translate([-21+6,8,0]) cube([12-2, 5, thickness + 18]);
        translate([-21+6-2,8-5,0]) cube([4, 10, thickness + 18]);
        translate([-21+9.5-2,7,0]) rotate([0,0,45]) cube([2, 2, thickness + 18]);
        // Joins motor holder and rod plate
        translate(v = [-29,-21,0]) cube(size = [14,30,thickness]);
    }
    // Front holding part
    translate(v = [0,10,0]) cylinder(h = thickness, r=8, $fn=80);
    translate(v = [0,20,thickness/2]) cube(size = [16,20,thickness], center=true);
    translate(v = [0,30,0])cylinder(h = thickness, r=8, $fn=80);
}

module y_motor_holes(){
    translate(v = [29,-21+50,0]){
        // Stepper screw holes
        translate(v = [-15.5,-15.5,-1]) cylinder(h = thickness, r=1.8, $fn=20);
        translate(v = [-15.5,+15.5,-1]) cylinder(h = thickness, r=1.8, $fn=20);
        // Stepper screw head holes
        translate(v = [-15.5,-15.5,thickness - 3]) cylinder(h = 7, r=3.5, $fn=30);
        translate(v = [-15.5,+15.5,thickness - 3]) cylinder(h = 25, r=3.5, $fn=30);
    }

    // Threaded rod holes
    translate(v = [0,10,-1]) cylinder(h = thickness + 2, r=4.1, $fn=50);
    translate(v = [0,30,-1]) cylinder(h = thickness + 2, r=4.1, $fn=50);

    // endstop
    translate([25,29,0])  cylinder(h = thickness + 19, r=8, $fn=20);

    translate([18,45,thickness + 5]) rotate([90,0,0]) cylinder(h = 10, r=0.8, $fn=20);
    translate([18,42.2,thickness + 5]) rotate([90,0,0]) cylinder(h = 2, r1=1.2, r2=0.8, $fn=20);

    translate([18,45,thickness + 14.5]) rotate([90,0,0]) cylinder(h = 10, r=0.8, $fn=20);
    translate([18,42.2,thickness + 14.5]) rotate([90,0,0]) cylinder(h = 2, r1=1.2, r2=0.8, $fn=20);

    // endstop corner cutout
    translate([-5-2,30,thickness + 18]) rotate([0,45,0]) cube([15, 19, 15]);
    translate([-1,41,thickness])  cube([15, 5, 19]);
    translate([27,33,0]) rotate([0,0,45]) cube([5, 5, thickness + 18]);
    translate([12-2,28,thickness + 0.01]) rotate([0,0,45]) cube([5, 5, 28]);

    translate([19,32,0]) rotate([0,30,0]) cube([8, 20, 18]);
    translate([24.5-2,32,thickness + 7]) rotate([0,45,0]) cube([2, 20, 2]);

    translate([23-2,32,thickness + 19]) rotate([0,45,0]) cube([5, 20, 5]);

    joiner_spacing = thickness / joining_screws;
    for(i = [1:joining_screws]) {
        joiner_height = (i - 0.5)*(joiner_spacing);
        // Screw hole to join halves
        translate(v = [-10,+20,joiner_height]) rotate([0, 90, 0]) cylinder(h = 30, r=1.8, $fn=20);
        // Screw head hole to join halves
        translate(v = [-10,+20,joiner_height]) rotate([0, 90, 0]) cylinder(h = 5, r=3.5, $fn=30);
    }
    // Nut slot to join halves
    translate(v = [7, 20, thickness/2]) cube([3, 5.7, thickness+2], center=true);

}

// Final part
module y_motor(){
    difference(){
        y_motor_base();
        y_motor_holes();
    }
}

