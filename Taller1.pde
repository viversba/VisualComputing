Canvas original, avg, luma;
Histogram hist;

void setup(){
  size(1000,700);
  
  String path = "img/bonsai.jpg";
  
  avg = new Canvas(path, FilterTypes.BW_AVG);
  luma = new Canvas(path, FilterTypes.BW_LUMA);
  original = new Canvas(path, FilterTypes.NONE);
  
  hist = new Histogram(original.image, 800, 70, 100, original.GetHeight());
}

void draw(){
  g.background(76);
  
  original.Draw();
  avg.Draw();
  luma.Draw();
  
  image(original.canvas, 0, 0);
  image(avg.canvas,avg.GetWidth(), 0);
  image(luma.canvas,luma.GetWidth() * 2, 0);
  
  hist.Draw();
}
