include <CKvars.scad>;

CKp9(); //small bearing holder

module CKp9(){
    
    rez=p2number*p2needles*2;
    
    $fn=rez;
    
    translate([-(p3wallID+(p3upperwallW*2))/2,0,0]){
        

        
        difference(){

            cylinder(h=p9H,d=p3wallID+(p3upperwallW*2)+(p9thickness*2));            
            cylinder(h=p9H,d=p3wallID+(p3upperwallW*2));

          //first and last holes
        rotate([0,0,-(360/p2number/p2needles)*2]){
        translate([(p3wallID+(p3upperwallW*2)+(p9thickness*2))/2,0,p9H/2])

    rotate([0,270,0])
translate([0,0,0])
union(){
#cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
#cylinder(d=p2p3flatD,h=p9thickness+p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}
//            rotate([0,90,0]){
//                cylinder(h=(p3wallID+(p3upperwallW*2))+1, d=p2holeD, $fn=18);
//            }
        } 
        
        rotate([0,0,((360/p2number/p2needles)*2)]){
        translate([(p3wallID+(p3upperwallW*2)+(p9thickness*2))/2,0,p9H/2])

    rotate([0,270,0])
translate([0,0,0])
union(){
#cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
#cylinder(d=p2p3flatD,h=p9thickness+p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}
        } 
     //end first and last holes
        
       //outer holes
                 rotate([0,0,(-360/p2number/p2needles)]){
        translate([(p3wallID+(p3upperwallW*2)+(p9thickness*2))/2,0,p9H/2])

    rotate([0,270,0])
translate([0,0,0])
union(){
#cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
#cylinder(d=p2p3flatD,h=p9thickness+p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}
        } 
        
                         rotate([0,0,(360/p2number/p2needles)]){
        translate([(p3wallID+(p3upperwallW*2)+(p9thickness*2))/2,0,p9H/2])

    rotate([0,270,0])
translate([0,0,0])
union(){
#cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
#cylinder(d=p2p3flatD,h=p9thickness+p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}
        } 

//end outer holes        
        
        // cut off ends
        
                 rotate([0,0,-((-360/p2number/p2needles)+(1.4*-360/p2number/p2needles))]){
                     cube([(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2]);
                 }
                 
                 rotate([0,0,((-360/p2number/p2needles)+(1.4*-360/p2number/p2needles))]){
                     translate([0,-((p3wallOD+p9thickness)*2),0])
                     cube([(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2]);
                 }
                 
                 translate([-((p3wallOD+p9thickness)*2),-((p3wallOD+p9thickness)*2)/2,0])
                 #cube([(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2,(p3wallOD+p9thickness)*2]);
        
        
        } //end main difference
    } //end translate
} //end main module
