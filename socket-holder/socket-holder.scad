$fn = 64;
d1 = 17.8;
d2 = 14.4;
d3 = 12;
d4 = 12;
d5 = 12;
tol = 0.3;
socketH=20;
sep = 1.2;
outerWall = 1.5;
dOfs=3*tol;
length = d1 + d2 + d3 +d4 +d5 + 4 * sep + 2*outerWall;

module ridge(d) {
    translate([(d+dOfs)/2, 0, 0]) { 
        scale([1, 2, 1]) {cylinder(d = dOfs, h=socketH, $fn=20);}
    }
}

module socketHolder(d) {
    difference() {
    cylinder(d=d+dOfs, h=socketH);
    union() {
        for (a = [0:45:315]) {
            rotate([0, 0, a]){ridge(d=d);};
        }
    }
    }
}

module sockets() {
    socketHolder(d1);

    translate([d1/2+ d2/2 + sep,0 ,0]) {
        socketHolder(d2);
    }

    translate([d1/2+ d2 + d3/2 + 2*sep,0 ,0]) {
        socketHolder(d3);
    }

    translate([d1/2+ d2 + d3 + d4/2 + 3*sep,0 ,0]) {
        socketHolder(d4);
    }

    translate([d1/2+ d2 + d3 + d4 + d5/2 + 4*sep,0 ,0]) {
        socketHolder(d5);
    }
}

module baseBody(w1, w2, l, h, r) {
hull() {
translate([r, -w1/2 + r,0]) {cylinder(r=r, h=h);};
translate([r, w1/2 - r,0]) {cylinder(r=r, h=h);};
translate([l - r, -w2/2 + r,0]) {cylinder(r=r, h=h);};
translate([l - r, w2/2 - r,0]) {cylinder(r=r, h=h);};
}
}

difference() {
baseBody(d1+ 2*outerWall, 15, length, 15, 5);
translate([d1/2+outerWall, 0, 3]) {sockets();}
}
