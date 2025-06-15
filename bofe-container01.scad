// Parámetros generales
diametro_exterior = 90;
altura_envase = 100;
grosor_pared = 3;
ajuste_tapa = 0.4; // Holgura para que la tapa entre sin atascarse
altura_tapa = 10;
$fn = 100; // suavidad de círculo

// ----------------------------------
// Envase
// ----------------------------------
color([0.349, 0.788, 0.647])
difference() {
    // Cuerpo exterior
    cylinder(h = altura_envase, r = diametro_exterior / 2);

    // Hueco interior
    translate([0, 0, grosor_pared])
        cylinder(h = altura_envase - grosor_pared, r = (diametro_exterior / 2) - grosor_pared);
}

// ----------------------------------
// Tapa a presión (ahora visible separada)
// ----------------------------------

// Desplazamos la tapa 20 mm arriba del envase para visualizarla
desfase_tapa = 40;

color([0.2, 0.6, 0.8])
translate([0, 0, altura_envase + desfase_tapa])
difference() {
    union() {
        // Disco exterior visible
        cylinder(h = altura_tapa, r = diametro_exterior / 2);

        // Reborde de presión
        translate([0, 0, -3])
            cylinder(h = 3, r = (diametro_exterior / 2) - grosor_pared + ajuste_tapa);
    }

    // Hueco interior de la tapa (opcional para aligerar)
    translate([0, 0, 0.5])
        cylinder(h = altura_tapa - 0.5, r = (diametro_exterior / 2) - grosor_pared);
}