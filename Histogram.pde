class Histogram{
  
  int[] data_r, data_g, data_b;
  public int w, h, x, y, limitBarWidth, colorBarSeparation;
  public int posR_1, posR_2, posG_1, posG_2, posB_1, posB_2;
  public int barWidth;
  int posYR, posYG, posYB;
  int dragOffsetX, dragOffsetY;
  boolean selected;
  Handles handle;
  
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
      
      color argb = c;
      int r = (argb >> 16) & 0xFF;
      int g = (argb >> 8) & 0xFF;
      int b = argb & 0xFF;
      
      data_r[r] += 1;

      data_g[g] += 1;

      data_b[b] += 1;
    }
    
    this.limitBarWidth = (255*2); 
    this.colorBarSeparation = 20;
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    
    this.posR_1 = x;
    this.posG_1 = x;
    this.posB_1 = x;
    
    this.posR_2 = (x + limitBarWidth);
    this.posG_2 = (x + limitBarWidth);
    this.posB_2 = (x + limitBarWidth);
    
    this.posYR = y + h +colorBarSeparation;
    this.posYG = y + h +colorBarSeparation * 2;
    this.posYB = y + h +colorBarSeparation * 3;
    
    handle = null;
    selected = false;
    dragOffsetX = 0;
    dragOffsetY = 0;
    
    barWidth = 2;
    
    NormalizeBars();
  }
  
  void NormalizeBars(){
  
    for (int i=0; i < data_r.length; i++) { 
      pushStyle();
      noFill();
      
      int barHeight = map(data_r[i], 0, 700, 0, h);
      barHeight = barHeight > h ? h : barHeight;
      data_r[i] = barHeight;
      
      barHeight = map(data_g[i], 0, 700, 0, h);
      barHeight = barHeight > h ? h : barHeight;
      data_g[i] = barHeight;
      
      barHeight = map(data_b[i], 0, 700, 0, h);
      barHeight = barHeight > h ? h : barHeight;
      data_b[i] = barHeight;
      
      popStyle();
    }
  }
  
  void Draw() { 
    for (int i=0; i < data_r.length; i++) { 
      pushStyle();
      noFill();
      
      stroke(200, 0, 0, 80);
      rect((i*barWidth) + x, y, barWidth, data_r[i]);
      
      stroke(0, 200, 0, 80);
      rect((i*barWidth) + x, y, barWidth, data_g[i]);
      
      stroke(0, 0, 200, 80);
      rect((i*barWidth) + x, y , barWidth, data_b[i]);
      
      popStyle();
    }
    
    // Draw Sliders
    pushStyle();
    
    stroke(50);
    fill(200, 0, 0, 80);
    rect(x, posYR, limitBarWidth, 3);
    fill(0, 200, 0, 80);
    rect(x, posYG, limitBarWidth, 3);
    fill(0, 0, 200, 80);
    rect(x, posYB, limitBarWidth, 3);
    
    popStyle();
    
    pushStyle();
    fill(88);
    rect(posR_1, posYR, 8, 15);
    rect(posR_2, posYR, 8, 15);
    rect(posG_1, posYG, 8, 15);
    rect(posG_2, posYG, 8, 15);
    rect(posB_1, posYB, 8, 15);
    rect(posB_2, posYB, 8, 15);
    popStyle();
  }
  
  public void mousePressed(){
    if(mouseY - posYR < 15 && mouseY - posYR > 0){
      if(mouseX - posR_1 < 8 && mouseX - posR_1 > 0){
        dragOffsetX = mouseX - posR_1;
        selected = true;
        handle = Handles.RLEFT;
      }
      if(mouseX - posR_2 < 8 && mouseX - posR_2 > 0){
        dragOffsetX = mouseX - posR_2;
        selected = true;
        handle = Handles.RRIGHT;
      }
    }
    if(mouseY - posYG < 15 && mouseY - posYG > 0){
      if(mouseX - posG_1 < 8 && mouseX - posG_1 > 0){
        dragOffsetX = mouseX - posG_1;
        selected = true;
        handle = Handles.GLEFT;
      }
      if(mouseX - posG_2 < 8 && mouseX - posG_2 > 0){
        dragOffsetX = mouseX - posG_2;
        selected = true;
        handle = Handles.GRIGHT;
      }
    }
    if(mouseY - posYB < 15 && mouseY - posYB > 0){
      if(mouseX - posB_1 < 8 && mouseX - posB_1 > 0){
        dragOffsetX = mouseX - posB_1;
        selected = true;
        handle = Handles.BLEFT;
      }
      if(mouseX - posB_2 < 8 && mouseX - posB_2 > 0){
        dragOffsetX = mouseX - posB_2;
        selected = true;
        handle = Handles.BRIGHT;
      }
    }
  }
  
  public void mouseReleased(){
    selected = false;
    handle = null;
  }
  
  public void mouseDragged(){
    
    if(selected && handle != null){
      switch(handle){
        case RRIGHT:
          posR_2 = mouseX - dragOffsetX;
          if(mouseX - dragOffsetX <= posR_1 + 8)
            posR_2 = posR_1 + 8;
          if(mouseX - dragOffsetX >= x + limitBarWidth )
            posR_2 = x + limitBarWidth;
          break;
        case RLEFT:
          posR_1 = mouseX - dragOffsetX;
          if(mouseX - dragOffsetX < x)
            posR_1 = x;
          if(mouseX - dragOffsetX >= posR_2 - 8)
            posR_1 = posR_2 - 8;
          break;
        case GRIGHT:
          posG_2 = mouseX - dragOffsetX;
          if(mouseX - dragOffsetX <= posG_1 + 8)
            posG_2 = posG_1 + 8;
          if(mouseX - dragOffsetX >= x + limitBarWidth )
            posG_2 = x + limitBarWidth;
          break;
        case GLEFT:
          posG_1 = mouseX - dragOffsetX;
          if(mouseX - dragOffsetX < x)
            posG_1 = x;
          if(mouseX - dragOffsetX >= posG_2 - 8)
            posG_1 = posG_2 - 8;
          break;
        case BRIGHT:
          posB_2 = mouseX - dragOffsetX;
          if(mouseX - dragOffsetX <= posB_1 + 8)
            posB_2 = posB_1 + 8;
          if(mouseX - dragOffsetX >= x + limitBarWidth )
            posB_2 = x + limitBarWidth;
          break;
        case BLEFT:
          posB_1 = mouseX - dragOffsetX;
          if(mouseX - dragOffsetX < x)
            posB_1 = x;
          if(mouseX - dragOffsetX >= posB_2 - 8)
            posB_1 = posB_2 - 8;
          break;
      }
    }
  }
  
  int map(int x, int in_min, int in_max, int out_min, int out_max)
  {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
  }
}

public enum Handles{
  RRIGHT,
  RLEFT,
  GRIGHT,
  GLEFT,
  BRIGHT,
  BLEFT
}
