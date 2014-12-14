// Pinya3 3D Food Printer
// file: forearm.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

//forearm_bar();
//forearm_bar();
forearms();
module forearms(){
  difference(){
    union(){ // Add
      forearm_placement();
    }
    union(){ // Substract
    }
  }
}


module forearm_placement() {
      color("LightSalmon", forearm_alpha)
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
          translate([0, 0, bicep_length])
          rotate([0, forearm_bicep_joint_degree, 0]) {
            translate([0, bfj_distance_btw_forearms/2, 0])
              forearm_bar();
            translate([0, -bfj_distance_btw_forearms/2, 0])
              forearm_bar();
          }
    }
}

module forearm_bar() {
  union() {
  translate([0, 0, forearm_ball_diameter])
    cylinder(h = forearm_length - 2*forearm_ball_diameter, r = forearm_rad, center=false);
  translate([0, 0, forearm_ball_diameter/2])
    sphere(forearm_ball_diameter/2);  
  translate([0, 0, forearm_length - forearm_ball_diameter/2])
  sphere(forearm_ball_diameter/2);  
  }
}