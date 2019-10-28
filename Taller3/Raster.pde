float h1,h2,h3;

boolean antialias = false;
int antiAliasFactor = 2;


float areaT(){
  float s,p,a,b,c;
  a=sqrt(pow(P1.x-P2.x,2)+pow(P1.y-P2.y,2));
  b=sqrt(pow(P1.x-P3.x,2)+pow(P1.y-P3.y,2));
  c=sqrt(pow(P2.x-P3.x,2)+pow(P2.y-P3.y,2));
  p=(a+b+c)/2;
  s=sqrt(p*(p-a)*(p-b)*(p-c));
  h1=s*2/a;
  h2=s*2/b;
  h3=s*2/c;
  return s;
}

float areaST(float i, float j){
  float s1,p1,s2,p2,s3,p3,a1,b1,c1,a2,b2,c2,a3,b3,c3,t;
  a1=sqrt(pow(i-P2.x,2)+pow(j-P2.y,2));
  b1=sqrt(pow(i-P3.x,2)+pow(j-P3.y,2));
  c1=sqrt(pow(P2.x-P3.x,2)+pow(P2.y-P3.y,2));
  a2=sqrt(pow(P1.x-i,2)+pow(P1.y-j,2));
  b2=sqrt(pow(P1.x-P3.x,2)+pow(P1.y-P3.y,2));
  c2=sqrt(pow(i-P3.x,2)+pow(j-P3.y,2));
  a3=sqrt(pow(P1.x-P2.x,2)+pow(P1.y-P2.y,2));
  b3=sqrt(pow(P1.x-i,2)+pow(P1.y-j,2));
  c3=sqrt(pow(P2.x-i,2)+pow(P2.y-j,2));
  p1=(a1+b1+c1)/2;
  s1=sqrt(p1*(p1-a1)*(p1-b1)*(p1-c1));
  p2=(a2+b2+c2)/2;
  s2=sqrt(p2*(p2-a2)*(p2-b2)*(p2-c2));
  p3=(a3+b3+c3)/2;
  s3=sqrt(p3*(p3-a3)*(p3-b3)*(p3-c3));
  t=s1+s2+s3;
  return t;
}

float edgeFuction(float v1x, float v1y, float v2x, float v2y, float px,float py){
  return (((v2x-v1x)*(py-v1y))-((v2y-v1y)*(px-v1x)));
}

void rasterTriangle(){
  float triangle=areaT();
  for(int i=0;i<=width;i+=interval){
    for(int j=0;j<=width;j+=interval){
      float ptriangle=areaST(i+interval/2,j+interval/2); 
      if(antialias)
        antiAliasSquare(i,j,interval,triangle);
      else{
        if(round(triangle)==round(ptriangle)){
          
          float p1=(h1-sqrt(pow(i-P1.x,2)+pow(j-P1.y,2)));
          float p2=(h2-sqrt(pow(i-P2.x,2)+pow(j-P2.y,2)));
          float p3=(h3-sqrt(pow(i-P3.x,2)+pow(j-P3.y,2)));
          
          re=(255/(P2.x-P1.x))*(i-P2.x);
          bl=(255/(P3.x-P2.x))*(i-P3.x);
          gr=(255/(P3.x-P1.x))*(i-P3.x);
          fill(p1,p2,p3);
          noStroke();
          square(i,j,interval);
        }
      }
    }
  }
}

void antiAliasSquare(int x, int y, int interval, float triangle){
  int step = interval / antiAliasFactor;
  int count = 0;
  int shade = 0;
  for(int i=x; i<=x+interval; i+= antiAliasFactor){
    for(int j=y; j<=y+interval; j+= antiAliasFactor){
      float ptriangle=areaST(i+step/2,j+interval/2);
      count++;
      if(round(triangle)==round(ptriangle)){
        shade += 255;
        float p1=(h1-sqrt(pow(i-P1.x,2)+pow(j-P1.y,2)));
        float p2=(h2-sqrt(pow(i-P2.x,2)+pow(j-P2.y,2)));
        float p3=(h3-sqrt(pow(i-P3.x,2)+pow(j-P3.y,2)));
        fill(p1,p2,p3,shade/count);
        noStroke();
        square(x,y,interval);
      }
    }
  }
}
