int x=300;
int black=7,white=2;
int j=0;

void engranajes(){
  squarelim(255);
  //fffbutton();
  image(img, 300, 145, 400, 310);
  if(on==1){
    fffbars(j);
    j++;
  }
  
  ffbutton();
}

void fffbars(int j){
  pushStyle();
  fill(0);
  noStroke();
  for(int i = 0;i <= 400;i+=black){
    rect(((i+j)%400)+300,100,black-white,400); 
  }
  popStyle();
}

void fffbutton(){
  pushStyle();
  if(ilu==5){
    fill(255,255,100);
  }else{
    fill(100,100,100);
  }
  rect(800,525,100,50);
  rect(800,425,100,50);
  popStyle();
}
