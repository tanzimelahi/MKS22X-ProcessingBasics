int levels;
color bg,fg;
void setup(){
  size(800,600);
  levels=1;
}
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    if (levels==0){
      //fill(255,0,0);
      triangle(v1x,v1y,v2x,v2y,v3x,v3y);
    }
    
    else{
    fill(255,0,0);
    triangle(v1x,v1y,v2x,v2y,v3x,v3y);
    fill(255);
    triangle((v1x+v2x)/2,(v1y+v2y)/2,(v2x+v3x)/2,(v2y+v3y)/2,(v1x+v3x)/2,(v1y+v3y)/2);
    fill(255,0,0);
    gasket(levels-1,(v1x+v2x)/2,(v1y+v2y)/2,(v2x+v3x)/2,(v2y+v3y)/2,v2x,v2y);
    gasket(levels-1,(v2x+v3x)/2,(v2y+v3y)/2,v3x,v3y,(v3x+v1x)/2,(v3y+v1y)/2);
    gasket(levels-1,v1x,v1y,(v1x+v2x)/2,(v1y+v2y)/2,(v1x+v3x)/2,(v1y+v3y)/2);
    }
}
  void draw() { 
  background(50);  
  
  fill(255);

  gasket(levels,0, height-10, width, height-10, width/2, 10);
}
