// === Parámetros ===
radio_exterior_abrazadera = 1.5;
radio_interior_abrazadera = 1;
profundidad_abrazadera = 3.0;

$fn = 100; // suavidad

// === Módulo de abrazadera (aro hueco) ===
module aro_abrazadera() {
    difference() {
        // Cilindro exterior
        cylinder(h = profundidad_abrazadera, r = radio_exterior_abrazadera, center = true);

        // Hueco interior
        cylinder(h = profundidad_abrazadera + 0.1, r = radio_interior_abrazadera, center = true);
    }
}

// === Mostrar eje y abrazadera juntos ===
module eje_horizontal() {
    rotate([90, 0, 0])
        cylinder(h = 7.0, r = 1.0, center = true);
}

// Ensamblaje: aro abrazadera + eje
eje_horizontal();
 // Rota para que el aro quede en la posición correcta    translate([0, 5, 0]) // Ajusta la posición del aro
translate([0, 0, 0])
    rotate([90, 0, 0])
        aro_abrazadera();
