/*
 * Stepper-BigEasyDriver-Pot.ino
 * 
 * This version adds potentiometer control for variable motor speed.
 * 
 * Hardware Setup:
 * - Connect potentiometer center pin to analog pin A0
 * - Connect potentiometer outer pins to 5V and GND
 * - Stepper motor control via BigEasyDriver as in original version
 * 
 * The potentiometer controls the speed delay - turning it adjusts motor speed
 * from fast (1000 microseconds delay) to slow (15000 microseconds delay)
 */

int stp = 3;  //connect pin 13 to step
int dir = 2;  // connect pin 12 to dir
int stp2 = 5;  //connect pin 13 to step
int dir2 = 4;  // connect pin 12 to dir

int speedDelay = 8000;
int potPin = A0; // Potentiometer connected to analog pin A0

void setup() 
{                
  pinMode(stp, OUTPUT);
  pinMode(dir, OUTPUT);
  pinMode(stp2, OUTPUT);
  pinMode(dir2, OUTPUT);  
  digitalWrite(dir, HIGH);
  digitalWrite(dir2, LOW);
  delay(100);
}


void loop() 
{
    // Read potentiometer value and map to speed delay range
    int potValue = analogRead(potPin);
    // Map potentiometer (0-1023) to speed delay (1000-15000 microseconds)
    // Lower delay = faster speed, higher delay = slower speed
    speedDelay = map(potValue, 0, 1023, 1000, 15000);
    
    digitalWrite(stp, HIGH); 
    digitalWrite(stp, LOW);   
    delayMicroseconds(speedDelay);   
    digitalWrite(stp2, HIGH);
    digitalWrite(stp2, LOW);
    delayMicroseconds(speedDelay);       
}