include <helm_parameters.scad>

$fn = 64;

module m2_insert_2d() {
    circle(d = m2_insert);
}

module helm_bottom() {
    difference() {
        union() {
            // outer shell
            difference() {
                cube([plate_width, plate_depth, case_height]);
                translate([wall, wall, case_floor])
                    cube([plate_width - 2 * wall,
                          plate_depth - 2 * wall,
                          case_height - case_floor + 0.01]);
            }

            // M2 heat-set insert bosses
            for (p = screw_positions)
                translate([p[0], p[1], 0])
                    cylinder(h = case_height, d = 6);
        }

        // insert holes
        for (p = screw_positions)
            translate([p[0], p[1], -1])
                linear_extrude(height = case_height + 2)
                    m2_insert_2d();

        // XIAO RP2040 pocket (on the inside floor)
        translate([xiao_x, xiao_y, case_floor - xiao_pocket_depth])
            cube([xiao_w, xiao_d, xiao_pocket_depth + 0.01]);

        // USB-C slot through the rear wall
        translate([xiao_x + xiao_w / 2 - usb_w / 2, -1, case_floor - xiao_pocket_depth])
            cube([usb_w, wall + 2, usb_h]);

        // BOOT / RESET pin holes from the underside
        for (p = xiao_button_holes)
            translate([p[0], p[1], -1])
                cylinder(h = case_floor + 2, d = 1.5);

        // encoder body clearance well
        translate([encoder_x, encoder_y, -1])
            cylinder(h = case_floor + 2, d = ec11_body + 2);
    }
}

render() helm_bottom();
