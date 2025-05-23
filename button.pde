class Button{

    float posX = 100;
    float posY = 400;
    color baseColor = GRAY;
    boolean active = false;
    boolean prevPressed = false;
    String text = "Button";
    float textSize = 25;
    void render(){
        if(mouseInRect(this.posX,this.posY,100,40)){
            fill(this.active?pressedColor(baseColor):selectedColor(baseColor));
            stroke(40);
            strokeWeight(3);
        }else{
            fill(baseColor);
            stroke(110);
            strokeWeight(3);
        }
        rect(this.posX,this.posY,100,40);
        fill(0);
        textAlign(CENTER,CENTER);
        textSize(textSize);
        text(this.text,this.posX+50,this.posY+20);
    }
    void update(){
        if(mousePressed){
            if(mouseInRect(this.posX,this.posY,100,40)){
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