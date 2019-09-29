import processing.video.*;
Movie originalv;


Canvas original, avg, luma, edge, blur, sharpen;
Histogram hist;

void setup(){
  size(1300,700);
  
  String path = "img/sam.jpg";
  String pathv = "Lacaida.mp4";
  
  avg = new Canvas(path, FilterTypes.BW_AVG);
  luma = new Canvas(path, FilterTypes.BW_LUMA);
  edge = new Canvas(path, MaskTypes.EDGE);
  blur = new Canvas(path, MaskTypes.BLUR);
  sharpen = new Canvas(path, MaskTypes.SHARPEN);
  original = new Canvas(path, FilterTypes.NONE);
  originalv = new Movie(this, pathv);
  
  hist = new Histogram(original.image, 800, 70, 100, original.GetHeight());
}

void draw(){
  g.background(76);
  
  original.Draw();
  //avg.Draw();
  //luma.Draw();
  sharpen.Draw();
  edge.Draw();
  blur.Draw();
 
  image(original.canvas, 0, 0);
  //image(avg.canvas,avg.GetWidth(), 0);
  //image(luma.canvas,luma.GetWidth() * 2, 0);
  image(edge.canvas,edge.GetWidth() * 3, 0);
  image(blur.canvas,blur.GetWidth() * 4, 0);
  image(sharpen.canvas,sharpen.GetWidth() * 5, 0);
  
  hist.Draw();
}
