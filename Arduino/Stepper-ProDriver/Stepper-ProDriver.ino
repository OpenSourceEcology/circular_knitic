/*
 * SparkFun ProDriver - Stepper Motor Driver (TC78H670FTG) Control
 * 
 * This sketch controls stepper motors using the SparkFun ProDriver
 * which uses the TC78H670FTG stepper motor driver IC.
 * 
 * The ProDriver provides step/direction control similar to other drivers
 * but with additional features like enable pin and higher current capacity.
 * 
 * Pin connections:
 * - Motor 1: Step pin 3, Direction pin 2, Enable pin 6
 * - Motor 2: Step pin 5, Direction pin 4, Enable pin 7
 * - Switch pins: Forward pin 8, Backward pin 9
 * - Speed potentiometer: Analog pin A0
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
int potPin = A0;         // Potentiometer for speed control (analog input)
int speedDelay = 8000;   // Delay between steps in microseconds (default)
int minSpeedDelay = 500; // Minimum delay (fastest speed)
int maxSpeedDelay = 15000; // Maximum delay (slowest speed)

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
  // Read potentiometer and update speed
  int potValue = analogRead(potPin);
  speedDelay = map(potValue, 0, 1023, minSpeedDelay, maxSpeedDelay);
  
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