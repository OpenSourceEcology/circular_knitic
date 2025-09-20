/*
 * Stepper-MotorShield-AccelStepper-Pot.ino
 * 
 * This version adds potentiometer control for variable motor speed.
 * 
 * Hardware Setup:
 * - Connect potentiometer center pin to analog pin A0
 * - Connect potentiometer outer pins to 5V and GND
 * - Motor control via Arduino Motor Shield with AccelStepper library
 * 
 * The potentiometer controls the stepper speed from slow (10) to fast (200)
 */

#include <AccelStepper.h>

AccelStepper stepper(2,12,13);

const int pwmA = 3;
const int pwmB = 11;
const int brakeA = 8;
const int brakeB = 9;
int potPin = A0; // Potentiometer connected to analog pin A0

int switchStateForward = digitalRead(7);  

void setup()
{ 

 
  pinMode(pwmA, OUTPUT);
  pinMode(pwmB, OUTPUT);
  pinMode(brakeA, OUTPUT);
  pinMode(brakeB, OUTPUT);
 
  digitalWrite(pwmA, HIGH);
  digitalWrite(pwmB, HIGH);
  digitalWrite(brakeA, LOW);
  digitalWrite(brakeB, LOW);
 
  stepper.setMaxSpeed(120);
  stepper.setSpeed(110);
 
  stepper.setAcceleration(80);
  stepper.moveTo(999999999);
 
 
}

void loop(){ 

  // Read potentiometer value and map to speed range
  int potValue = analogRead(potPin);
  // Map potentiometer (0-1023) to speed range (10-200)
  int targetSpeed = map(potValue, 0, 1023, 10, 200);
  
  stepper.setMaxSpeed(targetSpeed);
  stepper.setSpeed(targetSpeed);

  if (stepper.distanceToGo() == 0) {
    stepper.run();                   // let the AccelStepper to disable motor current after stop
    delay(2000);                     // wait 2 sec in final position
    stepper.moveTo(-stepper.currentPosition());
  }
  stepper.run();

  if(switchStateForward == HIGH){
  stepper.stop();
  }
    
  }