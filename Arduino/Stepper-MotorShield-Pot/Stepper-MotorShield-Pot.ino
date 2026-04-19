/*
 * Stepper-MotorShield-Pot.ino
 * 
 * This version adds potentiometer control for variable motor speed.
 * 
 * Hardware Setup:
 * - Connect potentiometer center pin to analog pin A0
 * - Connect potentiometer outer pins to 5V and GND
 * - Motor control via Arduino Motor Shield as in original version
 * 
 * The potentiometer controls the delay length between motor steps
 * from fast (5ms delay) to slow (100ms delay)
 */

int delayLength = 20;
int potPin = A0; // Potentiometer connected to analog pin A0

void setup() {
  
  //establish motor direction toggle pins
  pinMode(12, OUTPUT); //CH A -- HIGH = forwards and LOW = backwards???
  pinMode(13, OUTPUT); //CH B -- HIGH = forwards and LOW = backwards???
  
  //establish motor brake pins
  pinMode(9, OUTPUT); //brake (disable) CH A
  pinMode(8, OUTPUT); //brake (disable) CH B

  //onoff switch pin
  pinMode(7,INPUT_PULLUP);
  pinMode(4,INPUT_PULLUP);

}

void loop(){
int switchStateForward = digitalRead(7);
int switchStateBackward = digitalRead(4);

// Read potentiometer value and map to delay length
int potValue = analogRead(potPin);
// Map potentiometer (0-1023) to delay length (5-100 milliseconds)
delayLength = map(potValue, 0, 1023, 5, 100);

//use a while statement to run continuasly if ON switched
if (switchStateForward == LOW){
 
  digitalWrite(9, LOW);  //ENABLE CH A
  digitalWrite(8, HIGH); //DISABLE CH B

  digitalWrite(12, HIGH);   //Sets direction of CH A
  analogWrite(3, 255);   //Moves CH A
  
  delay(delayLength);
  
  digitalWrite(9, HIGH);  //DISABLE CH A
  digitalWrite(8, LOW); //ENABLE CH B

  digitalWrite(13, LOW);   //Sets direction of CH B
  analogWrite(11, 255);   //Moves CH B
  
  delay(delayLength);
  
  digitalWrite(9, LOW);  //ENABLE CH A
  digitalWrite(8, HIGH); //DISABLE CH B

  digitalWrite(12, LOW);   //Sets direction of CH A
  analogWrite(3, 255);   //Moves CH A
  
  delay(delayLength);
    
  digitalWrite(9, HIGH);  //DISABLE CH A
  digitalWrite(8, LOW); //ENABLE CH B

  digitalWrite(13, HIGH);   //Sets direction of CH B
  analogWrite(11, 255);   //Moves CH B
  
  delay(delayLength);

} //end if forward

if (switchStateBackward == LOW){
  digitalWrite(9, LOW);  //ENABLE CH A
  digitalWrite(8, HIGH); //DISABLE CH B

  digitalWrite(12, HIGH);   //Sets direction of CH A
  analogWrite(3, 255);   //Moves CH A
  
  delay(delayLength);
  
  digitalWrite(9, HIGH);  //DISABLE CH A
  digitalWrite(8, LOW); //ENABLE CH B

  digitalWrite(13, HIGH);   //Sets direction of CH B
  analogWrite(11, 255);   //Moves CH B
  
  delay(delayLength);
  
  digitalWrite(9, LOW);  //ENABLE CH A
  digitalWrite(8, HIGH); //DISABLE CH B

  digitalWrite(12, LOW);   //Sets direction of CH A
  analogWrite(3, 255);   //Moves CH A
  
  delay(delayLength);
    
  digitalWrite(9, HIGH);  //DISABLE CH A
  digitalWrite(8, LOW); //ENABLE CH B

  digitalWrite(13, LOW);   //Sets direction of CH B
  analogWrite(11, 255);   //Moves CH B
  
  delay(delayLength);
} //end if backward

}



    /*
     Stepper Motor Control with Arduino Motor Control Shield V3.0.
     
     This requires the following modification to the shield:
    - Remove IC2
    - Bridge IC2 pins 4 and 12, connecting DIRA/Arduino 12 with IC3 2A
    - Bridge IC2 pins 6 and 9, connecting DIRB/Arduino 13 with IC3 3A
     
     This program drives a bipolar stepper motor. The motor is controlled
     by Arduino pins 8, 9, 12, 13. Additionally Pins 10 and 11 are required.
     
     The motor should do five revolutions into one and five into another direction.
     
     */
     /*
    #include <Stepper.h>
     
    int out1 = 8;
    int out2 = 9;
    int enA  = 10;  // Enable pin 1 on Motor Control Shield  
    int enB  = 11;  // Enable pin 2 on Motor Control Shield  
    int dirA = 12;  // Direction pin dirA on Motor Control Shield
    int dirB = 13;  // Direction pin dirB on Motor Control Shield
     
     
    const int stepsPerRevolution = 200;  // change this to fit the number of steps per revolution
                                         // for your motor
     
    // Initialize the stepper library on pins 8, 9, 12, 13:
    Stepper myStepper(stepsPerRevolution, out1, dirA, out2, dirB);            
     
    void setup() {
      // Set speed to 60 rpm:
      myStepper.setSpeed(10);
     
      // Enable IC3 outputs.
      pinMode(enA, OUTPUT);
      digitalWrite (enA, HIGH);
      pinMode(enB, OUTPUT);
      digitalWrite (enB, HIGH);

      //onoff switch pin
      pinMode(7,INPUT_PULLUP);
      pinMode(4,INPUT_PULLUP);
  
      }
     
    void loop() {
      int switchStateForward = digitalRead(7);
      int switchStateBackward = digitalRead(4);

      while(switchStateForward == LOW) {
      // Step five revolutions into one direction:
      myStepper.step(10);
      delay(2000);
      }

      while(switchStateBackward == LOW) {     
      // Step five revolutions in the other direction:
      myStepper.step(-10);
      delay(2000);
      }
    }

*/

/*int stp = 13;  //connect pin 13 to step
int dir = 12;  // connect pin 12 to dir
int stp2 = 8;  //connect pin 13 to step
int dir2 = 9;  // connect pin 12 to dir

int speedDelay = 8000;

void setup() 
{                
  pinMode(stp, OUTPUT);
  pinMode(dir, OUTPUT);
  pinMode(stp2, OUTPUT);
  pinMode(dir2, OUTPUT);  
  digitalWrite(dir, HIGH);
  digitalWrite(dir2, LOW);
  delay(100);

    //onoff switch pin
  pinMode(7,INPUT_PULLUP);
  pinMode(4,INPUT_PULLUP);
}


void loop() {
int switchStateForward = digitalRead(7);
int switchStateBackward = digitalRead(4);

while (switchStateForward == LOW){  
    digitalWrite(stp, HIGH); 
    digitalWrite(stp, LOW);   
    delayMicroseconds(speedDelay);   
    digitalWrite(stp2, HIGH);
    digitalWrite(stp2, LOW);
    delayMicroseconds(speedDelay);   
} //end while   
} //end loop

*/

/*
//alternate code https://www.arduino.cc/en/Reference/StepperExample

#include <Stepper.h>

int enA  = 9;  // Enable pin 1 on Motor Control Shield  
int enB  = 8;  // Enable pin 2 on Motor Control Shield  
int dirA = 12;  // Direction pin dirA on Motor Control Shield
int dirB = 13;  // Direction pin dirB on Motor Control Shield

const int stepsPerRevolution = 200;  // Change this to fit the number of steps per revolution
                                     // for your motor
 
// Initialize the stepper library on pins 12 and 13:
Stepper myStepper(stepsPerRevolution, dirA, dirB, enA, enB);            
 
 
void setup() {
  // set the speed at 10 rpm:
  myStepper.setSpeed(10);
 
  // Enable power to the motor
  pinMode(enA, OUTPUT);
  digitalWrite (enA, HIGH);
 
  pinMode(enB, OUTPUT);
  digitalWrite (enB, HIGH);

    //on/off switch pin
  pinMode(7,INPUT_PULLUP);
  pinMode(4,INPUT_PULLUP);

}
 
void loop() {

int switchStateForward = digitalRead(7);
int switchStateBackward = digitalRead(4);

//use a while statement to run continuasly if ON switched
while (switchStateForward == LOW){
  // Step five revolutions into one direction:
  myStepper.step(10);
  delay(2000);   //is this needed?
} //end while


//put if statement here for switch state
while (switchStateBackward == LOW){
  // Step five revolutions in the other direction:
  myStepper.step(-10);
  delay(2000);   //is this needed? 
} //end while


} //end loop

 */