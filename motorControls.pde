float motorPosX = 50;
float motorPosY = 535;
Joystick joyC = new Joystick();
void setupMotorSection(){
    joyC.posX=motorPosX;
    joyC.posY=motorPosY;
    joyC.size=400;
}

void handleMotorSection(){
    bgRect(motorPosX,motorPosY,500,400);
    joyC.handle();
}


//act2 s2 act3 S1&2