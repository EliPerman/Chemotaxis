Bacteria[] colony;

void setup()   
{     
   size(300, 300);
   frameRate(60);
   colony = new Bacteria[10];
   for (int i = 0; i < colony.length; i++)
     colony[i] = new Bacteria();
}   

void draw()   
{    
   background(0);
   for (int i = 0; i < colony.length; i++){
     colony[i].move();
     colony[i].show();
   }   
}  

double inRange(double a, double b, double c)
{
  if (a >= b && a <= c)
    return a;
  else if (a < b)
    return b;
  else
    return c;
}

class Bacteria 
{     
   int x, y, R, G, B, colour;
   double theta;
   Bacteria(){
     x = (int)(Math.random()*300);
     y = (int)(Math.random()*300);
     R = (int)(Math.random()*255);
     G = (int)(Math.random()*255);
     B = (int)(Math.random()*255);
     theta = Math.random()*2*PI;
   }
   void move(){
     x += (int)(Math.cos(theta)*3 + max(0,10*(1 - dist(x, y, mouseX, mouseY)/200))*(x - mouseX)/dist(x, y, mouseX, mouseY));
     x = (int)inRange(x, 0, 300);
     y += (int)(Math.sin(theta)*3 + max(0,10*(1 - dist(x, y, mouseX, mouseY)/200))*(y - mouseY)/dist(x, y, mouseX, mouseY));
     y = (int)inRange(y, 0, 300);
     theta += Math.random() - 0.5;
     theta = theta % (2*PI);
   }
   void show(){
     int k = (int)(10*(Math.random()-0.5));
     if (dist(x, y, mouseX, mouseY) < 100){
       fill(R, G, B, (float)(Math.random()*255));
       ellipse(x, y, 20 + k, 20 + k);
     } else {
       fill(R, G, B);
       ellipse(x, y, 20, 20);
     }
   }
}
