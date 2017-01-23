$fn = 40;
thickness = 2;
spoolThickness = 3;
rimRadius = (50-2*8+4)/2;
overlap = 7.5;
spoolWidth = 26;
spoolRadiusBase = 26/2;
spoolRadiusTop = 25/2;
halfSpoolHeight = thickness+spoolWidth/2;
tolerance = 0.4;

module baseSpool() {
    difference() {
        union() {
            cylinder(r=rimRadius,h=thickness);
            cylinder(r1=spoolRadiusBase,r2=spoolRadiusTop,h=halfSpoolHeight);
        }
    cylinder(r1=spoolRadiusBase-spoolThickness,r2=spoolRadiusTop-spoolThickness,h=halfSpoolHeight);
    }
}



baseSpool();
translate([0,0,halfSpoolHeight]) {
    difference() {
        cylinder(r=spoolRadiusTop, h=overlap);
        cylinder(r=spoolRadiusTop-spoolThickness/2 + tolerance, h=overlap);
    }
}

translate([40, 0, 0]) {
    baseSpool();
    translate([0,0,halfSpoolHeight]) {
        difference() {
            cylinder(r=spoolRadiusTop-spoolThickness/2-tolerance, h=overlap);
            cylinder(r=spoolRadiusTop-spoolThickness, h=overlap);
        }
    }
}
