// Parámetros del adaptador
largo_adaptador = 20;         // Largo total del adaptador
diametro_base = 6;            // Diámetro que encaja en la varilla
diametro_top = 8;             // Diámetro donde se apoya la cuchilla
altura_top = 3;               // Grosor del tope superior (para la cuchilla)
tornillo_diametro = 3;        // Diámetro del agujero lateral (M3)

// Adaptador
difference() {
    // Parte inferior cilíndrica (inserta en la varilla)
    union() {
        cylinder(h = largo_adaptador, d = diametro_base, $fn=100);
        translate([0,0,largo_adaptador])
            cylinder(h = altura_top, d = diametro_top, $fn=100);
    }

    // Agujero lateral para tornillo
    rotate([0,90,0])
        translate([-largo_adaptador/2, 0, diametro_base/2])
            cylinder(h = diametro_top+2, d = tornillo_diametro, $fn=50);
}
