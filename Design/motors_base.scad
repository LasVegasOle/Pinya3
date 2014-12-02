// Pinya3 3D Food Printer
// file: motors_base.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

// motors dimensions
//http://www.aliexpress.com/item/1-68A-Gear-ratio-5-1-Planetary-Gearbox-stepper-motor-Nema-17-Planetary-geared-stepper-3d/1794868710.html

motors_base_platform();

module motors_base_platform(){
  difference(){
    union(){ // Add
            cylinder(h = motors_base_thickness, 
             r = motors_base_rad, 
             center=true, $fn = 20);
      }
    union(){ // Substract
      }
  }
}

module motors_base() {
  color("RoyalBlue", motors_base_alpha)
  translate([printing_area_x_displacement, 0, 
            ((frame_height - motors_base_thickness)/2) 
            - delta_beam_under_frame*2*frame_profile_width
            ])
    motors_base_platform();
}