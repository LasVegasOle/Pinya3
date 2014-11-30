// Pinya3 3D Food Printer
// file: carousel.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

carousel();

module carousel(){
  difference(){
    union(){ // Add
      tools();
      }
    union(){ // Substract
      }
  }
}

module tools() {
  for (i = [0+carousel_offset_rotation:(360/carousel_number_of_tools):360+carousel_offset_rotation]) {
    translate([carousel_rad*sin(i), carousel_rad*cos(i), 0])
      tool();
  }
}

module tool() {
  color("Red", carousel_alpha)
  cylinder(h = carousel_tool_height, r = carousel_tool_rad, center=true);
}
