# Arduino Code for Circular Knitic Machine

This folder contains Arduino code for different hardware configurations of the Circular Knitic machine.

## Hardware Options

### Original Versions (Fixed Speed)
- **Stepper-BigEasyDriver** - Uses BigEasyDriver for stepper motor control
- **Stepper-MotorShield** - Uses Arduino Motor Shield for direct motor control  
- **Stepper-MotorShield-AccelStepper** - Uses Motor Shield with AccelStepper library
- **Stepper-MotorShield-AccelStepper-run** - Uses Motor Shield with AccelStepper in run mode
- **Stepper-ProDriver** - Uses SparkFun ProDriver (TC78H670FTG) for stepper motor control

### Potentiometer Versions (Variable Speed)
- **Stepper-BigEasyDriver-Pot** - BigEasyDriver with potentiometer speed control
- **Stepper-MotorShield-Pot** - Motor Shield with potentiometer speed control
- **Stepper-MotorShield-AccelStepper-Pot** - AccelStepper with potentiometer speed control
- **Stepper-MotorShield-AccelStepper-run-Pot** - AccelStepper run mode with potentiometer speed control
- **Stepper-ProDriver-Pot** - SparkFun ProDriver with potentiometer speed control

## Potentiometer Wiring

For all "-Pot" versions, connect a potentiometer as follows:
- **Center pin** → Arduino analog pin A0
- **One outer pin** → 5V 
- **Other outer pin** → GND

## Speed Control Ranges

- **BigEasyDriver-Pot**: 1000-15000 microseconds delay (lower = faster)
- **MotorShield-Pot**: 5-100 milliseconds delay (lower = faster)  
- **AccelStepper-Pot**: 10-200 speed units (higher = faster)
- **AccelStepper-run-Pot**: 5-100 speed units (higher = faster)
- **ProDriver-Pot**: 1000-15000 microseconds delay (lower = faster)

## Usage

1. Choose the hardware configuration that matches your setup
2. For variable speed control, use the corresponding "-Pot" version
3. Upload the .ino file to your Arduino
4. Turn the potentiometer to adjust motor speed in real-time