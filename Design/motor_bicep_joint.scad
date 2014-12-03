// Pinya3 3D Food Printer
// file: motor_bicep_joint.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

motor_bicep_joint();

module motor_bicep_joint(){
  difference(){
    union(){ // Add
        motor_bicep_joint_shaft_holder();
        motor_bicep_joint_bicep_holder();
      }
    union(){ // Substract
      motor_bicep_joint_shaft_hole();
      motor_bicep_joint_bicep_hole();
      motor_bicep_joint_shaft_bolt_hole();
      motor_bicep_joint_bicep_bolt_hole();
      motor_bicep_joint_shaft_nut_hole();
      motor_bicep_joint_bicep_nut_hole();
      }
  }
}


// ADD

module motor_bicep_joint_shaft_holder() {
  cylinder(h = motor_bicep_joint_shaft_holder_thickness, 
           r = motor_bicep_joint_shaft_holder_diameter/2, center=true);
}

module motor_bicep_joint_bicep_holder() {
  translate([motor_bicep_joint_bicep_holder_length/2, 0, 0])
    cube([motor_bicep_joint_bicep_holder_length, 
          motor_bicep_joint_bicep_holder_width, 
          motor_bicep_joint_bicep_holder_width], center=true); 
}

// SUBSTRACT

module motor_bicep_joint_shaft_hole() {
  difference() {
  cylinder(h = motor_bicep_joint_shaft_holder_thickness * 3,
           r = stepper_shaft_diameter/2, center=true);
  translate([motor_bicep_joint_shaft_flat_displecement, 0, 0])
    cube([motor_bicep_joint_shaft_nut_thickness, 
          motor_bicep_joint_shaft_nut_width, 
          motor_bicep_joint_shaft_holder_thickness], center=true);  
  }
}

module motor_bicep_joint_bicep_hole() {
  translate([motor_bicep_joint_bicep_holder_length 
              - motor_bicep_joint_bicep_insert_lenght/2 + 0.1, 0, 0])
    rotate([0, 90, 0])
      cylinder(r = bicep_diameter/2, 
               h = motor_bicep_joint_bicep_insert_lenght, 
               center=true, $fn = 20);
}

module motor_bicep_joint_shaft_bolt_hole() {
  translate([-motor_bicep_joint_shaft_bolt_lenght/2, 0, 0])
    rotate([0, 90, 0])
      cylinder(h=motor_bicep_joint_shaft_bolt_lenght, 
               r=motor_bicep_joint_shaft_bolt_diameter/2, center=true, $fn=25);
}

module motor_bicep_joint_bicep_bolt_hole() {
  translate([motor_bicep_joint_bicep_holder_length 
             - motor_bicep_joint_bicep_insert_lenght/2, 0, 0])
    cylinder(h = motor_bicep_joint_bicep_bolt_lenght, 
             r = motor_bicep_joint_bicep_bolt_diameter/2, center=true, $fn=25);
}

module motor_bicep_joint_shaft_nut_hole() {
  translate([-motor_bicep_joint_shaft_nut_displacement, 0, 0])
    cube([motor_bicep_joint_shaft_nut_thickness, 
          motor_bicep_joint_shaft_nut_width, 
          motor_bicep_joint_shaft_nut_hole_height], center=true);
}

module motor_bicep_joint_bicep_nut_hole() {
  translate([motor_bicep_joint_bicep_holder_length 
             - motor_bicep_joint_bicep_insert_lenght/2, 0,
             motor_bicep_joint_shaft_holder_thickness/2])
    cylinder(h = motor_bicep_joint_bicep_nut_thickness, 
             r = motor_bicep_joint_bicep_nut_diameter/2, center=true, $fn=6); 
}