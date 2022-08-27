include <CKvars.scad>;

CKpM3();



module CKpM3(){    
translate([0,0,-pM3H/2]){
mirror([0,1,0])
mirror([1,0,0])
difference(){

hull(){
pM3profile(pM3c2e+pM3c2c+pM3c2e,0.5);    
    translate([0,0,pM3c2e+aaboltD])
pM3profile(pM3c2c-(aaboltD*2),pM3mink);
}    

translate([-aaT/3,-aaT/3,0])
  cube([(aaboltD*3)+aaX+pM3mink,(aaboltD*3)+aaX+pM3mink,pM3H+1]);  //cube 

translate([-aaT,-aaT,0])
  cube([aaX+pM3slop/2,aaX+pM3slop/2,pM3H+1]);  //cube 

    
     translate([-(-(aaX-aaT)-(aaboltD/2)-1),0,pM3c2e])  
 rotate([90,0,0])
   cylinder(d=aaboltD,h=aaX,$fn=36);
 translate([-(-(aaX-aaT)-(aaboltD/2)-1),0,pM3c2e+pM3c2c])  
 rotate([90,0,0])
   cylinder(d=aaboltD,h=aaX,$fn=36);

     translate([0,-(-(aaX-aaT)-(aaboltD/2)-1),pM3c2e+(pM3c2c/2)])  
 rotate([90,0,270])
   cylinder(d=aaboltD,h=aaX,$fn=36);
    
} //end diff
} //end Z trans
} //end module



module pM3profile(h,c){
    
RM=pM3mink/2; //constant = r of minkoswki
RrD=c;  //distance from corner  = c
RrC=(RM*RM)-((RrD/2)*(RrD/2));  //distance from corner   //cos(45)*aaT  ??
RtX=((sqrt(2))*(sqrt((RM*RM)+(RrC*RrC)+(2*RM*RrC))))-RM-RrC;
RrR=RtX+RM;
    
    difference(){
minkowski(){
difference(){
translate([-aaT,-aaT,0])
  cube([(aaboltD*3)+aaX,(aaboltD*2)+aaX,h]);  //cube 
  cube([(aaboltD*3)+aaX-aaT,(aaboltD*2)+aaX-aaT,h]);
}
cylinder(d=pM3mink, h=0.01, $fn=36);  //,h=0.01  $fn=72
} //end mink
translate([-aaT/3,-aaT/3,0])
  cube([(aaboltD*3)+aaX+pM3mink,aaX+pM3mink,h]);  //cube 
translate([0,0,h-0.011])
  minkowski(){
    difference(){
    translate([-aaT,-aaT,0])
      cube([(aaboltD*3)+aaX,aaX,h]);  //cube 
      cube([(aaboltD*3)+aaX-aaT,aaX-aaT,h]);
}
    cylinder(d=pM3mink, h=0.01, $fn=36);  //,h=0.01  $fn=72
} //end mink

difference(){
  translate([-aaT,-aaT,0])
    cube([aaX+pM3slop/2,aaX+pM3slop/2,h]);  //cube 
}

//cornercut
translate([0,0,0])
intersection(){
    translate([-aaT+RtX-(RtX+RM),-aaT+RtX-(RtX+RM),0])
#cube([RtX+RM,RtX+RM,h]);    
translate([-aaT+RtX,-aaT+RtX,0])
difference(){
    cylinder(r=RrR+20, h=h, $fn=18);
    cylinder(r=RrR, h=h+1, $fn=36);
}

} //end intersection

} //end diff
} //end module
