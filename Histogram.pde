class Histogram{
  
  int[] data_r, data_g, data_b;
  int w, h, x, y;
  
  Histogram(Image img, int x, int y){
    this(img, 300, 200, x, y);
  }
  
  Histogram(Image img, int w, int h, int x, int y){
    
    PImage image = img.GetImage();
    this.data_r = new int[256];
    this.data_g = new int[256];
    this.data_b = new int[256];
    
    for(int i: data_r) i=0;
    for(int i: data_g) i=0;
    for(int i: data_b) i=0;
    
    image.loadPixels();
    for(color c: image.pixels){
      int pos = c >> 16 & 0xFF;
      data_r[pos] += 1;
      
      pos = c & 0xFF;
      data_g[pos] += 1;
      
      pos = c >> 8 & 0xFF; 
      data_b[pos] += 1;
    }
    
    this.w = w/256; 
    this.h = h;
    this.x = x;
    this.y = y;
    
    NormalizeBars();
  }
  
  void NormalizeBars(){
  
    for (int i=0; i < data_r.length; i++) { 
      pushStyle();
      noFill();
      
      int barHeight = map(data_r[i], 0, 255, 0, h);
      data_r[i] = barHeight;
      
      barHeight = map(data_g[i], 0, 255, 0, h);
      data_g[i] = barHeight;
      
      barHeight = map(data_b[i], 0, 255, 0, h);
      data_b[i] = barHeight;
      
      popStyle();
    }
  }
  
  void Draw() { 
    int barWidth = 2;
    for (int i=0; i < data_r.length; i++) { 
      pushStyle();
      noFill();
      
      stroke(200, 0, 0, 80);
      rect((i*w) + x, y, barWidth, data_r[i]);
      
      stroke(0, 200, 0, 80);
      rect((i*w) + x, y, barWidth, data_g[i]);
      
      stroke(0, 0, 200, 80);
      rect((i*w) + x, y, barWidth, data_b[i]);
      
      popStyle();
    }
  }
  
  int map(int x, int in_min, int in_max, int out_min, int out_max)
  {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
  }
}
