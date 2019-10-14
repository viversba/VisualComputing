int pos=0;
void lineas(){
  squarelim(0);
  for(int i = 6;i <= 13;i+=2){
    smsquares(i);
  }
  shlines();
}

void smsquares(int i){
  for(int j = 100;j < 500;j+=50){
    pushStyle();
    fill(255);
    square((i*50)+pos,j,50);
    popStyle();
    if(pos==0){
      pos=10;
    }else{
      pos=0;
    }
  }
}

void shlines(){
  for(int i = 100;i <= 500;i+=quad){
    pushStyle();
    stroke(100);
    strokeCap(SQUARE);
    strokeWeight(2);
    line(300,i,700,i);
    popStyle();
  }
}
