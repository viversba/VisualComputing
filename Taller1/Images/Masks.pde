public static class Masks{

  static float[][] Edge = {  { -1, -1, -1 },
                             { -1, 8, -1 },
                             { -1, -1, -1 }  }; 
                      
                      
  static float[][] Blur = { { 0.1111, 0.1111, 0.1111 },
                             { 0.1111, 0.1111, 0.1111 },
                             { 0.1111, 0.1111, 0.1111 } };
  
  static float[][] Sharpen = {  { 0, -1, 0 },
                               { -1, 5, -1 },
                               { 0, -1, 0 }  }; 
}
