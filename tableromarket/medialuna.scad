$fn = 100;

// === Paso 1: Bloque con hueco (como antes)
module bloque_con_hueco() {
    difference() {
        // Bloque
        translate([-3.6, 0, 0])
            cube([7.2, 3.0, 3.0]);

        // Hueco interior
        translate([2.1, 1.5, 0])
            cylinder(h = 3.0, r = 1.0, center = false);
    }
}

// === Paso 2: Media luna exterior (cilindro grande menos el bloque)
module media_luna_exterior() {
    difference() {
        // Cilindro exterior completo
        translate([2.1, 1.5, 0])
            cylinder(h = 3.0, r = 1.5, center = false);

        // Le restamos el bloque completo con hueco
        bloque_con_hueco();
    }
}

// === Ensamblaje final
bloque_con_hueco();      // Dibuja el cuerpo principal
color("green")
    media_luna_exterior();  // Dibuja la parte curva superior (media luna)
