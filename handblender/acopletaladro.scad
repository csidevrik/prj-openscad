// Parámetros
acople_largo = 30;         // Largo total del acople
acople_diametro = 10;      // Diámetro externo
varilla_diametro = 6;      // Diámetro de la varilla a insertar
orificio_tornillo = 4;     // Orificio para tornillo pasante (M4)

// Cuerpo del acople
difference() {
    // Cilindro principal
    cylinder(h = acople_largo, d = acople_diametro, $fn = 100);

    // Hueco para la varilla
    translate([0, 0, 0])
        cylinder(h = acople_largo, d = varilla_diametro, $fn = 100);

    // Orificio pasante lateral para tornillo
    rotate([0, 90, 0])
        translate([-acople_largo/2, 0, 0])
            cylinder(h = acople_diametro + 2, d = orificio_tornillo, $fn = 50);
}
