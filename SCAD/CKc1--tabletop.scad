include <CKvars.scad>;
use <CKc2--bottom_surface_motor_gears.scad>;
use <CKp1--motor_gear.scad>;

CKc1();

translate([(c1OD/2),0,c1H+1])
rotate([0,0,0])
translate([-(CKp1_pitch_radius+CKc2_pitch_radius),0,0])
CKp1();


module CKc1(){
    
echo("c2c of gears",CKp1_pitch_radius+CKc2_pitch_radius);    
    
    rez=p2number*p2needles*2;  //calculate desired rezolution
    $fn=rez; //defines resolution of circles.
    
translate([c1OD/2,0,0]){            
    difference(){  
        
        union(){
//octogon
   fudge = 1/cos(180/(8));
   rotate([0,0,360/8/2])         
   cylinder(h=c1H,r=(c1OD/2)*fudge,$fn=(8));
//            cylinder(h=c1H,d=c1OD);
        } //end main union
        
        cylinder(h=c1H+2,d=p3baseID);  // donut hole
 
    //base needle holes
    ////should these be circles instead? easier to cut? slot with rounded ends?
    
        for(i=[1:p2needles*p2number]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
        translate([-p2OD/2,-needleWidth/2,-0.01])
            {
            cube([p2needlegrooveDepth,needleWidth,p3wallH+0.02]);
                translate([0,needleWidth/2,0])
            cylinder(h=c1H+2,d=needleWidth,$fn=36);
                translate([p2needlegrooveDepth,needleWidth/2,0])
            cylinder(h=c1H+2,d=needleWidth,$fn=36);
        }
        }   //end rotate
    }   //end for
    
    //base mounting holes

        //p3 - "outer" holes
        for(i=[1:p3baseholenumber*p3number]){
            rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
            translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
                cylinder(h=c1H+2,d=p3baseholeD,$fn=18);
            }   //end rotate
        }    //end outer hole set for   
        
        //Z bearing mount holes
        for(i=[1:c2bmounts]){
    rotate([0,0,((45)+((360/c2bmounts)*i))]){
        translate([0,(c3OD/2)-p7bearingfromfront-(p7wiggleL/2)-bearingholderZBW,0]){  //close enough?
                translate([-p7baseW/2,0,0]){
                // hole 1
            translate([p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);        
        // hole 2
            translate([p7baseW-p7mounthole2edge,p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);
        // hole 3
            translate([p7baseW/2,p7baseL-p7mounthole2edge,0])
            cylinder(d=p7mountholeOD,h=c1H+0.1,$fn=36);        
                }//end translate
                }//end translate
    }//end rotate
}//end for

        //Stepper Mount
rotate([0,0,0])
translate([-(CKp1_pitch_radius+CKc2_pitch_radius),0,0]){
cylinder(d=NEMAfaceCricOD+0.25,h=c1H);
translate([NEMAboltDis/2,NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
translate([-NEMAboltDis/2,NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
translate([NEMAboltDis/2,-NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
translate([-NEMAboltDis/2,-NEMAboltDis/2,0])
    cylinder(d=NEMAboltOD,h=c1H);
    
    
}

//mounting wood beams
for(i=[1:8]){
    rotate([0,0,360/8*i]){
translate([-(c1OD/2)+(woodbeamW/2),0,0])
cylinder(d=woodbeamScrewOD,h=c1H);
translate([-(c1OD/2)+(woodbeamW/2),tan(360/8/2)*(-(c1OD/2)+(woodbeamW/2))+(woodbeamW),0])
cylinder(d=woodbeamScrewOD,h=c1H);
translate([-(c1OD/2)+(woodbeamW/2),tan(360/8/2)*((c1OD/2)-(woodbeamW/2))-(woodbeamW),0])
cylinder(d=woodbeamScrewOD,h=c1H);

    }
    }
        
        
    }  //end main difference
}  //end main translate

} //end CKc1 module