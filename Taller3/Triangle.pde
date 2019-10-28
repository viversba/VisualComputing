PVector P1 = new PVector(40, 400), 
  P2 = new PVector(200, 50), 
  P3 = new PVector(600, 300);
  
int selected = 0;

float re,gr,bl,x,y;

void drawTriangle(){
  moveVertex();
  text("p1",P1.x,P1.y);
  text("p2",P2.x,P2.y);
  text("p3",P3.x,P3.y);
  pushStyle();
  stroke(0,220,0);
  strokeWeight(2);
  //P1 = adjustCoordinatesToGrid(P1);
  //P2 = adjustCoordinatesToGrid(P2);
  //P3 = adjustCoordinatesToGrid(P3);
  
  float m12=(P2.y-P1.y)/(P2.x-P1.x);
  for(x=P1.x;x<=P2.x;x++){
    y=(m12*x)+(P1.y-(m12*P1.x));
    gr=(255/(P2.x-P1.x))*(x-P1.x);
    re=(255/(P2.x-P1.x))*(P2.x-x);
    bl=0;
    stroke(re, gr, bl);
    point(x,(m12*x)+(P1.y-(m12*P1.x)));
  }
  float m13=(P3.y-P1.y)/(P3.x-P1.x);
  for(x=P1.x;x<=P3.x;x++){
    y=(m13*x)+(P1.y-(m13*P1.x));
    bl=(255/(P3.x-P1.x))*(x-P1.x);
    gr=0;
    re=(255/(P3.x-P1.x))*(P3.x-x);
    stroke(re, gr, bl);
    point(x,(m13*x)+(P1.y-(m13*P1.x)));
  }
  float m23=(P3.y-P2.y)/(P3.x-P2.x);
  for(x=P2.x;x<=P3.x;x++){
    y=(m23*x)+(P2.y-(m23*P2.x));
    re=0;
    bl=(255/(P3.x-P2.x))*(x-P2.x);
    gr=(255/(P3.x-P2.x))*(P3.x-x);
    stroke(re, gr, bl);
    point(x,(m23*x)+(P2.y-(m23*P2.x)));
  }
  
  
  
  //line(P1.x, P1.y, P2.x, P2.y);
  //line(P2.x, P2.y, P3.x, P3.y);
  //line(P3.x, P3.y, P1.x, P1.y);
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
