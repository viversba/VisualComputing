int esp = 0 , up = 1;

void puntos(){
  squarelim(0);
  tpoints();
}

void tpoints(){
  pushStyle();
  fill(50,50,100);
  if(esp==20){
    if(up==1){
      up=-1;
    }else{
      up=1;
    }
    esp=0;
  }else{
    esp++;
  }
  circle(400,300+(100*up),100);
  circle(600,300-(100*up),100);
  
  popStyle();
}
