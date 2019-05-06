import java.util.Arrays;
int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  int boxW=(int)random(400,600);
  int boxH=(int)random(200,400);
 // this.MAX_VALUE=boxH/2;
  //this.MIN_VALUE=boxH/2*-1;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    int size=(int)random(1,41);
    values = new float[size];
    speeds = new float[size];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, boxW, boxH);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+boxH/2, x+boxW, y+boxH/2);
    //Width of the visualizer is 400!
    float width=(float)boxW/(values.length);
    float tempX=x;
    float tempY=y+boxH/2;
    for(int i=0;i<values.length;i++){
      if(values[i]>=-boxH/2 && values[i]<0){
        int constant=-1*boxH/2;
        fill(255,165+330/boxH*values[i],0);
        rect(tempX,tempY,width,-values[i]);
      }
      else if(values[i]>=0 && values[i]<boxH/4){
      fill(255,165+320/boxH*values[i],0);
      rect(tempX,tempY,width,-values[i]);
    }
    else if(values[i]>=boxH/4 && values[i]<=boxH/2){
      fill(-900/boxH*values[i]+450,255,0);
      rect(tempX,tempY,width,-values[i]);
    }
    tempX+=width;
    }
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      if(values[i]>=boxH/2){
        values[i]=boxH/2;
        speeds[i]=-1*speeds[i];
      }
      else if(values[i]<=-boxH/2){
        values[i]=-boxH/2;
        speeds[i]=-1*speeds[i];
      }
      
  }
}
}

void setup() {
  size(600, 600);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
  

  
 // v.update();
  
}
