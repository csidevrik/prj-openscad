// Parámetros de la varilla
varilla_largo = 500;        // Largo de la varilla
varilla_diametro = 6;       // Diámetro de la varilla

// Cuerpo de la varilla
translate([0, 0, 0])
    cylinder(h = varilla_largo, d = varilla_diametro, $fn = 100);
