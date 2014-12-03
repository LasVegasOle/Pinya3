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
      color("OrangeRed", forearm_alpha)
      cylinder(h = forearm_length, r = forearm_rad, center=false);


}