BarIndicator linePressure = new BarIndicator();
TargetSlider tankPressure = new TargetSlider();
Joystick aimer = new Joystick();
PlasmaIndicator indicator = new PlasmaIndicator();
void setup(){
    size(1200,900);
    tankPressure.setup(50,220,400,50);
}

void draw(){
    background(200);
    linePressure.fill=map(millis()%1000,0,999,0,1);
    linePressure.show();
    tankPressure.update();
    tankPressure.show();
    aimer.update();
    aimer.render();
    indicator.render();
}