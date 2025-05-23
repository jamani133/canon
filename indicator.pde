class Indicator{
    float posX = 200;
    float posY = 500;
    boolean active = false;
    boolean requested = false;
    color baseColor = YELLOW;
    String text = "Indicator";
    float textSize = 25;

    void render(){ 
        if(this.active){
            fill(this.baseColor);
        }else{
            fill(inactiveColor(this.baseColor));
        }
        if(this.requested){
            stroke(requestedColor(this.baseColor));
        }else{
            stroke(110);
        }
        strokeWeight(3);
        rect(this.posX,this.posY,100,40,14);
        fill(0);
        textAlign(CENTER,CENTER);
        textSize(this.textSize);
        text(this.text,this.posX+50,this.posY+20);
    }

    void handle(){
        this.render();
    }
}