// Parámetros generales
size_x = 90;
size_y = 90;
size_z = 300;
corner_radius = 10;
pared_exterior = 2;

altura_tapa = 12;
ajuste_tapa = 0.3;
$fn = 100;

// Cálculo del radio del hueco y tapa
radio_hueco = (min(size_x, size_y) / 2) - pared_exterior;

// --------------------
// Módulo rectangular redondeado
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

    // Hueco cilíndrico más grande, más profundo
    translate([0, 0, pared_exterior])
        cylinder(h = size_z - pared_exterior * 1.5, r = radio_hueco);
}

// --------------------
// Tapa con forma exterior rectangular + reborde cilíndrico inferior
// --------------------
color([0.2, 0.6, 0.8])
translate([0, 0, size_z + 2])
difference() {
    union() {
        // Parte visible de la tapa con forma rectangular
        rounded_box(size_x, size_y, altura_tapa, corner_radius);

        // Reborde cilíndrico que encaja dentro del hueco
        translate([0, 0, -12])  // sobresale hacia abajo
            cylinder(h = 12, r = radio_hueco - ajuste_tapa);
    }

    // // Hueco de aligeramiento opcional
    // translate([0, 0, 0.5])
    //     cylinder(h = altura_tapa - 0.5, r = radio_hueco - pared_exterior);
}
