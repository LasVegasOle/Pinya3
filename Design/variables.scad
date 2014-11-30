// Pinya3 3D Food Printer
// file: variables.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com 

// Variables for all the project
// just numbers??
alpha = 0.7;

// FRAME 
frame_alpha = alpha;
frame_profile_width = 30;

frame_height = 500;
frame_width = 250;  // 250mm -> 7capsules~de 8cm
frame_lenght = 250;

// DELTA BEAM
delta_beam_alpha = alpha;
delta_beam_length = 700;
delta_beam_profile_width = 100;
delta_beam_under_frame = 1; // 1 = Beam under frame or 0 = Beam on frame

// CAROUSEL
carousel_alpha = 0.3;
carousel_number_of_tools = 7;
carousel_offset_rotation = 0; // in degrees
carousel_rad = frame_width/2 - 30;//160;
carousel_tool_height = 200;
carousel_tool_rad = 40;