// Pinya3 3D Food Printer
// file: forearm.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

forearm();

module forearm(){
  difference(){
    union(){ // Add
      forearm_bar();
    }
    union(){ // Substract
    }
  }
}


module forearm_bar() {
  translate([printing_area_x_displacement + forearm_motors_joint_rad*sin(210), 
             forearm_motors_joint_rad*cos(210), 
             (frame_height)/2 
             + motors_base_thickness
             - delta_beam_under_frame*2*frame_profile_width
             + frame_profile_width])
    rotate([90, 0, -30])
      color("OrangeRed", forearm_alpha)
      cylinder(h = forearm_length, r = forearm_rad, center=false);

  translate([printing_area_x_displacement + forearm_motors_joint_rad*sin(90), 
             forearm_motors_joint_rad*cos(90), 
             (frame_height)/2 
             + motors_base_thickness
             - delta_beam_under_frame*2*frame_profile_width
             + frame_profile_width])
    rotate([90, 0, 90])
      color("OrangeRed", forearm_alpha)
      cylinder(h = forearm_length, r = forearm_rad, center=false);


        translate([printing_area_x_displacement + forearm_motors_joint_rad*sin(320), 
             forearm_motors_joint_rad*cos(320), 
             (frame_height)/2 
             + motors_base_thickness
             - delta_beam_under_frame*2*frame_profile_width
             + frame_profile_width])
    rotate([90, 0, -150])
      color("OrangeRed", forearm_alpha)
      cylinder(h = forearm_length, r = forearm_rad, center=false);


}