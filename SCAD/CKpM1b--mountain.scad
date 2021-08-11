include <CKvars.scad>;

use <mb10.scad>;
use <CKpM2--mountainfeeder.scad>;
use <CKpM3--anglebracket.scad>;

//values CKpM(X,X,X) defined as follows:
//render needle path groove 1 == yes, 0 == no
//render thread feeder stand using  0=none  1=angle iron  2=makerbeamm
//render beam angle of the feed holder yes == 1, no == 0
rotate([-90,0,0])
CKpM(1,1,0); 


module CKpM(G,TF,RenderBeam){
translate([0,-p3wallOD/2,0]){ //main translate
union(){
difference(){

//main cube
  translate([0,0,pMH/2])
  translate([0,(c2ID+(pMgroove*2)+(pMwallT*2))/4,0])
    cube([c2ID+(pMgroove*2)+(pMwallT*2),(c2ID+(pMgroove*2)+(pMwallT*2))/2,pMH], center=true);

//main ID cut
  cylinder(d=pMID,h=pMH+1,$fn=rez);

//left side cuts and groove cuts
 cutsLEFT(G,TF,RenderBeam);
        
//right side
 mirror([1,0,0]) 
 cutsLEFT(G,TF,RenderBeam); 
            
} //end main body diffference

////begin union

//Thread Feeder Stand

if(TF==1){  //angle iron, corner option
    translate([pMbodyXr-pMshelfchamfR,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),pPspace2+pPplate2])
cube([aaT,aaX-aaT,pMshelfchamfR]);

mirror([1,0,0])
    translate([pMbodyXr-pMshelfchamfR,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),pPspace2+pPplate2])
cube([aaT,aaX-aaT,pMshelfchamfR]);

CubeChmfD=6;    
    translate([pMbodyXr-pMshelfchamfR-(aaX-aaT),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),pMH])
    difference(){
        translate([0,-(CubeChmfD/2),0])
cube([aaX-aaT,aaX-aaT+(CubeChmfD/2),aaX+1]);
hull(){
translate([0,-(CubeChmfD/2),aaX+1])
        rotate([0,90,0])
cylinder(d=CubeChmfD,h=aaX,$fn=36);
translate([0,-(CubeChmfD/2),(CubeChmfD/2)*1.5])
        rotate([0,90,0])
    resize([CubeChmfD*1.5,CubeChmfD])
cylinder(d=CubeChmfD,h=aaX,$fn=36);
} //end hull
translate([aaX-aaT,aaX-aaT,(aaX+1)/2])
rotate([0,0,45])
        cube([2,2,aaX+1],center=true);
translate([0,0,(aaX+1)])
rotate([0,45,45])
        cube([2,3,3],center=true);
    }

mirror([1,0,0])
    translate([pMbodyXr-pMshelfchamfR-(aaX-aaT),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),pMH])
    difference(){
        translate([0,-(CubeChmfD/2),0])
cube([aaX-aaT,aaX-aaT+(CubeChmfD/2),aaX+1]);
hull(){
translate([0,-(CubeChmfD/2),aaX+1])
        rotate([0,90,0])
cylinder(d=CubeChmfD,h=aaX,$fn=36);
translate([0,-(CubeChmfD/2),(CubeChmfD/2)*1.5])
        rotate([0,90,0])
    resize([CubeChmfD*1.5,CubeChmfD])
cylinder(d=CubeChmfD,h=aaX,$fn=36);
} //end hull
translate([aaX-aaT,aaX-aaT,(aaX+1)/2])
rotate([0,0,45])
        cube([2,2,aaX+1],center=true);
translate([0,0,(aaX+1)])
rotate([0,45,45])
        cube([2,3,3],center=true);
    }

if(RenderBeam==1){
    translate([pMbodyXr-pMshelfchamfR-(aaX-aaT),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),pPspace2+pPplate2+pMshelfchamfR])
    difference(){
        cube([aaX,aaX,pMgrooveC3+nA-nC-nB+aaX]);  //cube 
        cube([aaX-aaT,aaX-aaT,pMgrooveC3+nA-nC-nB+aaX]);

    } //end angle iron

mirror(1,0,0)
    translate([pMbodyXr-pMshelfchamfR-(aaX-aaT),((c2ID+(pMgroove*2)+(pMwallT*2))/2)-(aaX-aaT),pPspace2+pPplate2+pMshelfchamfR])
    difference(){
        cube([aaX,aaX,pMgrooveC3+nA-nC-nB+aaX]);  //cube 
        cube([aaX-aaT,aaX-aaT,pMgrooveC3+nA-nC-nB+aaX]);
    } //end angle iron    
    
translate([
    0,
    p3wallOD/2,
    -nB+(pPspace1+pPplate1+pMgrooveC3-nC-(pMgrooveD-nC))+nA-((tipOpenZ-tipHole)/2)-tipcylD-nG
    ])    
mirror([0,0,1])
translate([0,0,tipOpenX/2])
CKpM2();
    

translate([pMbodyXr-pMshelfchamfR,((c2ID+(pMgroove*2)+(pMwallT*2))/2),pPspace2+pPplate2+pMshelfchamfR])    
CKpM3();    

mirror([1,0,0])
translate([pMbodyXr-pMshelfchamfR,((c2ID+(pMgroove*2)+(pMwallT*2))/2),pPspace2+pPplate2+pMshelfchamfR])    
CKpM3();    
  
    
} //end if render beam
} //end if thread feeder style angle iron

  if(TF==2){   //MakerBeam Option
      translate([(TFW/2)-(10/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)+(10/2),0])
      MB10(100);      

      translate([-(TFW/2)+(10/2),((c2ID+(pMgroove*2)+(pMwallT*2))/2)+(10/2),0])
      MB10(100);
  }  //end if thread feeder style maker beam
  
} //end main union
} //end main translate
} //end CKpM module


module needlepathLEFT(){
    /////START GROOVE CUTS/////
    
    //7    
    for(i=[pMd7s:gdeg:pMd7e]){
            translate([0,0,pMh7s])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 7 for
    
    //6
    for(i=[pMd6s:gdeg:pMd6e]){
            translate([0,0,pMh7s+func6(i)])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 6 for
    
    //5
    for(i=[pMd5s:gdeg:pMd5e]){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])    /////needs work
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
    }//end 5 for
    
    //4
    for(i=[pMd4s:gdeg:pMd4e]){
        hull(){
            translate([0,0,func4(i)+pMh4e])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        }
        else{
            translate([0,0,0])  
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);    
        }
    } //end hull        
    }//end 4 for

    //3
    for(i=[pMd3s:gdeg:pMd3e]){
        hull(){
            translate([0,0,pMh4e])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        }
        else{
            translate([0,0,0])  
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);    
        }
    } //end hull
    }//end 3 for    

    //2    
    for(i=[pMd2s:gdeg:pMd2e]){
        hull(){
            translate([0,0,func2(i)+pMh2s])
            rotate([270,0,i])
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        } //end if
        else{        
            translate([0,0,0])    
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);       
        } //end else
    } //end hull
    }//end 2 for

multrez=10;    
    //1
    for(i=[pMd1s:gdeg/multrez:pMd1e-(gdeg/2)]){
        hull(){        
            translate([0,0,pMh2s+func2(pMd2e)+(tan(pMcutA)*(i-pMd1s)*glnd)])    /////needs work
            rotate([270,0,i])
            union(){
            #cylinder($fn=36*2,d=pMgrooveD,h=pMgrooveOR);
            translate([-pMgrooveD/2,-pMgrooveD/2,0])
            #cube([pMgrooveD/2,pMgrooveD,pMgrooveOR]);    
            }
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        } //end if
        else{   
            translate([0,0,0])  
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);        
        } //end else
    }//end hull
    }//end 1 for            

/*
    //0    
    for(i=[pMd0s:gdeg:pMd0e]){
        hull(){
            translate([0,0,pMh0s-func0(i)])
            rotate([270,0,i])
            #cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        if(i<=pMd5e){
            translate([0,0,pMh7s+func6(pMd6e)-(tan(pMcutA)*(i-pMd5s)*glnd)])
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);
        } //end if
        else{        
            translate([0,0,0])    
            rotate([270,0,i]) 
            cylinder($fn=pMcutcylRez,d=pMgrooveD,h=pMgrooveOR);       
        } //end else
    } //end hull
    }//end 2 for
*/


mirror([1,0,0])
difference(){
cylinder(r=pMgrooveOR, h=pPspace2, $fn=rez);
rotate([0,0,pMd1e])
mirror([0,0,0])
#cube([pMID*4,pMID*4,pPspace2]);
rotate([0,0,90])
mirror([0,1,0])
#cube([pMID*4,pMID*4,pPspace2]);
}

/*
    //shelf
    for(i=[pMdSs:gdeg/multrez:pMd1e+180]){
        rotate([0,0,i])
        translate([0,pMgrooveOR/2,0])
        #cube([pMgrooveD,pMgrooveOR,pPspace2*2],center=true);
    }//end 0 for    
  */
    
} //end left needle groove module

module cutsLEFT(G,TF,RenderBeam){

if(G==1){
//left needle path cut
 needlepathLEFT();  
}
    
//////
//angled cut ends 
rotate([0,0,atan((((((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))+(pMshelfX/2)))/((cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove))))])  /////////////
translate([-((pMshelfX)/2),0,0])
mirror([1,0,0])
  cube([pMID*4,pMID*4,pPspace2]);
        
//
//////

//////
//shelf cuts

translate([pMbodyXr,0,pPspace2])
  cube([pMID*4,pMID*4,pMH]); //c3 above shelf

        
translate([pMbodyXr+pMshelfX,0,0])
  cube([pMID*4,pMID*4,pMH]); //of shelf

//chamfered cut
translate([pMbodyXr-pMshelfchamfR,0,pPspace2+pPplate2])
minkowski(){
  translate([pMshelfchamfR,0,pMshelfchamfR])    
    cube([pMID*4,pMID*4,pMH]);
  sphere(r=pMshelfchamfR,$fn=100);
} //end minkowski

//outer shelf hole trim
translate([-(cos(45)*((pMshelfX)/2)),sin(45)*((pMshelfX)/2),0])
translate([0,(c2ID/2)+pMgroove+pMwallT-(pMshelfBoltD*1.5),0])
translate([-(pMbodyXr+(pMshelfX/2)),0,0])
rotate([0,0,-45])
translate([-pMID/2,0,0])
  cube([pMID,pMID,pMH],center=true);  

//shelf cuts
///////  
        
//////
//mounting bolt holes
            //1
translate([0,(cos(pMd1e-pMd0)*((pMID/2)+(pMshelfBoltD)+pMgroove)),0])
translate([(pMbodyXr+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);
            //2
translate([0,(c2ID/2)+pMgroove+pMwallT-(pMshelfBoltD*1.5),0])
translate([(pMbodyXr+(pMshelfX/2)),0,0])
  cylinder(d=pMshelfBoltD, h=pMH, $fn=36);  
                        
//end of bolt holes
//////////////
    
////////        
//space for smallbearingholder bolt heads  
  
        translate([0,((p3baseOD/2)+1),0]){  //close enough?
    //smallbearingholder holes
                translate([-(p5wingW+p5bodyW+p5wingW)/2,0,0]){        
        //wing left holes
            translate([p5wingW/2,p5mounthole2back,0])
                cylinder(d=p5boltHeadOD,h=p5boltHeadH+0.1,$fn=36);
                translate([p5wingW/2,p5wingL-p5mounthole2front,0])
                cylinder(d=p5boltHeadOD,h=p5boltHeadH+0.1,$fn=36);
    }//end translate - center X of holes
        }//end translate to ring
  
//end bearing bolts  
////////          
        
///////////////////GROOVE PATH/////////



////////
//hole for optional angle iron thread feeder mount        

if(TF==1){
translate([(((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))-pMshelfchamfR,((c2ID+(pMgroove*2)+(pMwallT*2))/2),pPspace2+pPplate2+pMshelfchamfR+(pMH/2)])
rotate([0,0,45])
        cube([2,2,pMH],center=true);


//translate([sin(pMd4s)*(pMID/2),(pMID/2),pPspace2+pPplate2+(aaX)])
translate([(((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))-pMshelfchamfR-(aaX-aaT)-(aaboltD/2)-1,(c2ID+(pMgroove*2)+(pMwallT*2))/2,(pPspace2+pPplate2+1)+(aaboltHD/2)+bearingholderZBOD])
rotate([90,0,0])
cylinder(d=aaboltD,h=(c2ID+(pMgroove*2)+(pMwallT*2))/2,$fn=36);

translate([(((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))-pMshelfchamfR-(aaX-aaT)-(aaboltD/2)-1,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-((((pMID/2)-(cos(pMd4s)*(pMID/2)))+pMwallT+pMgroove)-(sin(pMd4s)*(aaboltHD))-2-aaboltHH),(pPspace2+pPplate2+1)+(aaboltHD/2)+bearingholderZBOD])
rotate([90,0,0])
#cylinder(d=aaboltHD+0.5,h=(c2ID+(pMgroove*2)+(pMwallT*2))/2,$fn=36);
     
    


translate([(((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))-pMshelfchamfR-(aaX-aaT)-(aaboltD/2)-1,(c2ID+(pMgroove*2)+(pMwallT*2))/2,pMH-(aaboltHD/2)-5])
rotate([90,0,0])
cylinder(d=aaboltD,h=(c2ID+(pMgroove*2)+(pMwallT*2))/2,$fn=36);
translate([(((c2ID+(pMgroove*2))/2)*cos(90-(pMd1e-pMd0)))-pMshelfchamfR-(aaX-aaT)-(aaboltD/2)-1,((c2ID+(pMgroove*2)+(pMwallT*2))/2)-((((pMID/2)-(cos(pMd4s)*(pMID/2)))+pMwallT+pMgroove)-(sin(pMd4s)*(aaboltHD))-2-aaboltHH),pMH-(aaboltHD/2)-5])
rotate([90,0,0])
cylinder(d=aaboltHD+0.5,h=(c2ID+(pMgroove*2)+(pMwallT*2))/2,$fn=36);

    
    
} //end if
    
}  //end cutsleft module