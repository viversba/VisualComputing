import processing.video.*;
Movie OMovie,GMovie,LMovie;

PGraphics pg;



float r = 0.2627, gr = 0.6780, b = 0.0593;
int margin=10,ancho=3,alto=1;

void setup() {
  size(1260, 320);
  OMovie = new Movie(this, "Video.mp4");
  GMovie = new Movie(this, "Video.mp4");
  LMovie = new Movie(this, "Video.mp4");
  pg = createGraphics(400,300);
  //myMovie.play();
  //myMovie.read();
}

void movieEvent(Movie OMovie) {  
  OMovie.read();
  RGB(GMovie);
  Luma(LMovie);
  //pg=pga(pg);
  
}

void draw() {
  float v=0.2;
  OMovie.volume(v);
  GMovie.volume(0);
  LMovie.volume(0);
  
  OMovie.loadPixels();
  OMovie.updatePixels();
  
  GMovie.loadPixels();
  GMovie.updatePixels();
  
  LMovie.loadPixels();
  LMovie.updatePixels();
  
  GMovie.play();
  LMovie.play();
  OMovie.play();
  fill(0, 102, 153);
  image(OMovie, margin, margin, width/ancho-2*margin, height/alto-2*margin);
  image(GMovie, (width/ancho)+margin, margin, width/ancho-2*margin, height/alto-2*margin);
  image(LMovie, (2*width/ancho)+margin, margin, width/ancho-2*margin, height/alto-2*margin);
  /*pg.beginDraw();
  //pg.pixels= myMovie.pixels;
  pg.updatePixels();
  pg.fill(150,0,100);
  pg.text(frameRate,10,10);
  pg.endDraw();
  image(pg, margin, height/2+margin , width/3-2*margin, height/2-2*margin);*/
  text(OMovie.frameRate,margin,margin);
  text(GMovie.frameRate,(width/ancho)+margin,margin);
  text(LMovie.frameRate,(2*width/ancho)+margin,margin);
}

void RGB(Movie GMovie){
  for (int x = 0; x < (GMovie.width); x++) {
    // Loop through every pixel row
    for (int y = 0; y < GMovie.height; y++) {
      // Use the formula to find the 1D location
      int loc = (x) + y * (GMovie.width);
      int totalProm = 0;
      
      float r = red(GMovie.pixels[loc]);
      float g = green(GMovie.pixels[loc]);
      float b = blue(GMovie.pixels[loc]);
      totalProm = int((0.30*r + 0.59*g + 0.11*b));
      totalProm = constrain(totalProm,0,255);
      GMovie.pixels[loc]=color(totalProm);
    }
  }
}

void Luma(Movie GMovie){
  for (int x = 0; x < (GMovie.width); x++) {
    // Loop through every pixel row
    for (int y = 0; y < GMovie.height; y++) {
      // Use the formula to find the 1D location
      int loc = (x) + y * (GMovie.width);      
      GMovie.pixels[loc] = color((int)(r*(float)red(GMovie.pixels[loc]) +gr*  (float)green(GMovie.pixels[loc]) +b* (float)blue(GMovie.pixels[loc])));
    }
  }
}

PGraphics pga(PGraphics pgx){
  for (int x = 0; x < OMovie.pixels.length; x++) {
    // Loop through every pixel row
    //for (int y = 0; y < myMovie.height; y++) {
      // Use the formula to find the 1D location
      int loc = (x);// + y * (myMovie.width);
      int totalProm = 0;
      
      float r = red(OMovie.pixels[loc]);
      float g = green(OMovie.pixels[loc]);
      float b = blue(OMovie.pixels[loc]);
      totalProm = int((0.30*r + 0.59*g + 0.11*b));
      totalProm = constrain(totalProm,0,255);
      pg.pixels[loc]=color(totalProm);
    //}
  }
  return pgx;
}
