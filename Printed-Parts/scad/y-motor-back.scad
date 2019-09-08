include <y-motor.scad>

module y_motor_back() {
    difference() {
        y_motor();
        translate([0,0,-1]) cube([100,100,100]);
    }
}

y_motor_back();
