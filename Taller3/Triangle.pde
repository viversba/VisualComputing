PVector P1 = new PVector(40, 400), 
  P2 = new PVector(200, 50), 
  P3 = new PVector(600, 300);
  
int selected = 0;

void drawTriangle(){
  moveVertex();
  
  pushStyle();
  stroke(0,220,0);
  strokeWeight(2);
  P1 = adjustCoordinatesToGrid(P1);
  P2 = adjustCoordinatesToGrid(P2);
  P3 = adjustCoordinatesToGrid(P3);
  line(P1.x, P1.y, P2.x, P2.y);
  line(P2.x, P2.y, P3.x, P3.y);
  line(P3.x, P3.y, P1.x, P1.y);
  pushStyle();
}

PVector adjustCoordinatesToGrid(PVector v){
  float x = v.x - (v.x % interval) + (interval/2);
  float y = v.y - (v.y % interval) + (interval/2);
  return new PVector(x,y);
}

boolean isInSquare(PVector vertex, int xSquare, int ySquare){
  return (abs(vertex.x - xSquare) <= interval/2) || 
    (abs(vertex.y - ySquare) <= interval/2);
}

void moveVertex(){
  if(selected == 1)
    P1 = new PVector(mouseX, mouseY);
  else if(selected == 2)
    P2 = new PVector(mouseX, mouseY);
  else if(selected == 3)
    P3 = new PVector(mouseX, mouseY);
}

void mousePressed(){
  if(isInSquare(P1, mouseX, mouseY))
    selected = 1;
  else if(isInSquare(P2, mouseX, mouseY))
    selected = 2;
  else if(isInSquare(P3, mouseX, mouseY))
    selected = 3;
  else
    selected = 0;
}

void mouseReleased(){
  selected = 0;
}
