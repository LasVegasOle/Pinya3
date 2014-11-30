// Pinya3 3D Food Printer
// file: Pinya3.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com 

// Variables
// Coordinates x,y,z moves the printer arms ToDo

Pinya3();

module Pinya3(){
  difference(){
    union(){ // Add
        pinya3_frame();
      }
    union(){ // Substract
      }
  }
}
