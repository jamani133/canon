float infoPosX = 1150;
float infoPosY = 620+215+50;
Indicator heartbeatI = new Indicator();
void setupInfos(){
    heartbeatI.text="Heartbeat";
    heartbeatI.posX=infoPosX+25;
    heartbeatI.posY=infoPosY+5;
    heartbeatI.textSize=20;
}

void handleInfos(){
    bgRect(infoPosX,infoPosY,500,50);
    heartbeatI.requested=heartbeat;
    heartbeatI.handle();
}