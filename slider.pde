class TargetSlider{
    float posX = 10;
    float posY = 10;
    float fill = 0.3;
    color bg = color(50);
    color fg = color(0,255,0);
    float width = 300;
    float height = 50;
    color slideColor = color(255,0,0);
    float setpoint = 0.7;
    boolean dragging = false;
    boolean focused = false;
    boolean prevPressed = false;
    float textFieldSize = 75;
    float textFieldSizeF = 120;
    float range = 1;
    String unit = "MPa";
    int round = 10;
    int roundF = 100;
    String heading = "Pressure : ";
    void setup(float x, float y, float w, float h){
        this.posX=x;
        this.posY=y;
        this.width=w;
        this.height=h;
    }
    void show(){
        fill(120);
        strokeWeight(3);
        stroke(80);
        rect(this.posX-25,this.posY-40,this.width+50,this.height+95,20);

        fill(this.bg);
        strokeWeight(3);
        stroke(0);
        rect(this.posX,this.posY,this.width,this.height);
        fill(this.fg);
        rect(this.posX,this.posY,this.width*this.fill,this.height);
        fill(slideColor);
        stroke(slideColor);
        strokeWeight(2);
        line(this.width*this.setpoint+this.posX,this.posY,this.width*this.setpoint+this.posX,this.posY+this.height);
        this.focused=mouseIn(this.width*this.setpoint+this.posX,this.height+this.posY+20,30);
        if(!this.dragging && !this.focused){
            noStroke();
        }else{
            stroke(0);
        }
        
        triangle(this.width*this.setpoint+this.posX, this.height+this.posY, this.width*this.setpoint+this.posX-8, this.height+this.posY+10, this.width*this.setpoint+this.posX+8, this.height+this.posY+10);
        
        strokeWeight(2);
        if(!focused && !dragging){
            fill(160);
            stroke(110);
            rect(max(min(this.setpoint*this.width-(this.textFieldSize/2),this.width-this.textFieldSize),0)+this.posX,this.posY+this.height+15,this.textFieldSize,30);
            fill(0);
            textAlign(CENTER,CENTER);
            textSize(20);
            text(str(float(round(round*this.setpoint*this.range))/round)+this.unit,   max(min(this.setpoint*this.width,this.width-(this.textFieldSize/2)),(this.textFieldSize/2))+this.posX,this.posY+this.height+30);
        }else{
            fill(160,160,190);
            stroke(40);
            rect(max(min(this.setpoint*this.width-(this.textFieldSizeF/2),this.width-this.textFieldSizeF),0)+this.posX,this.posY+this.height+15,this.textFieldSizeF,40);
            fill(0);
            textAlign(CENTER,CENTER);
            textSize(30);
            text(str(float(round(roundF*this.setpoint*this.range))/roundF)+this.unit,   max(min(this.setpoint*this.width,this.width-(this.textFieldSizeF/2)),(this.textFieldSizeF/2))+this.posX,this.posY+this.height+35);
        }
        fill(255);
        textAlign(LEFT,CENTER);
        textSize(25);
        text(heading+nf(float(round(this.fill*range*100))/100,0,2)+unit,this.posX,this.posY-18);
    }
    void update(){
        if(mousePressed && !this.prevPressed){
            if(mouseIn(this.width*this.setpoint+this.posX,this.height+this.posY+10,30)){
                this.dragging = true;
            }
        }
        if(!mousePressed){
            this.dragging=false;
        }
        if(this.dragging){
            this.setpoint=max(0,min(1,map(mouseX,this.posX,this.posX+this.width,0,1)));
        }
        this.prevPressed = mousePressed;
    }
    void handle(){
        this.update();
        this.show();
    }
}