$fn = 64;
thickness = 2;
spoolThickness = 3;
rimRadius = (50-2*8+4)/2;
overlap = 7.5;
spoolWidth = 26;
spoolRadiusBase = 25.8/2;
spoolRadiusTop = 25/2;
halfSpoolHeight = spoolWidth/2;
tolerance = 0.3;

module baseSpool() {
    difference() {
    difference() {
        union() {
            difference() {
            cylinder(r=rimRadius,h=thickness);
            translate([0, 0, -thickness]) { cylinder(r=spoolRadiusBase-spoolThickness, h=3*thickness); };
            }
            translate([0, 0, thickness]) {cylinder(r1=spoolRadiusBase,r2=spoolRadiusTop,h=halfSpoolHeight);}
        }
    translate([0, 0, thickness]) {cylinder(r1=spoolRadiusBase-spoolThickness,r2=spoolRadiusTop-spoolThickness,h=halfSpoolHeight);}
    }

}
}



baseSpool();
translate([0,0,halfSpoolHeight + thickness]) {
    difference() {
        cylinder(r=spoolRadiusTop, h=overlap);
        cylinder(r=spoolRadiusTop-spoolThickness/2, h=overlap+5);
    }
}

translate([40, 0, 0]) {
    baseSpool();
    translate([0,0,halfSpoolHeight+thickness]) {
        difference() {
            cylinder(r=spoolRadiusTop-spoolThickness/2-tolerance, h=overlap);
            cylinder(r=spoolRadiusTop-spoolThickness, h=overlap+5);
        }
    }
}
