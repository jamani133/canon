class Joystick{
    float size = 200;
    float posX = 400;
    float posY = 400;
    float joyX = 0;
    float joyY = 0;
    boolean dragging = false;
    boolean prevPress = false;
    void render(){
        stroke(80);
        strokeWeight(3);
        fill(120);
        rect(this.posX,this.posY,this.size,this.size,20);
        noStroke();
        fill(160);
        ellipse(this.posX+(this.size/2), this.posY+(this.size/2), this.size/10*8, this.size/10*8);
        fill(200,0,0);
        ellipse(this.posX+(this.size/2)+((this.size*0.25)*this.joyX),this.posY+(this.size/2)+((this.size*0.25)*this.joyY),this.size*0.3,this.size*0.3);
    }
    void update(){
        if(mouseIn(this.posX+(this.size/2),this.posX+(this.size/2),this.size/10*4)){
            if(mousePressed && !this.prevPress){
                this.dragging = true;
            }
        }
        if(!mousePressed){
                this.dragging = false;
        }
        if(this.dragging){
            float dx = (mouseX-(this.posX+(this.size/2)))/(this.size/4);
            float dy = (mouseY-(this.posY+(this.size/2)))/(this.size/4);
            float d = sqrt((dx*dx)+(dy*dy));
            if(d>1){
                dy = dy/d;
                dx = dx/d;
            }
            
            joyX = dx;
            joyY = dy;
        }else{
            joyX = 0;
            joyY = 0;
        }
        this.prevPress = mousePressed;
    }
    void handle(){
        this.update();
        this.render();
    }
}