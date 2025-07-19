boolean within(float a, float b, float range){
    if(a>b+range){return false;}
    if(a<b-range){return false;}
    return true;
}

boolean mouseIn(float x, float y, float r){
    float dx = abs(mouseX-x);
    float dy = abs(mouseY-y);
    return sqrt(sqr(dx)+sqr(dy)) <= r;
}

boolean mouseInRect(float x, float y, float w, float h){
    return mouseX<x+w&&mouseX>=x&&mouseY<y+h&&mouseY>=y;
}

float sqr(float a){
    return a*a;
}

float sqrs(float a){
    return a<0?-a*a:a*a;
}

color selectedColor(color inC){
    return(color( max(0,red(inC)-10),max(green(inC)-10,0),min(255,blue(inC)+30)));
}

color pressedColor(color inC){
    return(color(    max(0,(red(inC)-10)/1.2)   ,     max((green(inC)-10)/1.2,0),     min(255,(blue(inC)+30)/1.2)     ));
}

color inactiveColor(color inC){
    return(color(    max(0,(red(inC))/2)   ,     max((green(inC))/2,0),     min(255,(blue(inC))/2)     ));
}

color requestedColor(color inC){
    return(color(    min(255,(red(inC))*1.3)   ,     min((green(inC))*1.3,255),     min(255,(blue(inC))*1.3)     ));
}

float valToMPa(int val){
    float linear = map(val,0,430,0,0.282);
    return linear>0?linear+0.05:0;
}