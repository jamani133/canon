float firePosX = 1150;
float firePosY = 215;
FireButton fireButtonB = new FireButton();
void setupFireSection(){
    fireButtonB.background=loadImage("buttonBG.png");
    fireButtonB.posX = firePosX+25;
    fireButtonB.posY = firePosY+25;
}

void handleFireSection(){
    bgRect(firePosX,firePosY,500,600);
    fireButtonB.armed = millis()%10000>5000;
    fireButtonB.handle();
}