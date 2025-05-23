float pressurePosX = 50;
float pressurePosY = 50;

TargetSlider pressureS = new TargetSlider();
Button bleedB = new Button();
Button fillB = new Button();
Button adjustB = new Button();
Button stopB = new Button();
Indicator fillingI = new Indicator();
Indicator bleedingI = new Indicator();
Indicator adjustingI = new Indicator();

void setupPressureSection(){
    pressureS.posX = pressurePosX+25;
    pressureS.posY = pressurePosY+40;
    pressureS.heading = "Tank Pressure : ";
    pressureS.unit = " MPa";
    pressureS.range = 1;
    pressureS.width = 1000;
    bleedB.posY = fillB.posY = adjustB.posY = stopB.posY = fillingI.posY = bleedingI.posY = adjustingI.posY = pressurePosY+145;
    fillingI.baseColor = GREEN;
    bleedingI.baseColor = GREEN;
    adjustingI.baseColor = YELLOW;

    stopB.baseColor = ORANGE;
    adjustingI.textSize = 20;

    bleedB.posX = pressurePosX+25;
    fillB.posX = pressurePosX+150;
    fillingI.posX = pressurePosX+300;
    bleedingI.posX = pressurePosX+425;
    adjustB.posX = pressurePosX+1025-375;
    stopB.posX = pressurePosX+1025-250;
    adjustingI.posX = pressurePosX+1025-125;

    bleedB.text = "Bleed";
    fillB.text = "Fill";
    fillingI.text = "Filling";
    bleedingI.text = "Bleeding";
    adjustB.text = "Adjust";
    stopB.text = "Stop";
    adjustingI.text = "Adjusting";
}
void handlePressureSection(){
    bgRect(pressurePosX,pressurePosY,1050,210);
    
    bleedB.handle();
    fillB.handle();
    stopB.handle();
    adjustB.handle();
    bleedingI.handle();
    fillingI.handle();
    adjustingI.handle();

    pressureS.handle();
}