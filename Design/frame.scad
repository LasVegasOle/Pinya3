// Pinya3 3D Food Printer
// file: frame.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

// Local variables
frame_vertical_profiles_length = frame_height;
echo("vertical profile length =",frame_vertical_profiles_length);
frame_horizontal_witdh_profiles_length = frame_width - 2*frame_profile_width;
echo("horizontal width profile length", frame_horizontal_witdh_profiles_length);
frame_horizontal_length_profiles_length = frame_lenght - 2*frame_profile_width;
echo("horizontal length profile length", frame_horizontal_length_profiles_length);

frame();

module frame(){
  difference(){
    union(){ // Add
      frame_vertical_profiles();
      frame_horizontal_profiles();
      }
    union(){ // Substract
      }
  }
}

module frame_vertical_profiles() {
  for (j = [-1,1]) {
    for (i = [-1,1]) {
      translate([i*(frame_width/2 - frame_profile_width/2), 
                 j*(frame_lenght/2 - frame_profile_width/2), 0])
        frame_vertical_profile();
    }
  }
}

module frame_horizontal_profiles() {

  for (i = [-1,1]) {
    translate([0, 0, i* ((frame_height - frame_profile_width)/2)]){
      frame_horizontal_width_profiles();
      frame_horizontal_length_profiles();
  }
    }
}

module frame_horizontal_width_profiles() {
  for (i = [-1,1]) {
  translate([0, i*((frame_lenght - frame_profile_width)/2), 0])
    frame_horizontal_width_profile();
  }
}

module frame_horizontal_length_profiles() {
  for (i = [-1,1]) {
  translate([i*((frame_width - frame_profile_width)/2), 0, 0])
    frame_horizontal_length_profile();
  }
}

module frame_vertical_profile() {
  color("DimGray",frame_alpha)
  cube([frame_profile_width, 
        frame_profile_width, 
        frame_vertical_profiles_length], center=true);
}

module frame_horizontal_width_profile() {
  color("LightSlateGray",frame_alpha)
  cube([frame_horizontal_witdh_profiles_length,  
        frame_profile_width, 
        frame_profile_width], center=true);
}

module frame_horizontal_length_profile() {
  color("Gainsboro",frame_alpha)
  cube([frame_profile_width,  
        frame_horizontal_length_profiles_length, 
        frame_profile_width], center=true);
}