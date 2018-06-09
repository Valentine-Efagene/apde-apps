ArrayList<KochLine> linesTop;
ArrayList<KochLine> linesRight;
ArrayList<KochLine> linesLeft;
ArrayList<KochLine> linesBottom;
Section top, right, left,  bottom;
int leftEdge,  rightEdge, topEdge, bottomEdge;
int UP, DOWN, orientation; 

void setup(){
  UP = -1;
  DOWN = 1;
  orientation = -1;
  leftEdge = width/2 - 200;
  rightEdge = width/2 + 200;
  topEdge = height/2 - 200;
  bottomEdge = height / 2 + 200;
  linesTop = new ArrayList<KochLine>();
  PVector startTop = new PVector(leftEdge, topEdge);
  PVector endTop = new PVector(rightEdge, topEdge);
  linesTop.add(new KochLine(startTop, endTop));
  
  linesRight = new ArrayList<KochLine>();
  PVector startRight = new PVector(rightEdge, topEdge);
  PVector endRight = new PVector(rightEdge, bottomEdge);
  linesRight.add(new KochLine(startRight, endRight));
  
  linesLeft = new ArrayList<KochLine>();
  PVector startLeft = new PVector(leftEdge, topEdge);
  PVector endLeft = new PVector(leftEdge, bottomEdge);
  linesLeft.add(new KochLine(startLeft, endLeft));
  
  linesBottom = new ArrayList<KochLine>();
  PVector startBottom = new PVector(leftEdge, bottomEdge);
  PVector endBottom = new PVector(rightEdge, bottomEdge);
  linesBottom.add(new KochLine(startBottom, endBottom));
  
  top = new Section(linesTop);
  right = new Section(linesRight);
  left = new Section(linesLeft);
  bottom = new Section(linesBottom);
  
  for(int i=0;i<5;i++){
    orientation = UP;
    top.generate();
    right.generate();
    orientation = DOWN;
    left.generate();
    bottom.generate();
  }
}

void draw() { 
  top.drawSection();
  right.drawSection();
  left.drawSection();
  bottom.drawSection();
}


class KochLine { 
  PVector start; 
  PVector end; 
  
  KochLine(PVector a, PVector b) { 
    start = a.get(); 
    end = b.get(); 
  } 

   void display() { 
    stroke(0); 
     line(start.x, start.y, end.x, end.y); 
    }
    
    PVector kochA() { 
      return start.get(); 
      } 
      
    PVector kochE() { 
      return end.get();
    }
    
    PVector kochB() { 
      PVector v = PVector.sub(end, start); 
      v.div(3);
      v.add(start); 
      return v; //Add that PVector to the beginning of the line to find the new point. 
    } 
    
    PVector kochC() { 
      PVector a = start.get(); 
      PVector v = PVector.sub(end, start); 
      v.div(3); 
      a.add(v); 
      v.rotate(orientation * radians(60)); 
      a.add(v); 
      return a; 
    }
      
    PVector kochD() { 
        PVector v = PVector.sub(end, start); 
        v.mult(2/3.0); 
        v.add(start); 
        return v; 
    }
}

class Section{
  ArrayList<KochLine> lines;
  
  Section(ArrayList<KochLine> dLines){
    lines = dLines;
  }
  
  void drawSection(){
    for (KochLine l : lines) { 
      l.display(); 
    } 
  }
  
  void generate() { 
   ArrayList<KochLine> next = new ArrayList<KochLine>(); 
      
   for (KochLine l : lines) { 
      PVector a = l.kochA(); 
      PVector b = l.kochB(); 
      PVector c = l.kochC(); 
      PVector d = l.kochD(); 
      PVector e = l.kochE();
      
       next.add(new KochLine(a,b)); 
       next.add(new KochLine(b,c)); 
       next.add(new KochLine(c,d)); 
       next.add(new KochLine(d,e)); 
       //Create the next ArrayList... ...for every current line. Add four new lines. (We need to figure out how to compute the locations of these lines!) 
    } 
      
    lines = next; 
   }
}

void mousePressed(){
  if(mouseY > height/2){
    stroke(random(255), random(255), random(255));
  }else{
    background(random(255), random(255), random(255));
  }
}