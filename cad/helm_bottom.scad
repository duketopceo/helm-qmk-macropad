include <helm_parameters.scad>
$fn = 40;

module wedge_solid(xy_inset) {
    r = max(0.4, corner_r - xy_inset);
    w = plate_width - 2 * xy_inset;
    d = desk_depth - 2 * xy_inset;
    hull() {
        for (x = [r, w - r], y = [r, d - r]) {
            translate([xy_inset + x, xy_inset + y, r])
                sphere(r = r);
            zt = z_top(xy_inset + y) - r;
            translate([xy_inset + x, xy_inset + y, zt])
                sphere(r = r);
        }
    }
}

module helm_bottom() {
    difference() {
        union() {
            difference() {
                wedge_solid(0);
                translate([0, 0, case_floor])
                    wedge_solid(wall);
            }

            // bosses stay inside the wedge
            intersection() {
                wedge_solid(0);
                union() {
                    for (p = screw_positions)
                        plate_to_world()
                            translate([p[0], p[1], -12])
                                cylinder(h = 12, d = boss_d);
                }
            }

            for (p = align_positions)
                plate_to_world()
                    translate([p[0], p[1], 0])
                        cylinder(h = align_pin_h, d = align_pin_d);
        }

        for (p = screw_positions)
            plate_to_world()
                translate([p[0], p[1], -m2_insert_h])
                    cylinder(h = m2_insert_h + 0.3, d = m2_insert);

        translate([xiao_x, xiao_y, case_floor - xiao_pocket_depth])
            cube([xiao_w, xiao_d * cos(desk_angle), xiao_pocket_depth + 0.2]);

        translate([xiao_x + xiao_w / 2 - usb_w / 2, -1, usb_z])
            cube([usb_w, wall + 2, usb_h]);

        translate([xiao_x + xiao_w / 2 - zip_w / 2, -1, usb_z + usb_h + 1.5])
            cube([zip_w, wall + 2, zip_h]);

        intersection() {
            translate([0, 0, case_floor + 0.5])
                cube([plate_width, desk_depth, rear_h]);
            plate_to_world()
                translate([encoder_x, encoder_y, -25])
                    cylinder(h = 25, d = ec11_body + 1.5);
        }

        for (p = foot_positions)
            translate([p[0], p[1], -0.01])
                cylinder(h = foot_h + 0.01, d = foot_d);
    }
}

helm_bottom();
