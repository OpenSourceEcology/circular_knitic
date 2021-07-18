include <CKvars.scad>;

use <CKneedle.scad>;

use <CKp1--motor_gear.scad>;
use <CKp2--inner.scad>;
use <CKp3--outer.scad>;
use <CKp4--yardHolder.scad>;
use <CKp5--smallbearingholder.scad>;
use <CKp7--Zbearingholder.scad>;
use <CKp8--plateconnector.scad>;
use <CKp9--outerconnector.scad>;
use <CKpM1--mountain.scad>;

use <CKc1--tabletop.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKc3--topplate.scad>;

//needle
rotate([0,0,0]){  //-(360/p2number*p2needles)/2
    
translate([0,0,-nB+(pPspace1+pPplate1)])
rotate([0,0,-((360/p2number/p2needles)*3.5)+((360/p4number))])  //(360/(p2number*p2needles))*1
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC1-nC)])
rotate([0,0,((360/(p2number*p2needles))*1)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
    

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC1-nC)])
rotate([0,0,-((360/(p2number*p2needles))*1)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();    
/*
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC2-nC)])
rotate([0,0,((360/(p2number*p2needles))*2)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,((360/(p2number*p2needles))*3)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,((360/(p2number*p2needles))*4)-((360/p2number/p2needles)*3.5)+((360/p4number))])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
*/
}


/*
//c1
translate([0,0,-c1H])
CKc1();



//p1 - motor gear
rotate([0,0,0])
translate([0,-(CKp1_pitch_radius+CKc2_pitch_radius),1])
CKp1();


*/
//p2 - inner wall needle guide
for(i=[1:1]){
    rotate([0,0,i*(360/p2number)])
    translate([-p2OD/2,0,p3base45H])
    CKp2();
}



//p3 - outer wall
for(i=[1:1]){
    rotate([0,0,i*(360/p3number)])
    translate([-p3baseOD/2,0,0])
    CKp3();
}

//p9 - connector for p3
for(i=[1:1]){
    rotate([0,0,i*(360/p3number)])
    translate([-(p3wallID+(p3upperwallW*2))/2,0,(p2holeH)-(p9H/2)])
    rotate([0,0,180])
    CKp9();
}//end for



//p4 - yard holder at top
for(i=[1:1]){
    rotate([0,0,-((360/p2number/p2needles)*3.5)+(i*(360/p4number))])
    translate([-(p4baseOD/2),0,p3base45H+p2H-p4basegapH])
    CKp4();
}


/*
//p7 Z
        for(i=[0:(p7number/2)-1]){
    rotate([0,0,45-((90/((p7number/2)-1))*i)]){
        translate([0,(c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW,0]){  //close enough?
//trans Y old : (c3OD/2)-((p7mountL-p7wallW)/2)-((bearingholderZBW+p7wiggleL)/2)-(p7wiggleL/2)
CKp7(1);
        }//end translate
    }//end rotate
}//end for

mirror([0,1,0])
        for(i=[0:(p7number/2)-1]){
    rotate([0,0,45-((90/((p7number/2)-1))*i)]){
        translate([0,(c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW,0]){  //close enough?
//trans Y old : (c3OD/2)-((p7mountL-p7wallW)/2)-((bearingholderZBW+p7wiggleL)/2)-(p7wiggleL/2)
CKp7(1);
        }//end translate
    }//end rotate
}//end for



//////////////////
//ROTATING SECTION

rotate([0,0,360/c2connectors/2]){

//c2
translate([0,c3OD/2,pPspace1])
CKc2();

//c3
translate([0,c3OD/2,pPspace1+pPplate1+pPspace2])
CKc3();

//p5 - small bearing holder
for(i=[1:c2bmounts]){
    rotate([0,0,((360/c2connectors)*1.5)+((360/c2bmounts)*i)]){
        translate([0,(p3baseOD/2)+1,pPspace1]){ 
            mirror([0,0,1])
CKp5(1); //small bearing holder
        }//end translate
    }//end rotate
}//end for

    //small bearing holder - under mountain
    rotate([0,0,0]){
        translate([0,(p3baseOD/2)+1,pPspace1]){
            mirror([0,0,1])
CKp5(1); //small bearing holder
        }//end translate
    }//end rotate

//p8
translate([0,0,pPspace1+pPplate1])
        for(i=[1:c2connectors-1]){
            rotate([0,0,((360/c2connectors)*i)]){
                translate([0,(pMID/2)+(pMgroove)+1+(p8baseL/2),0]){          
                        translate([0,-p8baseL/2,-0.1])
                        CKp8();
                }//end translate
            }//end rotate
        }//end for


//mountain
translate([0,0,0])
translate([0,p3wallOD/2,(pPspace1+pPplate1+pPspace2+pPplate2)-(pPspace2+pPplate2)])
rotate([0,0,0])
CKpM(0,1,1);


//((360/(p2number*p2needles))*3)-((360/p2number/p2needles)*3.5)+((360/p4number))
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))])
rotate([0,0,-90])
translate([(-p3wallID/2)+(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

    } //end rotate
    //END ROTATING SECTION
    //////////////////////
*/    
    