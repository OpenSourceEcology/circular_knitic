# SparkFun ProDriver (TC78H670FTG) Connection Guide

## Pin Connections

### Motor 1 (ProDriver 1)
- Arduino Pin 3 → STEP
- Arduino Pin 2 → DIR  
- Arduino Pin 6 → ENABLE

### Motor 2 (ProDriver 2)
- Arduino Pin 5 → STEP
- Arduino Pin 4 → DIR
- Arduino Pin 7 → ENABLE

### Control Switches
- Arduino Pin 8 → Forward Switch (with pullup resistor)
- Arduino Pin 9 → Backward Switch (with pullup resistor)

### Power Connections
- Connect Arduino GND to ProDriver GND
- Connect appropriate power supply to ProDriver VIN
- Connect stepper motors to ProDriver outputs A1/A2 and B1/B2

## Notes
- The TC78H670FTG ProDriver supports up to 45V and 4.5A per phase
- Enable pins are active LOW (LOW = enabled, HIGH = disabled)
- The sketch automatically disables motors when switches are not pressed to save power
- Motors rotate in opposite directions by default for circular knitting applications

## Microstepping
The ProDriver supports microstepping configuration through mode pins. Refer to the SparkFun documentation for setting microstepping modes if needed.