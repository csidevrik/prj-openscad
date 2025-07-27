// ===============================
// Pieza: eje_pata
// Función: Sirve como eje para las patas abatibles del tablero
// Autor: Carlos & ChatGPT
// ===============================

// Parámetros principales
// altura_cuerpo = 3.7;
// ancho_cuerpo = 3.0;
// profundidad_cuerpo = 2.0;

// radio_semicirculo = 1.5;
// altura_semicirculo = radio_semicirculo;

// radio_cilindro = 1.5;
// largo_cilindro = 7.0; // total, sobresale a ambos lados

// radio_agujero = 1.0; // para insertar la pata

// $fn = 100; // suavizado

// // ===============================
// // Módulo principal
// module eje_pata() {
    
//     // --- Parte rectangular ---
//     cube([ancho_cuerpo, profundidad_cuerpo, altura_cuerpo]);

//     // --- Parte superior semicilíndrica ---
//     translate([0, 0, altura_cuerpo])
//         cylinder(h=altura_semicirculo, r=radio_semicirculo);

//     // --- Cilindro horizontal que atraviesa la pieza ---
//     translate([-largo_cilindro/2 + ancho_cuerpo/2, profundidad_cuerpo/2, altura_cuerpo - 2.2])
//         rotate([0, 90, 0])
//             cylinder(h=largo_cilindro, r=radio_cilindro);

//     // --- Agujero interno para insertar la pata ---
//     translate([-largo_cilindro/2 + ancho_cuerpo/2, profundidad_cuerpo/2, altura_cuerpo - 2.2])
//         rotate([0, 90, 0])
//             cylinder(h=largo_cilindro, r=radio_agujero);
// }

// // Llamada al módulo
// eje_pata();


//////
// ===============================
// Pieza: eje_pata
// Función: Sirve como eje para las patas abatibles del tablero
// Autor: Carlos & ChatGPT
// ===============================


// ==========================
// Parámetros configurables
// ==========================
radio_eje = 1.0;       // 1 cm = diámetro 2 cm
largo_eje = 7.0;       // 7 cm de largo
$fn = 100;             // suavidad del cilindro

// ==========================
// Módulo de eje horizontal
// ==========================
module eje_horizontal() {
    rotate([90, 0, 0])  // gira para alinearse con eje Y
        cylinder(h = largo_eje, r = radio_eje, center = true);
}

// Llamada al módulo
eje_horizontal();

// $fn = 100; // suavizado

// module aro_sobre_eje() {
//     difference() {
//         // Círculo exterior (diámetro 2 cm, radio 1 cm)
//         translate([0, 0, 0])
//             cylinder(h=2.0, r=1.0, center=true);

//         // Agujero interior (diámetro 1 cm, radio 0.5 cm)
//         translate([0, 0, 0])
//             cylinder(h=2.0 + 0.1, r=0.5, center=true); // +0.1 para evitar que quede una capa delgada
//     }
// }

// // Llamada al módulo
// translate([90, 0, 0]) // Eleva el aro para que quede centrado en el eje
//     aro_sobre_eje();
