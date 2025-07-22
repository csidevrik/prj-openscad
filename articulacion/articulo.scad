// Parámetros
r_i = 1.2;                          // radio interior del agujero principal
espesor_pared = 1.0;               // margen
r_e = r_i + espesor_pared;

altura = 2;
profundidad = r_e * 2;
ancho_cubo = r_e * 1.5;

radio_eje_horizontal = 0.4;             // radio del nuevo agujero horizontal
distancia_segura = 0.4;                 // separación entre el final del agujero horizontal y el agujero vertical

$fn = 100;

// Calculamos cuánto puede entrar el agujero horizontal sin tocar el vertical
profundidad_horizontal = (profundidad / 2) - r_e - distancia_segura;

difference() {
    union() {
        // Parte cilíndrica (hueca)
        difference() {
            translate([ancho_cubo, profundidad / 2, 0])
                cylinder(h = altura, r = r_e);
            translate([ancho_cubo, profundidad / 2, -1])
                cylinder(h = altura + 2, r = r_i);
        }

        // Parte cúbica
        cube([ancho_cubo, profundidad, altura]);
    }

    // Agujero horizontal exacto (como en la imagen)
    translate([ancho_cubo / 2, 0, altura / 2])
        rotate([0,90,0])
            cylinder(h = profundidad_horizontal, r = radio_eje_horizontal);
}
