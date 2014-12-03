// Pinya3 3D Food Printer
// file: motors_base.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

// motors dimensions
//http://www.aliexpress.com/item/1-68A-Gear-ratio-5-1-Planetary-Gearbox-stepper-motor-Nema-17-Planetary-geared-stepper-3d/1794868710.html

position_steppers_rad = forearm_motors_joint_rad;

motors_base_platform();

module motors_base_platform(){
  difference(){
    union(){ // Add
        motors_base_body();
        position_steppers();
          //cube([60, 60, 20], center=true);
        }
    union(){ // Substract
        delta_beam_holding_screws();
      }
  }
}

module motors_base() {
  //color("RoyalBlue", motors_base_alpha)

  translate([printing_area_x_displacement, 0, 
            ((frame_height - motors_base_thickness)/2) 
            - delta_beam_under_frame*2*frame_profile_width
            ])
    mirror([0, 0, 1])
    rotate([0, 0, 180])
    motors_base_platform();
}

module delta_beam_holding_screws() {
  // Bolt #1
  translate([0, 0, 0])
    cylinder( h=20, r = delta_beam_bolt_rad, center=true);
  // Bolt #2
  translate([20, 0, 0])
    cylinder( h=20, r = delta_beam_bolt_rad, center=true);
  // Bolt #3
  translate([-7, 20, 0])
    cylinder( h=20, r = delta_beam_bolt_rad, center=true);
  // Bolt #4
  translate([-11, -20, 0])
    cylinder( h=20, r = delta_beam_bolt_rad, center=true);
}

module motors_base_body() {
  color("Green", motors_base_alpha)
  union() {
    translate([0, 0, -motors_base_thickness/2 ])
    rotate([0, 0, 60])
    cylinder(h = motors_base_thickness, 
             r = motors_base_rad, 
             center=true, $fn = 3);
    bracket_bases();
  }
}

module bracket_bases() {
  for (i = [0,1,2]) {
      translate([position_steppers_rad*sin(i*120+90), position_steppers_rad*cos(i*120+90), 50/2])
        rotate([0, 0, 90 + i*240])
          bracket_base();
  }  
}
module position_steppers() {
  for (i = [0,1,2]) {
      translate([position_steppers_rad*sin(i*120+90), position_steppers_rad*cos(i*120+90), 50/2 + 5/2])
        rotate([0, 0, 90 + i*240])
          stepper_geared();
  }
}

// motors dimensions
//http://www.aliexpress.com/item/1-68A-Gear-ratio-5-1-Planetary-Gearbox-stepper-motor-Nema-17-Planetary-geared-stepper-3d/1794868710.html
module stepper_geared() {
  // Shaft
  translate([+5/2, 0, 0]) {
    color("Purple", motors_base_alpha)
      rotate([0, 90, 0])
        cylinder(h=20, r=8/2, center=true);
    // Planetary reduction
    color("DarkMagenta", motors_base_alpha)
    translate([20/2 + 27.3/2, 0, 0])
      rotate([0, 90, 0])
        cylinder(h=27.3, r=36/2, center=true);
    // Nema body
    translate([40/2 + 27.3 + 20/2, 0, 0])
      color("DarkOrchid", motors_base_alpha)
        cube([40, 42.3, 42.3], center=true);
    stepper_bracket();
  }
}

// Bracket dimensions
//http://www.omc-stepperonline.com/images/ST-M6_01.JPG
module stepper_bracket() {
  color("Crimson",motors_base_alpha)
  translate([50/2 + 20/2 - 5, 0, -50/2])
  difference() {
    union() {
      // base
      cube([50, 42, 5], center=true);
      // motor holder(vertical wall)
      translate([ -50/2 + 5/2, 0, +50/2 -5/2]) 
        cube([5, 42, 50], center=true);
    }
    union() {
      // shaft hole
      rotate([0, 90, 0])
      translate([ -50/2, 0, +50/2 -5/2])
        cylinder(h = 100, r =22/2, center=true);
      // base bolting holes
      for (i = [-1,1]) {
        hull() {
          translate([30/2, i*30/2, 0])  
            cylinder(h=20, r = 2.1, center=true, $fn = 20);
          translate([-30/2, i*30/2, 0])  
            cylinder(h=20, r = 2.1, center=true, $fn = 20);
        }
      }
    }
  }
}
module bracket_base() {
  color("Blue",motors_base_alpha)
  translate([+5/2, 0, -motors_base_thickness/2])
  translate([50/2 + 20/2 - 5, 0, -50/2])
  difference() {
    union() {
      // base
      cube([50, 42, motors_base_thickness], center=true);
      // motor holder(vertical wall)
    }
    union() {
      // base bolting holes
      for (i = [-1,1]) {
          translate([30/2, i*30/2, 0])  
            cylinder(h=20, r = 2.1, center=true, $fn = 20);
          translate([-30/2, i*30/2, 0])  
            cylinder(h=20, r = 2.1, center=true, $fn = 20);
      }
    }
  }
}