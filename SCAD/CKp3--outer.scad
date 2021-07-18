include <CKvars.scad>;

/*
///////////////////
use <CKneedle.scad>;
rotate([0,0,(360/p2number*p2needles/2)]){
    
translate([0,0,-nB+(pPspace1+pPplate1)])
rotate([0,0,(360/(p2number*p2needles))*1])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
    
translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC1-nC)])
rotate([0,0,(360/(p2number*p2needles))*2])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC2-nC)])
rotate([0,0,(360/(p2number*p2needles))*3])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();

translate([0,0,-nB+(pPspace1+pPplate1+pMgrooveC3-nC)])
rotate([0,0,(360/(p2number*p2needles))*4])
translate([(p2needlegrooveDepthslop/2),0,0])
translate([0,nX/2,0])
rotate([90,0,0])
needle();
}

///////////////////
*/
translate([-p3baseOD/2,0,0])
CKp3();

echo("p3wallH",p3wallH);

module CKp3(){
    
    rez=p2number*p2needles*2;
    //p2number*p2needles*2
    //p2number*2*2;
    
    $fn=rez; //defines resolution of circles.

//    centerlineD=p2ID+(p2W+(p3wiggle*2));
       
//    echo(centerlineD); 
        
translate([p3baseOD/2,0,0]){
            
difference(){  

  union(){

    cylinder(h=p3baseH,d=p3baseOD);
    cylinder(h=p3base45H,d=p3baseID);
        
            //ridge
translate([0,0,p3base45H])
difference(){
  cylinder(h=p3ridgeH,d=(p2ID-p3basegapWslop));
  translate([0,0,0])
    cylinder(h=p3ridgeH,d1=(p2ID-p3basegapWslop)-(p3ridgeW2*2),d2=(p2ID-p3basegapWslop)-(p3ridgeW1*2));    
}  //end diff
            
difference(){
  translate([0,0,p3baseH])
  cylinder(h=p3wallchamfH,d1=p3wallID+((p3wallchamfW+p3wallW)*2),d2=p3wallOD);
  cylinder(h=p3wallchamfH+p3baseH,d=p3wallID);
}
            
difference(){                                            
  cylinder(h=p3wallH,d=p3wallOD);
  cylinder(h=p3wallH,d=p3wallID);              
}
} //end main union

cylinder(h=p3wallH,d=p3baseID-(p3base45W*2)+1);
cylinder(h=p3base45H,d1=p3baseID,d2=p3baseID-(p3base45W*2));
        
translate([-p3baseOD/2,-p3baseOD/2,0]){    
  cube([p3baseOD,p3baseOD/2,p3wallH]);
}

rotate([0,0,-360/p3number]){
translate([-p3baseOD/2,0,0])    
  cube([p3baseOD,p3baseOD/2,p3wallH]);        
}


//thin wall
translate([0,0,p3grooveH2])
    difference(){
    cylinder(d=p3wallOD,h=p3wallH);
    cylinder(d=p3wallID+(p3upperwallW*2),h=p3wallH);
    cylinder(d1=p3wallOD,d2=p3wallID+(p3upperwallW*2),h=p2holeH-(p9H/2)-p3grooveH2-1);
        
    }


        //needle slots    
for(i=[1:p2needles*(p2number/p3number)]){
  rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
  translate([-p3wallOD,-p3grooveW/2,p3grooveH1-p3grooveHslop])
    #cube([p3wallOD,p3grooveW,p3grooveH2-p3grooveH1+(p3grooveHslop*2)]);
  }
}
    

    
    //base mounting holes
for(i=[1:p3baseholenumber]){
  rotate([0,0,(((360/p3number/p3baseholenumber))/2)-((360/p3number/p3baseholenumber)*i)]){
  translate([-(p3baseOD/2)+p3baseholefromODID,0,0])
    cylinder(h=p3baseH,d=p3baseholeD,$fn=18);
  }
}    

    //p2 flat head chamger mounting cuts
for(i=[3:(p2needles*p2number/p3number)-3]){
  rotate([0,0,(i*-360/(p2number*p2needles))+180]){

    translate([p3upperwallW+(p3wallID/2),0,p2holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
//cylinder(d=p2p3flatD,h=p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}

//    translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
//    rotate([0,90,0]){
//      cylinder(h=p2OD-p2ID+0.2, d=p2holeD,$fn=36);

//    }  //end rotate
  } //end rotate       
} //end for

    //p2 flat head chamger mounting cuts
for(i=[0:2]){
  rotate([0,0,(i*-360/(p2number*p2needles))+180]){

    translate([p9thickness+p3upperwallW+(p3wallID/2),0,p2holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
} //end union
  } //end rotate       
} //end for
for(i=[(p2needles*p2number/p3number)-2:(p2needles*p2number/p3number)]){
  rotate([0,0,(i*-360/(p2number*p2needles))+180]){

    translate([p9thickness+p3upperwallW+(p3wallID/2),0,p2holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
cylinder(d1=p2p3flatHD,d2=0,h=(p2p3flatHD/2)/tan(45),$fn=36);
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
} //end union
  } //end rotate       
} //end for

 

for(i=[0:(p2needles*p2number)]){
  rotate([0,0,(i*-360/(p2number*p2needles))+180]){

    translate([p3upperwallW+(p3wallID/2),0,p2holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
cylinder(d=p2p3flatD,h=p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}

//    translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
//    rotate([0,90,0]){
//      cylinder(h=p2OD-p2ID+0.2, d=p2holeD,$fn=36);

//    }  //end rotate
  } //end rotate       
} //end for
/*
//p2 mounting holes flat chamfers
for(i=[3:(p2needles*p2number/p3number)-3]){
  rotate([0,0,(i*-360/(p2number*p2needles))]){

    translate([p3upperwallW+(p3wallID/2),0,p2holeH])
    rotate([0,270,0])
translate([0,0,0])
union(){
translate([0,0,-(p2p3flatHD)/tan(45)])
cylinder(d1=p2p3flatHD*3,d2=p2p3flatHD,h=(p2p3flatHD)/tan(45),$fn=36);
cylinder(d=p2p3flatD,h=p3upperwallW+(p2W+(p3wiggle*2)/2)+p2p3nutH,$fn=36);
}
}
}
*/

/*
for(i=[0:(p2number/p3number)-1]){
  rotate([0,0,(-360/p2number/p2needles*(p2needles-1))+(i*-360/p2number)]){
    translate([((-centerlineD-(p3wallW*2)-((p2W+(p3wiggle*2)/2)))/2)-0.1,0,p2holeH])
    rotate([0,90,0]){
      cylinder(h=p2OD-p2ID+0.2, d=p2holeD, $fn=18);
    }
  } 
}//end for
*/
    //end middle holes
        

//trim end of part

if(p3number>1){
    rotate([0,0,-(360/(p3baseOD*PI/p3endtrim))])
 mirror([1,1,0])
 cube([p3baseOD/2,p3baseOD/2,p3wallH]);   
    
}

    //base needle holes
difference(){
for(i=[1:p2needles*(p2number/p3number)]){
  rotate([0,0,(360/p2number/p2needles/2)-(360/p2number/p2needles*i)]){
  translate([-(p3wallID/2),-p3grooveW*p3needleholefactorW/2,0])
    cube([(p3wallID/2),p3grooveW*p3needleholefactorW,p3base45H+p3ridgeH+1]);  //Z = p3base45H
  }
}
difference(){
cylinder(d=p3wallOD,h=p3base45H+p3ridgeH+1);
cylinder(d=p3wallID,h=p3base45H+p3ridgeH+1);
}
//cylinder(d=centerlineD-((p2W+(p3wiggle*2)/2)),h=p3base45H+p3ridgeH+1);
}


} //end main difference
} //end main translate
} //end module