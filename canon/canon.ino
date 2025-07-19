//#include "BluetoothSerial.h"

#define charge 21
#define discharge 16
#define fire 26
#define water 17
#define plasma 33
#define linePressure 27
#define tankPressure 25
#define waterWheel 23
#define RXD2 2
#define TXD2 4

//33 26 fire / plasma


//BluetoothSerial ctrl;
#define ctrl Serial
int lastReport = 0;
boolean heartbeat = false;
int chargeTime = 0;
int dischargeTime = 0;
int fireTime = 0;
int plasmaTime = 0;
int armedTime = 0;
int waterLevel = 0;
int waterTime = 0;

int lastUpdate = 0;

int pressureT = 0;
int pressureL = 0;

int divider = 0;

void setup() {
  //ctrl.begin("pew pew maddafuggers");
  ctrl.begin(115200,SERIAL_8N1, RXD2, TXD2);
  pinMode(charge,OUTPUT);
  pinMode(discharge,OUTPUT);
  pinMode(fire,OUTPUT);
  pinMode(water,OUTPUT);
  pinMode(plasma,OUTPUT);
  pinMode(waterWheel,INPUT);
  attachInterrupt(waterWheel, waterHandler, RISING);
}

void loop() {
  if(ctrl.available()){
    String command = ctrl.readStringUntil('\n');
    String variable = command.substring(0,1);
    int value = command.substring(2).toInt();
    //ctrl.println(variable+"set to"+value);
    if(variable.equals("0")){
      heartbeat = value>0;
    }else if(variable.equals("1")){
      dischargeTime = value;
    }else if(variable.equals("2")){
      chargeTime = value;
    }else if(variable.equals("3")){
      waterTime = value;
    }else if(variable.equals("4")){
      plasmaTime = value;
    }else if(variable.equals("5")){
      fireTime = value;
    }else if(variable.equals("6")){
      armedTime = value;
    }else if(variable.equals("7")){
      waterLevel = value;
    }else if(variable.equals("8")){
      //pan = value;
    }else if(variable.equals("9")){
      //tilt = value;
    }  
  }
  digitalWrite(charge,chargeTime>0);
  digitalWrite(discharge,dischargeTime>0);
  digitalWrite(water,waterTime>0);
  digitalWrite(plasma,plasmaTime>0&&armedTime>0);
  digitalWrite(fire,fireTime>0&&armedTime>0);

  int deltaTime = millis() - lastUpdate;
  lastUpdate = millis();
  armedTime = max(0,armedTime-deltaTime);
  waterTime = max(0,waterTime-deltaTime);
  chargeTime = max(0,chargeTime-deltaTime);
  dischargeTime = max(0,dischargeTime-deltaTime);
  fireTime = max(0,fireTime-deltaTime);
  plasmaTime = max(0,plasmaTime-deltaTime);

  pressureL = analogRead(linePressure);
  pressureT = analogRead(tankPressure);
  divider++;

  if(lastReport+100 <= millis()){
    lastReport = millis();

    String repo =
    "\n1:"+String(dischargeTime)+
    "\n2:"+String(chargeTime)+
    "\n3:"+String(waterTime)+
    "\n4:"+String(plasmaTime)+
    "\n5:"+String(fireTime)+
    "\n6:"+String(armedTime)+
    "\n7:"+String(pressureL)+
    "\n8:"+String(pressureT)+
    "\n9:"+String(waterLevel);

    if(heartbeat){
      repo = repo+"\n0:1";
    }else{
      repo = repo+"\n0:0";
    }
    ctrl.print(repo);
    divider = 0;
  }

  
}
void waterHandler(){
  waterLevel++;
}
