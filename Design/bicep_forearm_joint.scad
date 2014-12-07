// Pinya3 3D Food Printer
// file: bicep_forearm_joint.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

bicep_forearm_joint();

module bicep_forearm_joint(){
  difference(){
    union(){ // Add
        bfj_body();
    }
    union(){ // Substract
        bfj_magnets_holes();
        bfj_bicep_screw_hole();
        bfj_forearms_joint_ball_sliding_holes();
    }
  }
}

// ADD
module bfj_body() {
  cube([bfj_width, 
        bfj_thickness, 
        bfj_height], center=true);
}

// SUBSTRACT
module bfj_magnets_holes() {
  #for (i = [-1,1]) {
    translate([i*bfj_distance_btw_forearms/2, 
               0, 
               bfj_height/2])
      cube([magnet_cube_side, 
            magnet_cube_side, 
            magnet_cube_side], center=true);
  }
}

module bfj_bicep_screw_hole() {
  cylinder(h = bfj_height*3, r = bfj_screw_diameter/2, center=true, $fn = 25);
}

module bfj_forearms_joint_ball_sliding_holes() {
  #for (i = [-1,1]) {
    translate([i*bfj_distance_btw_forearms/2, 
               0, 
               -bfj_height/2 + bfj_forearms_joint_ball_sliding_height/2])
      cylinder( h = bfj_forearms_joint_ball_sliding_height, 
                r = bfj_ball_sliding_rad, center=true, $fn = 25);
  }
}
