class FireButton{
    float posX = 0;
    float posY = 0;
    boolean active = false;
    boolean armed = false;
    PImage background = null;
    boolean prevPressed = false;
    boolean prevActive = false;
    void render(){
        if(background != null){
            image(background,this.posX,this.posY,450,450);
        }
        if(this.armed){
            if(this.active){
                fill(requestedColor(RED));
            }else{
                fill(RED);
            }
        }else{
            fill(inactiveColor(RED));
        }
        stroke(0);
        strokeWeight(mouseIn(this.posX+225,this.posY+225,175)?5:1);
        ellipse(this.posX+225,this.posY+225,350,350);
        if(this.armed){
            fill(100,0,0);
            textSize(120);
            textAlign(CENTER,CENTER);
            text("FIRE",this.posX+225,this.posY+225);
        }else{
            fill(75,0,0);
            textSize(70);
            textAlign(CENTER,CENTER);
            text("DISARMED",this.posX+225,this.posY+225);
            fill(120,120,120,120);
            stroke(120);
            strokeWeight(4);
            rect(this.posX+25,this.posY+25,399,399,40);
        }
        noFill();
        stroke(90);
        strokeWeight(8);
        rect(this.posX,this.posY,450,450,5);
    }
    void update(){
        this.prevActive = this.active;
        if(mousePressed){
            if(mouseIn(this.posX+225,this.posY+225,175)){
                if(!this.prevPressed){
                    active = true;
                }
            }else{
                active = false;
            }
        }else{
            active = false;
        }
        this.prevPressed = mousePressed;
    }

    void handle(){
        this.update();
        this.render();
    }
}