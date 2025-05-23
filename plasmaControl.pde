float plasmaPosX = 50;
float plasmaPosY = 310;

PlasmaIndicator plasmaI = new PlasmaIndicator();
Indicator plasmaAutoI = new Indicator();
ValSlider plasmaDelayS = new ValSlider();
ValSlider plasmaDurationS = new ValSlider();
Button plasmaTestB = new Button();
Button plasmaAutoB = new Button();

void setupPlasmaSection(){
    plasmaI.posX=plasmaPosX+25;
    plasmaI.posY=plasmaPosY+40;
    plasmaAutoI.posX = plasmaPosX+141.666;
    plasmaAutoI.posY = plasmaPosY+45;
    plasmaAutoI.baseColor = MAGENTA;
    plasmaAutoI.text = "Auto";
    plasmaDelayS.posX=plasmaPosX+375;
    plasmaDelayS.posY=plasmaPosY+45;
    plasmaDurationS.posX=plasmaPosX+258.333;
    plasmaDurationS.posY=plasmaPosY+45;
    plasmaDurationS.value=0.15;
    plasmaDelayS.value=0.3;
    plasmaTestB.posY = plasmaAutoB.posY = plasmaPosY+110;
    plasmaTestB.posX = plasmaPosX+25;
    plasmaTestB.baseColor = CYAN;
    plasmaTestB.text = "IGNITE";
    plasmaAutoB.posX = plasmaPosX+141.666;
    plasmaAutoB.baseColor = MAGENTA;
    plasmaAutoB.text = "Toggle";
    plasmaTestB.needArm = true;
}


void handlePlasmaSection(){
    bgRect(plasmaPosX,plasmaPosY,500,175);
    textAlign(LEFT,CENTER);
    fill(255);
    textSize(25);
    text("Plasma Igniter",plasmaPosX+25,plasmaPosY+22);
    textAlign(CENTER,CENTER);
    fill(220);
    textSize(20);
    text("Duration",plasmaPosX+258.333+50,plasmaPosY+30);
    text("Delay",plasmaPosX+425,plasmaPosY+30);
    plasmaI.handle();
    plasmaAutoI.handle();
    plasmaDelayS.handle();
    plasmaDurationS.handle();
    plasmaAutoB.handle();
    plasmaTestB.handle();
}