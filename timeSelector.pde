class ValSlider{
    
    float posX = 500;
    float posY = 300;
    float value = 0;
    float range = 10;
    String unit = "S";
    float mouseStartX = 0;
    boolean dragging = false;
    boolean prevPress = false;
    float valueOffset = 0;
    color baseColor = GRAY;
    void render(){
        if(this.dragging||mouseInRect(this.posX,this.posY,100,40)){
            fill(this.dragging?pressedColor(baseColor):selectedColor(baseColor));
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
        textSize(30);
        text(nf(round(40*this.value*this.range)/40.0,0,2)+this.unit,this.posX+50,this.posY+20);
    }
    void update(){
        if(mouseInRect(this.posX,this.posY,100,40)){
            if(mousePressed && !this.prevPress){
                this.dragging = true;
                this.mouseStartX = mouseX;
                this.valueOffset = this.value;
            }
        }
        if(!mousePressed){
            this.dragging = false;
        }
        if(dragging){
            this.value = min(1,max(0,round(40.0*(this.valueOffset+((mouseX-mouseStartX)/400)))/40.0));
        }

        this.prevPress = mousePressed;
    }

    void handle(){
        this.update();
        this.render();
    }
}