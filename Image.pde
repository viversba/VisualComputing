class Image{

  PImage img, edited;
  float r = 0.2627, gr = 0.6780, b = 0.0593;
    
  Image(String name){
    img = loadImage(name);
    edited = loadImage(name);
    
    img.loadPixels();
    edited.loadPixels();
  } 
  
  public PImage Filtered(FilterTypes effectType){
    PImage edited = img;
    
    switch(effectType){
      case BW_AVG:
        for(int i=0; i<edited.height; i++){
          for(int j=0; j<edited.width; j++){
            int pos = i*edited.width + j;
            color c = edited.pixels[pos];
            float value = (red(c) + green(c) + blue(c)) /3;
            edited.pixels[pos] = color(value); 
          }
        }
        break;
      case BW_LUMA:
        for(int i=0; i<edited.height; i++){
          for(int j=0; j<edited.width; j++){
            int pos = i*edited.width + j;
            color c = edited.pixels[pos];
            edited.pixels[pos] = color((int)(r * (float)red(c) + gr * (float)green(c) + b * (float)blue(c)));
          }
        }
        break;
    }
    
    return edited;
  }
  
  public int GetWidth(){
    return img == null ? 0 : img.width;
  }
  
  public int GetHeight(){
    return img == null ? 0 : img.height;
  }
  
  public PImage GetImage(){
    return img;
  }
}
