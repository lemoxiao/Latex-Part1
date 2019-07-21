#include "AcceleroDice.h"
#include <Arduino.h>

AcceleroMMA7361 accelero;
AcceleroDice dice;

void setup(){
  Serial.begin(9600);
  accelero.begin();
  accelero.setARefVoltage(3.3); //AREF voltage = 3.3V
  accelero.setSensitivity(LOW); //Sensitivity = +/-6G
  accelero.calibrate();
  dice.begin(accelero);
}

void loop(){ 
  if (dice.calcSide()){
    Serial.println(dice.getSide());
  }
}
