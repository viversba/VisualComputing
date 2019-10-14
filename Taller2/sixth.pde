int increment_1 = 0;
int increment_2 = 10;
boolean increasing_1 = true;
boolean increasing_2 = true;

int posX1_l1 = 520, posY1_l1 = 180, posX2_l1 = 620, posY2_l1 = 280;
int posX1_l2 = 380, posY1_l2 = 320, posX2_l2 = 480, posY2_l2 = 420;

int posX1_l3 = 380, posY1_l3 = 280, posX2_l3 = 480, posY2_l3 = 180;
int posX1_l4 = 520, posY1_l4 = 420, posX2_l4 = 620, posY2_l4 = 320;


void sslines(){
  squarelim(76);
  AngledLines();
  if(on==1){
    angledSquares();
  }
  
  ffbutton();
}

void AngledLines(){
  
  if(increasing_1){
    if (increment_1 < 20) increment_1++;
    else increasing_1 = false;
  }
  else{
    if (increment_1 > -20) increment_1--;
    else increasing_1 = true;
  }
  
  if(increasing_2){
    if (increment_2 < 20) increment_2++;
    else increasing_2 = false;
  }
  else{
    if (increment_2 > -20) increment_2--;
    else increasing_2 = true;
  }
  
  line(posX1_l1 + increment_1, posY1_l1 - increment_1, posX2_l1 + increment_1, posY2_l1 - increment_1);
  line(posX1_l2 + increment_1, posY1_l2 - increment_1, posX2_l2 + increment_1, posY2_l2 - increment_1);
  line(posX1_l3 - increment_2, posY1_l3 - increment_2, posX2_l3 - increment_2, posY2_l3 - increment_2);
  line(posX1_l4 - increment_2, posY1_l4 - increment_2, posX2_l4 - increment_2, posY2_l4 - increment_2);
}

void angledSquares(){

  translate(400, 300);
  rotate(PI/4.0);
  rect(-60, -20, 80, 80);
  rotate(-PI/4.0);
  translate(-400, -300);
  
  translate(600, 300);
  rotate(PI/4.0);
  rect(-20, -60, 80, 80);
  rotate(-PI/4.0);
  translate(-600, -300);
  
  translate(500, 200);
  rotate(PI/4.0);
  rect(-60, -60, 80, 80);
  rotate(-PI/4.0);
  translate(-500, -200);
  
  translate(500, 400);
  rotate(PI/4.0);
  rect(-20, -20, 80, 80);
  rotate(-PI/4.0);
  translate(-500, -400);
}
