class PlasmaIndicator{
    float posX = 500;
    float posY = 200;
    boolean active = false;
    void render(){
        
        stroke(120);
        strokeWeight(2);
        fill(20);
        rect(this.posX,this.posY,100,50,25);
        fill(160);
        noStroke();
        ellipse(this.posX+5,this.posY+25,10,5);
        ellipse(this.posX+95,this.posY+25,10,5);
        stroke(120);
        strokeWeight(2);
        noFill();
        rect(this.posX,this.posY,100,50,25);
        this.active=keyPressed;
        if(this.active){
            stroke(200,200,255);
            strokeWeight(sqr(random(1,2)));
            int n = 6;
            float y = 0;
            float yn = sqrs(random(-4,4));
            for(int i = 0; i < n-1; i++){
                line(this.posX+10+(100/n*i),posY+25+y,this.posX+10+(100/n*(i+1)),posY+25+yn);
                y = yn;
                yn = sqrs(random(-4,4));
                if(i==n-3){
                    yn=0;
                }
            }
        }
    }
}

float sqr(float a){
    return a*a;
}

float sqrs(float a){
    return a<0?-a*a:a*a;
}