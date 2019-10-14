enum FilterTypes{
  
  NONE{
    public String toString() {
      return "Original";
    }
  },
  BW_AVG{
    public String toString() {
      return "RGB Average";
    }
  },
  BW_LUMA{
    public String toString() {
      return "Luma";
    }
  },
  HISTOGRAM{
    public String toString() {
      return "Histogram";
    }
  }
}
