class Image{

  PImage img, edited, masked;
  float r = 0.2627, gr = 0.6780, b = 0.0593;
    
  Image(String name){
    img = loadImage(name);
    edited = loadImage(name);
    masked = loadImage(name);
    
    img.loadPixels();
    edited.loadPixels();
    masked.loadPixels();
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
  
  public PImage Mask(MaskTypes mask){
    
    float[][] maskArray;
    
    switch(mask){
      case EDGE:
        maskArray = Masks.Edge;
        break;
      case BLUR:
        maskArray = Masks.Blur;
        break;
      case SHARPEN:
        maskArray = Masks.Sharpen;
        break;
      default:
        maskArray = new float[3][3];
        break;
    }
    
    int matrixsize = 3;
    for (int x = 0; x < masked.width; x++) {
      for (int y = 0; y < masked.height; y++ ) {
        color c = Convolution(x, y, maskArray, matrixsize);
        int loc1 = (x) + (y) *masked.width;
        masked.pixels[loc1] = c;
      }
    }
    return this.masked;
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
  
  color Convolution(int x, int y, float[][] matrix, int matrixsize)
  {
    float rtotal = 0.0;
    float gtotal = 0.0;
    float btotal = 0.0;
    int offset = matrixsize / 2;
    for (int i = 0; i < matrixsize; i++){
      for (int j= 0; j < matrixsize; j++){
        // What pixel are we testing
        int xloc = x+i-offset;
        int yloc = y+j-offset;
        int loc = xloc + img.width*yloc;
        // Make sure we haven't walked off our image, we could do better here
        loc = constrain(loc,0,img.pixels.length-1);
        // Calculate the convolution
        rtotal += (red(img.pixels[loc]) * matrix[i][j]);
        gtotal += (green(img.pixels[loc]) * matrix[i][j]);
        btotal += (blue(img.pixels[loc]) * matrix[i][j]);
      }
    }
    // Make sure RGB is within range
    rtotal = constrain(rtotal, 0, 255);
    gtotal = constrain(gtotal, 0, 255);
    btotal = constrain(btotal, 0, 255);
    
    
    // Return the resulting color
    return color(rtotal,gtotal,btotal);
  }
}
