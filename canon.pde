
public color RED = color(200,0,0);
public color GREEN = color(0,200,0);
public color BLUE = color(0,0,200);
public color YELLOW = color(180,180,0);
public color CYAN = color(0,180,180);
public color MAGENTA = color(180,0,180);
public color GRAY = color(160);
public color ORANGE = color(180,90,0);
public color LIGHT_BLUE = color(80,80,160);
public color BRIGHT_BLUE = color(80,80,255);




void setup(){
    size(1700,535+450);
    setupWaterSection();
    setupPlasmaSection();
    setupPressureSection();
    setupLineSection();
    setupMotorSection();
    setupFireSection();
}

void draw(){
    background(200);
    handleWaterSection();
    handlePlasmaSection();
    handlePressureSection();
    handleLineSection();
    handleFireSection();
    handleMotorSection();
    plasmaI.active = keyPressed;
}