// Pinya3 3D Food Printer
// file: motors_base.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

motors_base();

module motors_base(){
  difference(){
    union(){ // Add
        motors_base_platform();
      }
    union(){ // Substract
      }
  }
}

module motors_base_platform() {
  color("RoyalBlue", motors_base_alpha)
  translate([printing_area_x_displacement, 0, 
            ((frame_height + motors_base_thickness)/2) 
            - delta_beam_under_frame*2*frame_profile_width
            + frame_profile_width
            ])
    cylinder(h = motors_base_thickness, 
             r = motors_base_rad, 
             center=true, $fn = 20);
}