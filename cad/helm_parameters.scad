// Helm v1 parametric case parameters (mm)
// 6x MX 2x3 + 1x EC11 click-knob, Seeed XIAO RP2040

// --- MX switch grid ---
mx_pitch = 19.05;          // Cherry MX / Kailh / Gateron spacing
mx_cutout = 14.0;          // square plate cutout

// --- EC11 encoder ---
ec11_bushing = 7.2;        // shaft bushing diameter
ec11_body = 14.0;          // body below the plate (clearance)

// --- case ---
wall = 2.4;                // PETG wall thickness
plate_thickness = 1.5;     // switch plate thickness
bridge = 2.5;              // plastic between right key and encoder

case_height = 12.0;        // inside height from desk to top of the bottom shell
case_floor = 2.0;          // bottom shell floor thickness

// --- XIAO RP2040 pocket ---
xiao_w = 21.2;             // long side (pins on left/right)
xiao_d = 17.7;             // short side (USB-C on one of these)
xiao_pocket_depth = 1.2;   // recess into the inside floor

usb_w = 10.0;              // USB-C slot width
usb_h = 3.5;               // USB-C slot height

// --- M2 heat-set inserts ---
m2_hole = 2.2;             // through-hole in the plate
m2_insert = 3.2;           // pilot hole in the bottom posts

// --- derived coordinates ---
grid_left = wall;
grid_top = wall;

key_centers_x = [grid_left + 0.5 * mx_pitch,
                 grid_left + 1.5 * mx_pitch,
                 grid_left + 2.5 * mx_pitch];

key_centers_y = [grid_top + 0.5 * mx_pitch,
                 grid_top + 1.5 * mx_pitch];

// encoder sits to the right of the top-right / bottom-right column
encoder_x = key_centers_x[2] + mx_cutout / 2 + bridge + ec11_bushing / 2;
encoder_y = (key_centers_y[0] + key_centers_y[1]) / 2;

// plate overall size
plate_width = encoder_x + ec11_bushing / 2 + wall + 2.0;
plate_depth = grid_top + 2 * mx_pitch + wall;

// XIAO placed top-left, USB-C facing the rear wall (y = wall)
xiao_x = wall + 8.0;
xiao_y = wall;

// BOOT / RESET holes from the underside
xiao_button_holes = [
    [xiao_x + 3.0,  xiao_y + 2.0],
    [xiao_x + 18.2, xiao_y + 2.0]
];

// M2 bosses in the four corners
screw_positions = [
    [4, 4],
    [plate_width - 4, 4],
    [4, plate_depth - 4],
    [plate_width - 4, plate_depth - 4]
];
