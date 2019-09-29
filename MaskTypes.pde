enum MaskTypes{
  NONE{
    public String toString() {
      return "Original";
    }
  },
  EDGE{
    public String toString() {
      return "Edge";
    }
  },
  BLUR{
    public String toString() {
      return "Blur";
    }
  },
  SHARPEN{
    public String toString() {
      return "Sharpen";
    }
  }
}
