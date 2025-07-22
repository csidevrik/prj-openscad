// Parámetros generales
varilla_largo = 500;        // Largo total
varilla_diametro = 6;
pico_largo = 10;            // Parte final de 3 mm
pico_diametro = 3;
base_top_diametro = 8;
base_top_altura = 2;

// Cuerpo principal de la varilla
cylinder(h = varilla_largo - pico_largo - base_top_altura, d = varilla_diametro, $fn = 100);

// Parte superior - tope (donde apoya la cuchilla)
translate([0, 0, varilla_largo - pico_largo - base_top_altura])
    cylinder(h = base_top_altura, d = base_top_diametro, $fn = 100);

// Parte superior - eje de 3 mm
translate([0, 0, varilla_largo - pico_largo])
    cylinder(h = pico_largo, d = pico_diametro, $fn = 100);
