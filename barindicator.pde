class BarIndicator{
    float posX = 50;
    float posY = 50;
    float fill = 0.3;
    color bg = color(50);
    color fg = color(0,255,0);
    float width = 300;
    float height = 50;
    String heading = "Heading : ";
    String unit = "\tBar";
    float range = 9.81;
    boolean drawBG = false;

    void show(){
        if(this.drawBG){
            fill(120);
            strokeWeight(3);
            stroke(80);
            rect(this.posX-25,this.posY-40,this.width+50,this.height+65,20);
        }
        fill(this.bg);
        strokeWeight(3);
        stroke(0);
        rect(this.posX,this.posY,this.width,this.height);
        fill(this.fg);
        noStroke();
        rect(this.posX+3,this.posY+3,this.width*this.fill-4,this.height-5);
        fill(255);
        textAlign(LEFT,CENTER);
        textSize(25);
        text(heading+nf(float(round(this.fill*range*100))/100,0,2)+unit,this.posX,this.posY-18);
    }
    void handle(){
        //this.update();
        this.show();
    }
}