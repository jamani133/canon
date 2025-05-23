
BarIndicator linePressureI = new BarIndicator();

void setupLineSection(){
    linePressureI.posX = 1175;
    linePressureI.posY = 90;
    linePressureI.drawBG = true;
    linePressureI.heading = "Line Pressure : ";
    linePressureI.unit = " MPa";
    linePressureI.range = 1;
    linePressureI.width = 450;
}
void handleLineSection(){
    linePressureI.handle();
}