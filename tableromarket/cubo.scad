// $fn = 100;
// translate([-3.6,0,0])
// cube([7.2, 3.0, 3.0]);

// $fn = 100;
// color([0.349, 0.788, 0.647])
// translate([2.1,1.5,0])
//     cylinder(h=3.0,r=1, center=false);


$fn = 100;

difference() {
    // 🔶 Sólido principal: el bloque rectangular
    translate([-3.6, 0, 0])
        cube([7.2, 3.0, 3.0]);

    // 🔷 Sólido a restar: el cilindro
    color([0.349, 0.788, 0.647])  // solo visual
    translate([2.1, 1.5, 0])
        cylinder(h = 3.0, r = 1, center = false);
}