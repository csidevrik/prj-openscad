// Parámetros
cuchilla_largo = 35;
cuchilla_ancho = 6;
cuchilla_espesor = 1.5;
curvatura_angulo = 25;
centro_altura = 0.5;
orificio_diametro = 3;

module pala_inclinada() {
    rotate([curvatura_angulo, 0, 0])
        translate([-cuchilla_largo/2, -cuchilla_ancho/2, 0])
            cube([cuchilla_largo, cuchilla_ancho, cuchilla_espesor]);
}

module cuchilla_doble() {
    difference() {
        union() {
            // Pala 1
            pala_inclinada();

            // Pala 2 rotada 90°
            rotate([0, 0, 90])
                pala_inclinada();
        }

        // Orificio central
        translate([0, 0, -1])
            cylinder(h = cuchilla_espesor + 2, d = orificio_diametro, $fn=60);
    }
}

// Posicionar la cuchilla sobre el eje
translate([0, 0, 502])  // Alineado a tope de la varilla (500 + tope + pico)
    cuchilla_doble();
