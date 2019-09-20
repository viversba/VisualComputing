class Canvas{

  Image image;
  String label;
  PGraphics canvas;
  FilterTypes filter;
  
  Canvas(String path, FilterTypes type){
    image = new Image(path);
    canvas = createGraphics(image.GetWidth(), image.GetHeight() + 50);
    filter = type;
    
    label = filter.toString();
  }
  
  void Draw(){
    canvas.beginDraw();
    canvas.background(76);
    canvas.image(image.Filtered(filter),0,0);
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
