class Range{
  public int RMin, RMax, GMin, GMax, BMin, BMax;
  
  public Range(Histogram hist){
    
    RMin = (hist.posR_1 - hist.x) / hist.barWidth;
    RMax = (hist.posR_2 - hist.x) / hist.barWidth;
    GMin = (hist.posG_1 - hist.x) / hist.barWidth;
    GMax = (hist.posG_2 - hist.x) / hist.barWidth;
    BMin = (hist.posB_1 - hist.x) / hist.barWidth;
    BMax = (hist.posB_2 - hist.x) / hist.barWidth;
  }
}
