// Parámetros
size_x = 90;
size_y = 90;
size_z = 200;
corner_radius = 10;
wall_thickness = 3;

diam_tapa = 70;
altura_tapa = 12;
ajuste_tapa = 0.3;
$fn = 100;

// --------------------
// Módulo para forma exterior rectangular redondeada
module rounded_box(x, y, z, r) {
    minkowski() {
        cube([x - 2*r, y - 2*r, z - r], center = true);
        cylinder(h = r, r = r, center = true);
    }
}

// --------------------
// Cuerpo del envase
color([0.349, 0.788, 0.647])
difference() {
    // Exterior rectangular
    rounded_box(size_x, size_y, size_z, corner_radius);

    // Hueco cilíndrico centrado
    translate([0, 0, wall_thickness])
        cylinder(h = size_z - wall_thickness, r = diam_tapa/2, center = true);
}

// --------------------
// Tapa circular desplazada
color([0.2, 0.6, 0.8])
translate([0, 0, size_z])
difference() {
    union() {
        // Disco superior
        cylinder(h = altura_tapa, r = diam_tapa/2);

        // Reborde que encaja en el hueco
        translate([0, 0, -3])
            cylinder(h = 3, r = (diam_tapa/2 - ajuste_tapa));
    }

    // Aligerar la parte interna de la tapa
    translate([0, 0, 0.5])
        cylinder(h = altura_tapa - 0.5, r = (diam_tapa/2 - wall_thickness));
}
