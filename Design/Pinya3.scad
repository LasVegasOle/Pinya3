// Pinya3 3D Food Printer
// file: Pinya3.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com 

//include <filename> acts as if the contents of the 
  //included file were written in the including file, and
//use <filename> imports modules and functions, but does 
  //not execute any commands other than those definitions.

use <frame.scad>
use <delta_beam.scad>


// Colors
// Scheme: http://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#color

// Variables
// Coordinates x,y,z moves the printer arms ToDo
Pinya3();

module Pinya3(){
  difference(){
    union(){ // Add
        frame();
        delta_beam();
      }
    union(){ // Substract
      }
  }
}
