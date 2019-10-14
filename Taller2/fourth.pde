int right = 1;
int on = 1;

void carros(){
  squarelim(0);
  if(on==1){
    ffbars();
  }else{
    squarelim(100);
  }
  ffcars();
  
  ffbutton();
}

void ffcars(){
  pushStyle();
  fill(50,50,100);
  if(right<350){
    right++;
  }else{
    right=1;
  }
  fill(0);
  noStroke();
  rect(300+right,268,50,25);
  fill(255);
  rect(300+right,308,50,25);
  popStyle();
}

void ffbars(){
  for(int j = 300;j < 700;j+=50){
    pushStyle();
    fill(255);
    noStroke();
    rect(j,100,25,400);
    popStyle();
  }
}

void ffbutton(){
  pushStyle();
  fill(100,100,100);
  rect(300,525,400,50);
  popStyle();
}
