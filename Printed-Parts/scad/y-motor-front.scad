include <y-motor.scad>

module y_motor_front() {
    difference() {
        y_motor();
        translate([-100,0,-1]) cube([100,100,100]);
    }
}

y_motor_front();
