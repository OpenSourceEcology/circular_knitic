
///////////////////  USER SETTINGS  ///////////////////

/////////////
//  USING THIS FILE:
//  choose desired settings below
//  rename and save this file into the "SCAD" folder
//  for example CKvarsProfile-Small2019.scad
//  then open the file named CKvars.scad in the "SCAD" folder
//  find the "include" commands at the begining of the file
//  change this information to this new file's name, then save
//  you can now open then render each part file with these settings
/////////////

//File Notes - Small201903
// attempting to get near sock dimensions
// looks like need about 1.5 to 1.0 thread diameter
// approx example 20loops/54mm   170mm circumference

/////////////
// DIMENSIONS

//number of "p2" needle guides around circle                    //Jan2019  //small
UPp2number=6;                //12                //36  ///36   //12       //8

//number of needles mounted on each "p2" part
UPp2needles=6;                //5                 //10  ///5    //5        //7

//Note: UPp2number * UPp2needles = total needles

//number of "p3" parts around circle
UPp3number=2;                 //4                 //18  ///4    //4        //2

//number of "p4" parts around circle
UPp4number=2;                 //4                 //18  ///4    //4        //2

//distance from the inside face of one needle to the next
UPneedle2needle=9.12985;     //default=14.35615  //try 8.414    //13.5334  //9.25

//mountain settings
UPpMgrooveturnR=10; //radius of upper curved path in groove //14  //10
UPpMgrooveturnR2=7; //radius of lower curved path in groove //7
UPpMp3X=2;            //length of lower plateu of groove  //2.5   //2
UPpMp7X=2;  //half of length of top plateu of groove //3  //2

/////////////
// MATERIALS

//thread diameter - used to estimate circumference
UPthreadD=1.5;

//number of stepper motors driving the geared plate
UPc1steppersnumber=2;  

//laser cut part thickness
UPupper_surfaceH=3.4;  //thickness of upper rotating plate  ///5  //6.35= 1/4"inch
UPbottom_surface_motor_gearsH=3.4;  //thickness of geared rotating plate
UPtable_surface=3.4;  //thickness of plate of main table
UPtable_support=12.7;  //thickness of support board below table surface

//width of wood used to support table around the edges
UPwoodbeamW=25.4; //table leg wood beam width  1.0 inch
UPwoodbeamScrewOD=6.32;   // 1/4" screw hole into wood beam

//thread feeder option
UPTF=1;    //  0=none  1=angle iron  2=makerbeam10mm

//angle iron option dimensions
UPaaX=12.7;      //width            //12.7    =  1/2in          
UPaaT=1.5875;    //thickness        //1.5875  = 1/16in

///////////////////////////////////////////////