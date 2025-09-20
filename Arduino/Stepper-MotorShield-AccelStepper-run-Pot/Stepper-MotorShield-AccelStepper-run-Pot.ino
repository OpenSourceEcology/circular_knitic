/*
 * Stepper-MotorShield-AccelStepper-run-Pot.ino
 * 
 * This version adds potentiometer control for variable motor speed.
 * 
 * Hardware Setup:
 * - Connect potentiometer center pin to analog pin A0
 * - Connect potentiometer outer pins to 5V and GND
 * - Motor control via Arduino Motor Shield with AccelStepper library in run mode
 * 
 * The potentiometer controls the stepper speed from slow (5) to fast (100)
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

  pinMode(7,INPUT_PULLUP);
   
  digitalWrite(pwmA, HIGH);
  digitalWrite(pwmB, HIGH);
  digitalWrite(brakeA, LOW);
  digitalWrite(brakeB, LOW);
 
  stepper.setMaxSpeed(40);
  stepper.setSpeed(40);
  //stepper.runSpeed();
 
  stepper.setAcceleration(50);

  
}

void loop(){ 

  // Read potentiometer value and map to speed range
  int potValue = analogRead(potPin);
  // Map potentiometer (0-1023) to speed range (5-100)
  int targetSpeed = map(potValue, 0, 1023, 5, 100);
  
  stepper.setMaxSpeed(targetSpeed);
  stepper.setSpeed(targetSpeed);

  stepper.run();

}