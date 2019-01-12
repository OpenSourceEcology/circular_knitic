include <CKvars.scad>;

use <CKneedle.scad>;

//use <CKp1.scad>;
use <CKp2--inner.scad>;
use <CKp3--outer.scad>;
use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
//use <CKp6--bigbearingholder.scad>;
use <CKp7--Zbearingholder.scad>;
use <CKp8--plateconnector.scad>;
use <CKp9--outerconnector.scad>;
use <CKpM--mountain.scad>;

use <CKc1--tabletop.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKc3--topplate.scad>;

//needle
rotate([90,0,0])
needle();

//mountain
translate([0,0,0])  //-c3OD/2
translate([0,p3wallOD/2,(pPspace1+pPplate1+pPspace2+pPplate2)-(pPspace2+pPplate2)])
rotate([0,0,0])
CKpM(0);

//c1
translate([-c1OD/2,0,-c1H])
CKc1();

//c2
translate([0,c3OD/2,pPspace1])
CKc2();

//c3
translate([0,c3OD/2,pPspace1+pPplate1+pPspace2])
CKc3();

//c4 - motor gear

//p2
for(i=[1:p2number]){
    rotate([0,0,i*(360/p2number)])
    translate([-p2OD/2,0,0])
    CKp2();
}

//p3
for(i=[1:p3number]){
    rotate([0,0,i*(360/p3number)])
    translate([-p3baseOD/2,0,0])
    CKp3();
}

//p4
for(i=[1:p4number]){
    rotate([0,0,i*(360/p4number)])
    translate([-(p4baseOD/2)+((p4baseW-p4basegapW)/2),0,0])
    CKp4();
}

//p5
for(i=[1:c2bmounts]){
    rotate([0,0,-((360/c2connectors)/2)+((360/c2bmounts)*i)]){
        translate([0,(pMID/2)+(pMgroove)+1,pPspace1]){  //close enough?
            mirror([0,0,1])
CKp5(); //small bearing holder
        }//end translate
    }//end rotate
}//end for

//p6 - depreicated?

//p7 Z
for(i=[1:c2bmounts]){
    rotate([0,0,-((360/c2connectors)/2)+((360/c2bmounts)*i)]){
        translate([0,(c3OD/2)+p7wallW-p7mountL,0]){  //close enough?
CKp7();
        }//end translate
    }//end rotate
}//end for

//p8
translate([0,0,pPspace1+pPplate1])
        for(i=[1:c2connectors]){
            rotate([0,0,((360/c2connectors)*i)]){
                translate([0,(pMID/2)+(pMgroove)+1+(p8baseL/2),0]){          
                        translate([0,-p8baseL/2,-0.1])
                        CKp8();
                }//end translate
            }//end rotate
        }//end for


//p9
for(i=[1:p3number]){
    rotate([0,0,i*(360/p3number)])
    translate([-p3baseOD/2,0,(p2holeH+p3baseH)+(p9H/2)])
    rotate([0,0,180])
    CKp9();
}//end for







