// Pinya3 3D Food Printer
// file: frame.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com 

// Variables

  frame();

module frame(){
color("SlateGray",0.7)
  difference(){
    union(){ // Add
      cube([10, 10, 10], center=true); 
      }
    union(){ // Substract
      }
  }
}
