include <CKvars.scad>;

CKp2();

module CKp2(){
    
    rez=p2number*p2needles*2;
    $fn=rez; //defines resolution of circles.

    translate([p2OD/2,0,0]){    
    difference(){    
union(){
    difference(){
    cylinder(h=p2H,d=p2OD);
    cylinder(h=p2H,d=p2ID);
    }
        for(i=[0:p2needles+1]){
        rotate([0,0,i*-360/p2number/p2needles])
        translate([-(p2ID/2)-0.1,0,p2holeH-p3base45H])
        rotate([0,90,0])
        cylinder(h=p2p3flatD/6, d1=p2p3nutOD+p2p3flatD, d2=p2p3nutOD,$fn=36);
    } 
}
    translate([-p2OD/2,-p2OD/2,0]){    
        cube([p2OD,p2OD/2,p2H]); //trim side
    }
    rotate([0,0,-360/p2number]){
        translate([-p2OD/2,0,0])    
        cube([p2OD,p2OD/2,p2H]); //trim other side       
    }
    for(i=[1:p2needles]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
            translate([-p2OD/2-0.2,-needleWidth/2,0])
            #cube([p2needlegrooveDepth+0.2,needleWidth,p2H]);
        }
    }
    
//trim inside corners of needle groove
    for(i=[1:p2needles]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
            translate([-p2OD/2-0.2+p2needlegrooveDepth+0.2,0,0])
            scale([0.5,1,1])
            #cylinder(d=needleWidth,h=p2H);
        }
    }
    
//trim outer corners of needle groove
    for(i=[1:p2needles]){
        rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
            translate([(needleWidth/2)-p2OD/2-0.2,-needleWidth/2,0])
            rotate([0,0,90+11.25])
            cube([needleWidth/2,needleWidth,p2H+.1]);  
            translate([(needleWidth/4)-p2OD/2-0.2,-needleWidth/2,0])
            rotate([0,0,90+67.5])
            cube([needleWidth/2,needleWidth,p2H+.1]);
            mirror([0,1,0]){
            translate([(needleWidth/2)-p2OD/2-0.2,-needleWidth/2,0])
            rotate([0,0,90+11.25])
            cube([needleWidth/2,needleWidth,p2H+.1]);  
            translate([(needleWidth/4)-p2OD/2-0.2,-needleWidth/2,0])
            rotate([0,0,90+67.5])
            cube([needleWidth/2,needleWidth,p2H+.1]);
            }

        }
    }

//chamfer bottom
    cylinder(h=0.5,d1=p2ID+0.5,d2=p2ID);      

   difference(){  
    cylinder(h=0.5,d=p2OD+1);
    cylinder(h=0.5,d1=p2OD-0.5,d2=p2OD);      
   }

//chamfer top
   translate([0,0,p2H-0.5])
    cylinder(h=0.5,d1=p2ID,d2=p2ID+0.5);      
   translate([0,0,p2H-0.5])
   difference(){  
    cylinder(h=0.5,d=p2OD+1);
    cylinder(h=0.5,d1=p2OD,d2=p2OD-0.5);      
   }



    for(i=[0:p2needles+1]){
        rotate([0,0,i*-360/p2number/p2needles])
        translate([-p2OD/2-0.2,0,p2holeH-p3base45H])
        rotate([0,90,0])
        cylinder(h=p2OD-p2ID+0.2, d=p2p3flatD,$fn=36);
    }
        
               

echo(((((360/p2number/p2needles/2)/360*(p2OD*PI))-(needleWidth/2))/((360/p2number/p2needles/2)/360*(p2OD*PI)))*(360/p2number/p2needles/2));
        
//firstcenter=(((((360/p2number/p2needles/2)/360*(p2OD*PI))-(needleWidth/2))/((360/p2number/p2needles/2)/360*(p2OD*PI)))*(360/p2number/p2needles/2))/2; not using         

        //end hole
        
        //p4 mount holes
        // 1st p4 mount hole
        rotate([0,0,-(360/p2number/p2needles)*2]){
        translate([-p2OD/2-0.2,0,p2H-(p4basegapH-p4holeH)])
            rotate([0,90,0]){
                cylinder(h=p2OD-p2ID+0.2, d=p2p4flatD,$fn=36);
            }
        } 
        
        //2nd p4 mount hole
        // 2nd hole
        rotate([0,0,-(360/p2number/p2needles)*3]){
        translate([-p2OD/2-0.2,0,p2H-(p4basegapH-p4holeH)])
            rotate([0,90,0]){
                #cylinder(h=p2OD-p2ID+0.2, d=p2p4flatD,$fn=36);
            }
        } 

        //end p4 mount holes


//trim end of part

if(p2number>1){
    rotate([0,0,-(360/(p2OD*PI/p2endtrim))])
 mirror([1,1,0])
 #cube([p2OD/2,p2OD/2,p2H]);   
    
}


} //end main difference
} //end main translate    
} //end module