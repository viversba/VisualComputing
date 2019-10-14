int quad = 50;
int half = quad / 2;
int weig = half / 2;

void cuadros(){
  squarelim(0);
  pushStyle();
  strokeCap(SQUARE);
  strokeWeight(weig);
  stroke(100);
  fvlines();
  fhlines();
  popStyle();
  pushStyle();
  strokeWeight(weig);
  stroke(255);
  fcircles();
  popStyle();
}

void squarelim(int col){
  pushStyle();
  fill(col);
  stroke(0);
  square(300,100,400);
  popStyle();
}

void fhlines(){
  for(int i = 100+half;i <= 500;i+=quad){
    line(300,i,700,i);
  }
}

void fvlines(){
  for(int i = 300+half;i <= 700;i+=quad){
    line(i,100,i,500);
  }
}

void fcircles(){
  fill(255);
  for(int i = 300+half;i <= 700;i+=quad){
    for(int j = 100+half;j <= 500;j+=quad){
      circle(i,j,sqrt(2*pow(weig/2,2)));
    }
  }
}
