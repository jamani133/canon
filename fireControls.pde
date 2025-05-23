float firePosX = 1150;
float firePosY = 215;
FireButton fireButtonB = new FireButton();
Indicator mainValveI = new Indicator();
Indicator armI = new Indicator();
Button armB = new Button();
Button disarmB = new Button();
Button openB = new Button();
Button closeB = new Button();

void setupFireSection(){
    fireButtonB.background=loadImage("buttonBG.png");
    fireButtonB.posX = firePosX+25;
    fireButtonB.posY = firePosY+25;
    mainValveI.posX = firePosX+25;
    mainValveI.posY = firePosY+500;
    armI.posX = firePosX+375;
    armI.posY = firePosY+490;
    armI.baseColor = RED;
    mainValveI.baseColor = YELLOW;
    armI.text = "ARMED";
    mainValveI.text = "MFV";
    mainValveI.textSize = 30;
    armB.posY = disarmB.posY = openB.posY = closeB.posY = firePosY+555;
    openB.posX = firePosX+25;
    closeB.posX = firePosX+141.666;
    armB.posX = firePosX+258.333;
    disarmB.posX = firePosX+375;
    armB.text = "ARM";
    armB.baseColor = RED;
    disarmB.text = "DISARM";
    disarmB.baseColor = YELLOW;
    

}

void handleFireSection(){
    bgRect(firePosX,firePosY,500,620);
    fireButtonB.armed = millis()%10000>5000;
    fireButtonB.handle();
    mainValveI.handle();
    armI.handle();
    armB.handle();
    disarmB.handle();
    openB.handle();
    closeB.handle();
}