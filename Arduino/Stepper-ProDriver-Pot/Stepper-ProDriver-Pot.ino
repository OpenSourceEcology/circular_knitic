/*
 * Stepper-ProDriver-Pot.ino
 * 
 * This version adds potentiometer control for variable motor speed.
 * 
 * Hardware Setup:
 * - Connect potentiometer center pin to analog pin A0
 * - Connect potentiometer outer pins to 5V and GND
 * - Stepper motor control via SparkFun ProDriver (TC78H670FTG) as in original version
 * 
 * The potentiometer controls the speed delay - turning it adjusts motor speed
 * from fast (1000 microseconds delay) to slow (15000 microseconds delay)
 */

// Motor 1 pins
int stp = 3;     // Connect to STEP pin on ProDriver 1
int dir = 2;     // Connect to DIR pin on ProDriver 1  
int en = 6;      // Connect to ENABLE pin on ProDriver 1

// Motor 2 pins  
int stp2 = 5;    // Connect to STEP pin on ProDriver 2
int dir2 = 4;    // Connect to DIR pin on ProDriver 2
int en2 = 7;     // Connect to ENABLE pin on ProDriver 2

// Control switches
int switchForward = 8;   // Forward direction switch
int switchBackward = 9;  // Backward direction switch

// Speed control
int speedDelay = 8000;   // Delay between steps in microseconds (default)
int potPin = A0;         // Potentiometer connected to analog pin A0

void setup() 
{                
  // Configure motor 1 pins
  pinMode(stp, OUTPUT);
  pinMode(dir, OUTPUT);
  pinMode(en, OUTPUT);
  
  // Configure motor 2 pins
  pinMode(stp2, OUTPUT);
  pinMode(dir2, OUTPUT);  
  pinMode(en2, OUTPUT);
  
  // Configure switch pins
  pinMode(switchForward, INPUT_PULLUP);
  pinMode(switchBackward, INPUT_PULLUP);
  
  // Set initial direction - motors rotate in opposite directions
  digitalWrite(dir, HIGH);   // Motor 1 direction
  digitalWrite(dir2, LOW);   // Motor 2 direction (opposite)
  
  // Enable both motors (LOW = enabled for most drivers)
  digitalWrite(en, LOW);     // Enable motor 1
  digitalWrite(en2, LOW);    // Enable motor 2
  
  delay(100);
}

void loop() 
{
  // Read potentiometer value and map to speed delay range
  int potValue = analogRead(potPin);
  // Map potentiometer (0-1023) to speed delay (1000-15000 microseconds)
  // Lower delay = faster speed, higher delay = slower speed
  speedDelay = map(potValue, 0, 1023, 1000, 15000);
  
  int forwardState = digitalRead(switchForward);
  int backwardState = digitalRead(switchBackward);
  
  // Check if forward switch is pressed
  if (forwardState == LOW) {
    // Step both motors forward
    stepMotors();
  }
  
  // Check if backward switch is pressed  
  if (backwardState == LOW) {
    // Reverse direction for both motors
    digitalWrite(dir, LOW);    // Reverse motor 1
    digitalWrite(dir2, HIGH);  // Reverse motor 2
    
    // Step both motors backward
    stepMotors();
    
    // Restore original directions
    digitalWrite(dir, HIGH);   // Motor 1 original direction
    digitalWrite(dir2, LOW);   // Motor 2 original direction
  }
  
  // If no switches pressed, disable motors to save power
  if (forwardState == HIGH && backwardState == HIGH) {
    digitalWrite(en, HIGH);    // Disable motor 1
    digitalWrite(en2, HIGH);   // Disable motor 2
    delay(10);
  } else {
    // Re-enable motors when switches are active
    digitalWrite(en, LOW);     // Enable motor 1
    digitalWrite(en2, LOW);    // Enable motor 2
  }
}

void stepMotors() 
{
  // Step motor 1
  digitalWrite(stp, HIGH); 
  digitalWrite(stp, LOW);   
  delayMicroseconds(speedDelay);   
  
  // Step motor 2
  digitalWrite(stp2, HIGH);
  digitalWrite(stp2, LOW);
  delayMicroseconds(speedDelay);       
}