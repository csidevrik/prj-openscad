// === Parámetros del nuevo bloque abrazadera ===
largo_abrazadera = 7.2;
ancho_abrazadera = 3.0;
espesor_abrazadera = 3.0;

$fn = 100;

// === Módulo base abrazadera rectangular ===
module abrazadera_rectangular() {
    translate([-largo_abrazadera/2, -ancho_abrazadera/2, 0])
        cube([largo_abrazadera, ancho_abrazadera, espesor_abrazadera]);
}

// === Llamada al módulo
abrazadera_rectangular();
