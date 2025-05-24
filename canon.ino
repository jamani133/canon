//#include "BluetoothSerial.h"

#define charge 16
#define discharge 17
#define fire 21
#define water 33
#define plasma 26

//BluetoothSerial ctrl;
#define ctrl Serial


void setup() {
  //ctrl.begin("pew pew maddafuggers");
  ctrl.begin(115200);
  pinMode(charge,OUTPUT);
  pinMode(discharge,OUTPUT);
  pinMode(fire,OUTPUT);
  pinMode(water,OUTPUT);
  pinMode(plasma,OUTPUT);
}

void loop() {
  if(ctrl.available()){
    String command = ctrl.readStringUntil('\n');
    char variable = command.at(0);
    int value = command.substring(2).toInt();
    ctrl.println(variable+"set to"+value);
  }
}