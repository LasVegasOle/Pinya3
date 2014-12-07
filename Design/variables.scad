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
frame_profile_width = 20;

frame_height = 370;
frame_width = 250;  // 250mm -> 7capsules~de 8cm
frame_lenght = 200;

// PRINTING AREA
// from: https://www.marginallyclever.com/other/samples/fk-ik-test.html
// Base radius (f) = 80mm
// End Effector radius (e) = 30mm
// Bice length (rf) = 200mm
// Forearm length = 260mm
// PA = 260 x 260 x 260
// X=-128.225 to 128.225 mm 
// Y=-128.225 to 128.225 mm
// Z=-387.23 to -130.781 mm
printing_area_alpha = 0.2;
printing_area_x = 128*2;//195*2;
printing_area_y = 128*2;//195*2;
printing_area_distance_from_motors_base = 130;//151
printing_area_z_max = 387;
printing_area_z = printing_area_z_max - printing_area_distance_from_motors_base;//540-151;
echo("printing z =",printing_area_z);
printing_area_x_displacement = frame_width/2 + printing_area_x/2;

// FOREARM 
forearm_alpha = alpha;
forearm_length = 200;
forearm_rad = 4;
forearm_motors_joint_rad = 25;
forearm_ball_diameter = 12;

// MOTORS BASE
motors_base_alpha = alpha;
motors_base_thickness = 6;
motors_base_rad = forearm_motors_joint_rad;

// DELTA BEAM
delta_beam_alpha = alpha;
delta_beam_length = printing_area_x_displacement 
                    + forearm_motors_joint_rad 
                    + frame_width/2;
echo("Delta beam lenght = ", delta_beam_length);
delta_beam_profile_width = frame_profile_width*3; //60cm
delta_beam_under_frame = 0; // 1 = Beam under frame or 0 = Beam on frame
delta_beam_bolt_rad = 4;
delta_beam_distance_btw_slots = 20;


// CAROUSEL
carousel_alpha = 0.3;
carousel_number_of_tools = 11;
carousel_offset_rotation = 0; // in degrees
carousel_rad = frame_width-20;//160;
carousel_tool_height = 180;
carousel_tool_rad = 40;

// GEARED STEPPER
stepper_shaft_diameter = 8;

// MOTOR BICEP JOINT
motor_bicep_joint_shaft_holder_diameter = 21;
motor_bicep_joint_shaft_holder_thickness = 12;

motor_bicep_joint_bicep_holder_width = motor_bicep_joint_shaft_holder_thickness;
motor_bicep_joint_bicep_holder_length = 20 + motor_bicep_joint_shaft_holder_diameter/2;

motor_bicep_joint_bicep_insert_lenght = 20;

motor_bicep_joint_shaft_bolt_lenght = 12;
motor_bicep_joint_shaft_bolt_diameter = 3.25;

motor_bicep_joint_bicep_bolt_diameter = motor_bicep_joint_shaft_bolt_diameter;
motor_bicep_joint_bicep_bolt_lenght = 30;

motor_bicep_joint_shaft_nut_thickness = 3;
motor_bicep_joint_shaft_nut_width = 6.2;
motor_bicep_joint_shaft_nut_hole_height = 30;
motor_bicep_joint_shaft_nut_displacement = stepper_shaft_diameter/3 + 
            (motor_bicep_joint_shaft_holder_diameter/2 - stepper_shaft_diameter/2)/2;
motor_bicep_joint_bicep_nut_diameter = 6.5;
motor_bicep_joint_bicep_nut_thickness = motor_bicep_joint_shaft_nut_thickness;

motor_bicep_joint_shaft_flat_displecement = -4.6;
// BICEP
bicep_diameter = 8;

// MAGNET
magnet_clearance = 0.25;
magnet_cube_side = magnet_clearance + 10;

// BICEP FOREARM JOINT
bfj_distance_btw_forearms = 60;
bfj_width = 80;
bfj_thickness = 20;
bfj_forearms_joint_ball_sliding_height = 2.5;
bfj_height = magnet_cube_side/2 + bfj_forearms_joint_ball_sliding_height;
bfj_screw_diameter = 6;

// bfj_ball_sliding_rad calculation
R = forearm_ball_diameter/2;
r = bfj_forearms_joint_ball_sliding_height;
r_prima = R - r;
echo("r_prima", r_prima);
cosx = r_prima/R;
x = acos(cosx);
echo("x", x);
bfj_ball_sliding_rad = R*sin(x);
echo(bfj_ball_sliding_rad);