boolean within(float a, float b, float range){
    if(a>b+range){return false;}
    if(a<b-range){return false;}
    return true;
}

boolean mouseIn(float x, float y, float r){
    float dx = abs(mouseX-x);
    float dy = abs(mouseY-y);
    return sqrt((dx*dx)+(dy*dy)) <= r;
}

float sqr(float a){
    return a*a;
}

float sqrs(float a){
    return a<0?-a*a:a*a;
}