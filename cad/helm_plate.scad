include <helm_parameters.scad>
$fn = 48;

module rounded_rect(w, d, r) {
    hull() {
        for (x = [r, w - r], y = [r, d - r])
            translate([x, y, 0]) circle(r = r);
    }
}

module mx_hole_2d() {
    offset(r = mx_corner_r)
        square(mx_cutout - 2 * mx_corner_r, center = true);
}

module helm_plate() {
    difference() {
        linear_extrude(height = plate_thickness)
            rounded_rect(plate_width, plate_depth, corner_r);

        for (x = key_centers_x, y = key_centers_y) {
            translate([x, y, -0.1])
                linear_extrude(height = plate_thickness + 0.2)
                    mx_hole_2d();
            // 5-pin plastic legs
            for (dx = [-mx_peg_x, mx_peg_x])
                translate([x + dx, y, -1])
                    cylinder(h = plate_thickness + 2, d = mx_peg_d);
        }

        translate([encoder_x, encoder_y, -1])
            cylinder(h = plate_thickness + 2, d = ec11_bushing);

        for (p = screw_positions)
            translate([p[0], p[1], -1])
                cylinder(h = plate_thickness + 2, d = m2_through);

        for (p = align_positions)
            translate([p[0], p[1], -1])
                cylinder(h = plate_thickness + 2, d = align_pin_d + 0.2);
    }
}

helm_plate();
