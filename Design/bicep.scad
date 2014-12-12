// Pinya3 3D Food Printer
// file: biceps.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

biceps();

module forearm(){
  difference(){
    union(){ // Add
      bicep();
    }
    union(){ // Substract
    }
  }
}


module bicep() {
      color("OrangeRed", forearm_alpha)
      for (i = [0,1,2]) {
        translate([printing_area_x_displacement + bicep_motors_joint_rad*sin(i*120 -30), 
                   bicep_motors_joint_rad*cos(i*120 -30),                  
                   frame_height/2
                   //+ bicep_length/2
                   - delta_beam_under_frame * frame_profile_width * 2
                   - motors_base_thickness
                   - stepper_bracket_base_thickness
                   - stepper_motor_width/2])
        rotate([0, bicep_motors_joint_degree, 120*i +120*i - 60])
          mirror([0, 0, 1])
            cylinder(h = bicep_length, r = bicep_rad, center=false);
      }
}