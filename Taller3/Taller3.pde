boolean drgr=true;

void setup(){
  size(900,600);
  background(20);
}

void draw(){
  background(20);
  if(drgr)
    drawGrid();
  rasterTriangle();
  drawTriangle();
}

void keyPressed(){
  if(key == 'a')
    antialias = !antialias;
  else if(key == '-')
    interval = interval >= 50 ? 50 : interval + 5;
  else if(key == '+')
    interval = interval <= 5 ? 5 : interval - 5;
  else if(key == 'q'){
    antiAliasFactor = antiAliasFactor >= 10 ? 10 : antiAliasFactor + 1; println("anti factor " + antiAliasFactor);}
  else if(key == 'w'){
    antiAliasFactor = antiAliasFactor <= 2 ? 2 : antiAliasFactor - 1; println("anti factor " + antiAliasFactor);}
  else if(key == 'g')
    if(drgr)
      drgr=false;
    else
      drgr=true;
}
