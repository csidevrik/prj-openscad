// Parámetros de la cuchilla
cuchilla_espesor = 1.5;
cuchilla_ancho = 8;
cuchilla_largo = 35;
cuchilla_curvatura = 10;

// Función para crear una pala curva (una hélice)
module cuchilla() {
    difference() {
        union() {
            translate([-cuchilla_largo/2, -cuchilla_espesor/2, 0])
                cube([cuchilla_largo, cuchilla_espesor, cuchilla_ancho]);

            // Segunda ala (cruz)
            rotate([0, 0, 90])
                translate([-cuchilla_largo/2, -cuchilla_espesor/2, 0])
                    cube([cuchilla_largo, cuchilla_espesor, cuchilla_ancho]);
        }

        // Orificio central
        translate([0, 0, -1])
            cylinder(h = cuchilla_ancho + 2, d = pico_diametro, $fn = 50);
    }
}

// Posicionarla encima del tope
translate([0, 0, varilla_largo - pico_largo + 1])
    cuchilla();
