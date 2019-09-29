class Canvas{

  Image image;
  String label;
  PGraphics canvas;
  FilterTypes filter;
  MaskTypes mask;
  
  Canvas(String path, FilterTypes type){
    image = new Image(path);
    canvas = createGraphics(image.GetWidth(), image.GetHeight() + 50);
    filter = type;
    mask = null;
    
    label = type.toString();
  }
  
  Canvas(String path, MaskTypes type){
    image = new Image(path);
    canvas = createGraphics(image.GetWidth(), image.GetHeight() + 50);
    mask = type;
    filter = null;
    
    label = type.toString();
  }
  
  void Draw(){
    canvas.beginDraw();
    canvas.background(76);
    if(mask == null)
      canvas.image(image.Filtered(filter),0,0);
    else
      canvas.image(image.Mask(mask),0,0);
    canvas.text(label, 10, image.GetHeight() + 20);
    canvas.endDraw();
  }
  
  public int GetWidth(){
    return image.GetWidth();
  }
  
  public int GetHeight(){
    return image.GetHeight() + 50;
  }
}
