import java.util.*;

int ilu = 0;
PImage img;

void setup(){
  size(1000,600);
  img = loadImage("Image.jpg");  
}

void draw(){
  background(200);
  menu();
  //text(black,50,50);
}

void menu(){
  pushStyle();
  fill(255);
  buttons();
  popStyle();
  if(ilu==0){
  }else if(ilu==1){
    cuadros();
  }else if(ilu==2){
    lineas();
  }else if(ilu==3){
    puntos();
  }else if(ilu==4){
    carros();
  }else if(ilu==5){
    engranajes();
  }else if(ilu==6){
    sslines();
  }
}

void mouseClicked(){
  menu();
  if(mouseX<=100&&mouseX>=50){
    if(mouseY<=100&&mouseY>=50){
      ilu=1;
        on=1;
    }else if(mouseY<=175&&mouseY>=125){
      ilu=2;
        on=1;
    }else if(mouseY<=250&&mouseY>=200){
      ilu=3;
        on=1;
    }else if(mouseY<=325&&mouseY>=275){
      ilu=4;
        on=1;
    }else if(mouseY<=400&&mouseY>=350){
      ilu=5;
        on=1;
    }else if(mouseY<=475&&mouseY>=425){
      ilu=6;
        on=1;
    }
  }else if(mouseX<=700&&mouseX>=300){
    if(mouseY<=575&&mouseY>=525){
      if(on==1){
        on=0;
      }else{
        on=1;
      }
    }
  }  
  else if(mouseX<=900&&mouseX>=800){
    if(mouseY<=575&&mouseY>=525){
      if(black==20){
        black=3;
      }else{
        black++;
      }
    }else if(mouseY<=475&&mouseY>=425){
      if(white==black){
        white=0;
      }else{
        white++;
      }
    }
  }
}

void buttons(){
  for(int i = 50;i <= 450;i+=75){
    fill(255);
    square(50,i,50);
    fill(0);
    textSize(20);
    text((i/75)+1,65,i+35);
  }
}
