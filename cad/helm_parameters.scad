// Helm v1 — 6 MX (2x3) + 1 EC11 + XIAO RP2040
// Units: mm.
// y=0 rear (USB, tall). y=plate_depth front (toward the user, short).
// Key plane is desk_angle degrees off the desk. Front low, rear high.

// --- MX ---
mx_pitch     = 19.05;
mx_cutout    = 14.0;
mx_corner_r  = 0.5;   // stop PETG cracks at square hole corners
mx_peg_d      = 1.8;   // 5-pin plastic legs, KiCad ±5.08 mm from center
mx_peg_x      = 5.08;

// --- EC11 (buy the threaded-bushing version + nut + washer) ---
ec11_bushing = 7.2;
ec11_body    = 14.0;
bridge       = 2.5;

// --- case ---
wall             = 2.4;
corner_r         = 3.0;
plate_thickness  = 1.5;  // Cherry clip land; do not go thicker
case_floor       = 2.0;
front_h          = 9.0;   // wall height at the front lip (desk to plate underside)
desk_angle       = 15;
bay_gap          = 4.0;
align_pin_d      = 2.0;
align_pin_h      = 2.0;

// --- XIAO RP2040 ---
xiao_w            = 21.2;
xiao_d            = 17.7;
xiao_pocket_depth = 1.2;
usb_w             = 10.0;
usb_h             = 3.6;
usb_z             = case_floor;
zip_w             = 4.0;  // strain-relief zip-tie slot in the rear wall
zip_h             = 2.2;

// --- M2 heat-set ---
m2_through     = 2.2;
m2_insert      = 3.2;
m2_insert_h    = 4.5;
boss_d         = 6.8;
screw_inset    = 5.0;

// --- rubber feet ---
foot_d = 10.0;
foot_h = 0.8;
foot_inset = 8.0;

// --- derived layout (in the KEY / plate plane) ---
grid_x0 = wall + 3.0 + 0.5 * mx_pitch;
grid_y0 = wall + xiao_d + bay_gap + 0.5 * mx_pitch;

key_centers_x = [grid_x0, grid_x0 + mx_pitch, grid_x0 + 2 * mx_pitch];
key_centers_y = [grid_y0, grid_y0 + mx_pitch];

encoder_x = key_centers_x[2] + mx_cutout / 2 + bridge + ec11_bushing / 2;
encoder_y = (key_centers_y[0] + key_centers_y[1]) / 2;

plate_width = encoder_x + ec11_bushing / 2 + wall + 3.0;
plate_depth = key_centers_y[1] + 0.5 * mx_pitch + wall;

desk_depth = plate_depth * cos(desk_angle);
rear_h     = front_h + desk_depth * tan(desk_angle);

xiao_x = wall + 3.0;
xiao_y = wall;

screw_positions = [
    [screw_inset, screw_inset],
    [plate_width - screw_inset, screw_inset],
    [screw_inset, plate_depth - screw_inset],
    [plate_width - screw_inset, plate_depth - screw_inset]
];

// alignment pins sit mid-left and mid-right, in the key plane
align_positions = [
    [screw_inset, plate_depth / 2],
    [plate_width - screw_inset, plate_depth / 2]
];

foot_positions = [
    [foot_inset, foot_inset],
    [plate_width - foot_inset, foot_inset],
    [foot_inset, desk_depth - foot_inset],
    [plate_width - foot_inset, desk_depth - foot_inset]
];

function z_top(y_desk) = front_h + (desk_depth - y_desk) * tan(desk_angle);

module plate_to_world() {
    // plate coords: z up from plate underside, y from rear to front along the plate
    translate([0, 0, rear_h])
        rotate([-desk_angle, 0, 0])
            children();
}
