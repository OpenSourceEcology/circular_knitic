include <CKvars.scad>;

CKp4();


module CKp4(){
    
    rez=p2number*p2needles*2;
    
    $fn=rez; //defines resolution of circles.
       
    translate([p4baseOD/2,0,0]){
        
    difference(){  
        union(){
    cylinder(h=p4baseH,d=p4baseOD-(p4basegapW*2)-((p4baseW-p4basegapW)/2*2));            
            
            //ramps
           
            
            for(i=[1:p2needles*(p2number/p4number)]){
        rotate([0,0,(360/p2number/p2needles)-(360/p2number/p2needles*i)-(((360/p2number/p2needles))/2)]){        
           

            
            difference(){
            minkowski(){
            union(){
            translate([-p4baseOD/2+p4rampfromOD,p4rampWm/2,p4rampH+p4baseH-(p4rampC1/2)])
            rotate([90,0,0])
            cylinder(h=p4rampWm,d=p4rampC1);
            
            intersection(){
            translate([-10,0,3.82])
            translate([-p4baseOD/2+p4rampfromOD,p4rampWm/2,p4rampH+p4baseH-(p4rampC2/2)])
            rotate([90,0,0])
            cylinder(h=p4rampWm,d=p4rampC2);
                
                            translate([-7,0,-2.86/2])
            translate([-p4baseOD/2+p4rampfromOD,p4rampWm/2,p4rampH+p4baseH-(p4rampC2/2)])
            cube([p4rampC2,p4rampC2,p4rampC2],center=true);
            
            }
        }//end union
        
difference(){
translate([-p4rampMinkD/2,0,0])
cylinder(d=p4rampMinkD,h=0.01, $fn=36);
translate([-p4rampMinkD,0,-0.01])
cube([p4rampMinkD,p4rampMinkD,0.02], center=true);    
} //end diff

} //end mink
        
       translate([-p4rampC2/2,0,0])
       translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4rampH+p4baseH-(p4rampC2/2)])
       cube([p4rampC2,p4rampC2,p4rampC2+1],center=true);
        
       translate([0,0,0])
       translate([-p4baseOD/2+p4rampfromOD,p4rampW/2,p4baseH-(p4rampC2/2)-0.1])
      cube([p4rampC2,p4rampC2,p4rampC2],center=true);  
  
        
               translate([0,-p4clawW/2,0])
       translate([-(p4baseID/2)-p4rampfromID,0,p4baseH])
        cube([(p4baseID/2)+p4rampfromID,p4clawW,p4rampoverhangH]);
        
            translate([-7,0,0])
            translate([-p4baseOD/2+p4rampfromOD,(p4rampW/2)+(p4rampC2/2)-0.01,p4rampH+p4baseH-(p4rampC2/2)])
            cube([p4rampC2,p4rampC2,p4rampC2],center=true);
        
        translate([-7,0,0])
            translate([-p4baseOD/2+p4rampfromOD,-(p4rampW/2)-(p4rampC2/2)+0.01,p4rampH+p4baseH-(p4rampC2/2)])
            cube([p4rampC2,p4rampC2,p4rampC2],center=true);
        
        
    }//end ramps difference
    

    
} //end for rotate
    
} //end for


    
            //claws
            
        for(i=[1:p2needles*(p2number/p4number)]){
        rotate([0,0,(360/p2number/p2needles)-(360/p2number/p2needles*i)-(((360/p2number/p2needles))/2)]){
            hull(){
            translate([-p4baseOD/2,-p4clawW/2,0])
              #cube([(p4baseOD-p4baseID)/2,p4clawW,p4basegapH]);
            translate([-p4baseOD/2,-((p4rampW+p4clawWslanttop)/2),p4baseH-0.1])
              #cube([(p4baseOD-p4baseID)/2,p4rampW+p4clawWslanttop,0.1]);

            } //end hull
        }
    }//end for
            
        } //end main union
    cylinder(h=p4baseH,d=p4baseID);
    
    //simiple chamfer of inside corner    
    translate([0,0,p4baseH-0.5])
    cylinder(h=0.5,d1=p4baseID+0.5,d2=p4baseID+1.9);    
    translate([0,0,p4baseH-0.5-0.5])
    cylinder(h=0.5,d1=p4baseID,d2=p4baseID+0.5);    

        
    translate([-p4baseOD/2,-p4baseOD/2,0]){    
    cube([p4baseOD,p4baseOD/2,p4baseH]);
    }
    rotate([0,0,-360/p4number]){
    translate([-p4baseOD/2,0,0])    
    cube([p4baseOD,p4baseOD/2,p4baseH]);        
    }

difference(){
    cylinder(h=p4basegapH,d=p4basegapOD);  
    cylinder(h=p4basegapH,d=p4basegapID);    
}

//bolt holes        
            for(i=[0:(p2number/p4number)-1]){
         rotate([0,0,(-360/p2number/p2needles*0.5)+(i*-360/p2number)]){
             

if(p2p4type==1){
    translate([-(p4baseOD/2)+((p4baseOD-p4baseID)/2),0,p4holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
cylinder(d1=p2p4flatHD,d2=0,h=(p2p4flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p4flatHD)/tan(45)])
cylinder(d1=p2p4flatHD*3,d2=p2p4flatHD,h=(p2p4flatHD)/tan(45),$fn=36);
cylinder(d=p2p4flatD,h=((p4baseOD-p4baseID)/2)+2,$fn=36);
}//end union
}//end if
if(p2p4type==0){
    translate([-(p4baseOD/2)+((p4baseOD-p4baseID)/2),0,p4holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
translate([0,0,-p2p4boltHH/2])
cylinder(d=p2p4boltHD,h=p2p4boltHH,$fn=36);
cylinder(d=p2p4boltD,h=((p4baseOD-p4baseID)/2)+2,$fn=36);
}//end union
}//end if


}
}

//second set
       for(i=[0:(p2number/p3number)-1]){
        rotate([0,0,-(360/p2number/p2needles*0.5)+(360/p2number/p2needles)+(i*-360/p2number)+(-360/p2number)]){
 
if(p2p4type==1){  // if flat socket
    translate([-(p4baseOD/2)+((p4baseOD-p4baseID)/2),0,p4holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
cylinder(d1=p2p4flatHD,d2=0,h=(p2p4flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p4flatHD)/tan(45)])
cylinder(d1=p2p4flatHD*3,d2=p2p4flatHD,h=(p2p4flatHD)/tan(45),$fn=36);
cylinder(d=p2p4flatD,h=((p4baseOD-p4baseID)/2)+2,$fn=36);
}//end union
}//end if
if(p2p4type==0){  // if regular socket
    translate([-(p4baseOD/2)+((p4baseOD-p4baseID)/2),0,p4holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
translate([0,0,-p2p4boltHH/2])
cylinder(d=p2p4boltHD,h=p2p4boltHH,$fn=36);
cylinder(d=p2p4boltD,h=((p4baseOD-p4baseID)/2)+2,$fn=36);
}//end union
}//end if

} //end rotate
} //end for
//end mounting holes

 
    //trim end       
    if(p4number>1){
    rotate([0,0,-(360/(p4baseOD*PI/p4endtrim))])
 mirror([1,1,0])
 cube([p4baseOD/2,p4baseOD/2,p4rampH+p4baseH]);   
    
}
    
    
    } //end main difference
} //end main translate
    
    
} //end module