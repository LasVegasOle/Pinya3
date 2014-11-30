// Pinya3 3D Food Printer
// file: delta_beam.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

delta_beam();

module delta_beam(){
  difference(){
    union(){ // Add
      delta_beam_support();
      }
    union(){ // Substract
      }
  }
}

module delta_beam_support() {
  translate([-frame_width/2, 
             -delta_beam_profile_width/2, 
             frame_height/2 - delta_beam_under_frame*2*frame_profile_width])
    delta_beam_profile();
}

module delta_beam_profile() {
  color("DarkSlateGray", delta_beam_alpha)
  cube([delta_beam_length,  
        delta_beam_profile_width, 
        frame_profile_width], center=false);
}