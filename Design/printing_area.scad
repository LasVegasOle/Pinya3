// Pinya3 3D Food Printer
// file: printing_area.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

printing_area();

module printing_area(){
  difference(){
    union(){ // Add
      color("ForestGreen", printing_area_alpha)
      translate([printing_area_x_displacement, 
                 0,
                 (frame_height - printing_area_z)/2 
                 - printing_area_distance_from_motors_base])
        cube([printing_area_x, printing_area_y, printing_area_z], center=true);
      }
    union(){ // Substract
      }
  }
}
