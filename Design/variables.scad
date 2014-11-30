// Pinya3 3D Food Printer
// file: variables.scad 
// author: Luis Rodriguez
// version: 0.1
// w3b: 3digitalcooks.com 

// Variables for all the project
// just numbers??
alpha = 0.7;

// PRINTING AREA
// from: https://www.marginallyclever.com/other/samples/fk-ik-test.html
// Base radius (f) = 100mm
// End Effector radius (e) = 30mm
// Bice length (rf) = 320mm
// Forearm length = 350mm
//X=-194.288 to 194.288 mm
//Y=-194.288 to 194.288 mm
//Z=-540.222 to -151.646 mm
printing_area_alpha = 0.2;
printing_area_x = 140*2;//195*2;
printing_area_y = 140*2;//195*2;
printing_area_z = 390 -110;//540-151;
printing_area_distance_from_motors_base = 110;//151
printing_area_x_displacement = 250/2 + 140;

// MOTORS BASE
motors_base_alpha = alpha;
motors_base_thickness = 5;
motors_base_rad = 70;

// FRAME 
frame_alpha = alpha;
frame_profile_width = 20;

frame_height = 400;
frame_width = 250;  // 250mm -> 7capsules~de 8cm
frame_lenght = 250;

// FOREARM 
forearm_alpha = alpha;
forearm_length = 220;
forearm_rad = 4;
forearm_motors_joint_rad = 50;

// DELTA BEAM
delta_beam_alpha = alpha;
delta_beam_length = printing_area_x_displacement 
                    + forearm_motors_joint_rad 
                    + frame_width/2;
echo("Delta beam lenght = ", delta_beam_length);
delta_beam_profile_width = frame_profile_width*2;
delta_beam_under_frame = 1; // 1 = Beam under frame or 0 = Beam on frame


// CAROUSEL
carousel_alpha = 0.3;
carousel_number_of_tools = 11;
carousel_offset_rotation = 0; // in degrees
carousel_rad = frame_width-20;//160;
carousel_tool_height = 180;
carousel_tool_rad = 40;

