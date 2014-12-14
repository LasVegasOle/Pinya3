// Pinya3 3D Food Printer
// file: end_effector.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com

include <variables.scad>

ef_rad =  66;
ef_distance_btw_forearms = bfj_distance_btw_forearms;
ef_side_width = bfj_distance_btw_forearms + 20;
ef_magnet_hole_edge_offset = magnet_cube_side/2 + 2;

ef_blocking_hole_diameter = 3.33;
ef_blocking_hole_pos_diameter = 25;

ef_cutted_corners_pos_diameter = 45;

ef_tool_ole_rad = 21;

print_offset = 0.33;

magnet_rad = 8/2 + print_offset;
magnet_position_rad = 20;
magnet_height = 6 + print_offset;

ef_ball_sliding_magnet_clearance = bfj_forearms_joint_ball_sliding_height;
ef_ball_sliding_rad = bfj_ball_sliding_rad;

ef_thickness = 5.5 + ef_ball_sliding_magnet_clearance;
echo(ef_thickness);

end_effector_part();

module end_effector() {
  translate([printing_area_x_displacement, 0, 40])
    rotate([0, 0, 60])
      end_effector_part();
}

module end_effector_part(){
  difference(){
    union(){ // Add
      ef_body();
    }
    union(){ // Substract
      ef_magnet_holes_sides();
      ef_tool_magnet_holes();
      ef_tool_blocking_holes();
      ef_tool_hole();
      ef_cutted_corners();
      #ef_sliding_ball_joints_holes();
    }
  }
}

// ADD
module ef_body() {
  cylinder(h = ef_thickness, r = ef_rad, center=true, $fn = 3);
}

// SUBSTRACT

module ef_magnet_holes_sides() {
  translate([0, 0, 
             -(magnet_cube_side - ef_thickness)/2 - ef_ball_sliding_magnet_clearance])
  for (i = [0,120,240]) {
    rotate([0, 0, i])
    ef_magnet_hole_side();
  }
}

module ef_magnet_hole_side() {
  for (i = [1,-1]) {
    translate([-ef_rad*sin(30)+ ef_magnet_hole_edge_offset
      , i*ef_distance_btw_forearms/2, 0])
      cube(magnet_cube_side, true);
  }
}

module ef_tool_simulation() {
  cylinder(h = 40, r = 25, center=true);
}

module ef_tool_hole(){
  // Freestyling "30"
  rotate([0, 0, 30])  
  cylinder(r=ef_tool_ole_rad, h=ef_thickness*5, $fn=6, center=true);
}

module ef_tool_magnet_holes(){
  for(x=[ 60,180, 300]){
    translate([magnet_position_rad*cos(x), 
               magnet_position_rad*sin(x), 
               ef_thickness/2 - magnet_height/2]) {
      cylinder(r=magnet_rad, h=magnet_height, center=true);
    }
  } 
}

module ef_tool_blocking_holes(){
  for(x=[ 0,120, 240]){
    translate([ef_blocking_hole_pos_diameter*cos(x), 
               ef_blocking_hole_pos_diameter*sin(x), 
               ef_thickness/2 - magnet_height/2]) {
      cylinder(r=ef_blocking_hole_diameter/2, h=magnet_height*2, $fn=20,center=true);
    }
  } 
}

module ef_cutted_corners(rotation = 0){
  for(x=[ 0,120, 240]){
    // Deleting unwanted parts from orignal body
    rotate([0, 0, x]) {
      translate([ef_rad, 0, 0]) {
        cube(size=[ef_cutted_corners_pos_diameter, ef_rad, ef_thickness*2], center=true);
      }
    }
  }
}

module ef_sliding_ball_joints_holes() {
  translate([0, 0, 
             ef_thickness/2 - ef_ball_sliding_magnet_clearance/2])
  for (i = [0,120,240]) {
    rotate([0, 0, i])
    for (i = [1,-1]) {
      translate([-ef_rad*sin(30)+ ef_magnet_hole_edge_offset
        , i*ef_distance_btw_forearms/2, 0])
        cylinder( h = ef_ball_sliding_magnet_clearance, r = 
          ef_ball_sliding_rad, center=true);
    }
  }
}
