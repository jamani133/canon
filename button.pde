class Button{

    float posX = 100;
    float posY = 400;

    void render(){
        if(mouseIn(this.posX+50,this.posY+20,40)){
            fill(160,160,190);
            stroke(40);
            strokeWeight(3);
        }else{
            fill(160);
            stroke(110);
            strokeWeight(3);
        }
        rect(this.posX,this.posY,100,40);
        fill(0);
        textAlign(CENTER,CENTER);
        textSize(30);
        text("Button",this.posX+50,this.posY+20);
    }
    void update(){

    }

    void handle(){
        this.update();
        this.render();
    }
}