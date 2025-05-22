BarIndicator linePressure = new BarIndicator();
TargetSlider tankPressure = new TargetSlider();
Joystick aimer = new Joystick();
PlasmaIndicator indicator = new PlasmaIndicator();
ValSlider time = new ValSlider();
Button btn = new Button();
void setup(){
    size(1200,900);
    tankPressure.setup(50,220,400,50);
}

void draw(){
    background(200);

    bgRect(600,600,300,100);

    linePressure.fill=map(millis()%1000,0,999,0,1);
    linePressure.posX = sin(float(millis())/500.0)*400+450;

    btn.handle();
    time.handle();
    linePressure.handle();
    tankPressure.handle();
    aimer.handle();
    indicator.handle();
}