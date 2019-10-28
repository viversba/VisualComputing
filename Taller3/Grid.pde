int interval = 40;
int dotDiameter = 3;

void drawGrid(){
  pushStyle();
  stroke(255);
  // Horizontal lines
  for(int i=0; i<height ; i+= interval){
    line(0,i,width,i);
  }
  // Vertical lines
  for(int i=0; i<width ; i+= interval){
    line(i,0,i,height);
  }
  // Dots
  /*
  for(int i=0; i<width ; i+= interval){
    for(int j=0; j<height ; j+= interval){
      circle(i + interval / 2, j + interval / 2, dotDiameter);
    }
    line(0,i,width,i);
  }
  */
  
  popStyle();
}
