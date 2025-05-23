float firePosX = 1150;
float firePosY = 215;
FireButton fireButtonB = new FireButton();
Indicator mainValveI = new Indicator();
Indicator armI = new Indicator();
Button armB = new Button();
Button disarmB = new Button();
Button openB = new Button();
Button closeB = new Button();
ValSlider openTimeS = new ValSlider();

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
    openB.text = "OPEN";
    closeB.text = "CLOSE";
    openTimeS.posX = firePosX+200;
    openTimeS.posY = firePosY+500;
    openTimeS.range = 3;
    openTimeS.value = 0.5/3;
    openTimeS.steps = 60;
    openB.needArm = true;
}

void handleFireSection(){
    bgRect(firePosX,firePosY,500,620);

    fireButtonB.armed = armed;
    armI.active = armed;

    fireButtonB.handle();
    mainValveI.handle();
    armI.handle();
    armB.handle();
    disarmB.handle();
    openB.handle();
    closeB.handle();
    openTimeS.handle();
}