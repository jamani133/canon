float waterPosX = 600;
float waterPosY = 310;

BarIndicator waterLevelI = new BarIndicator();
Button resetWaterB = new Button();
Button enableWaterB = new Button();
Button disableWaterB = new Button();
Indicator waterRunningI = new Indicator();

void setupWaterSection(){
    waterLevelI.posX = waterPosX+25;
    waterLevelI.posY = waterPosY+40;
    waterLevelI.width = 450;
    waterLevelI.fg = BLUE;
    waterLevelI.unit = "L";
    waterLevelI.heading = "Water : ";
    resetWaterB.baseColor = ORANGE;
    enableWaterB.baseColor = LIGHT_BLUE;
    disableWaterB.baseColor = LIGHT_BLUE;
    resetWaterB.text = "reset";
    enableWaterB.text = "ON";
    disableWaterB.text = "OFF";
    waterRunningI.baseColor = BRIGHT_BLUE;
    waterRunningI.text = "Filling";
    disableWaterB.posY = resetWaterB.posY = waterRunningI.posY = enableWaterB.posY = waterPosY+110;
    disableWaterB.posX = waterPosX+25;
    enableWaterB.posX = waterPosX+141.666;
    waterRunningI.posX = waterPosX+258.333;
    resetWaterB.posX = waterPosX+375;
}

void handleWaterSection(){
    bgRect(waterPosX,waterPosY,500,175);
    waterLevelI.handle();
    waterRunningI.handle();
    enableWaterB.handle();
    disableWaterB.handle();
    resetWaterB.handle();
}