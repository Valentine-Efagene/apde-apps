ArrayList<KochLine> lines;
int count, delay; 

void setup(){
  count = 0;
  delay = 300;
  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, height / 2);
  PVector end = new PVector(width, height / 2);
  lines.add(new KochLine(start, end));
}

void draw() { 
  background(255); 
  count = 0;
  
  while(count < lines.size()){
    lines.get(count).display();
    count++;
    delay(delay);
  }
  
  delay /= 2;
  
  generate();
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
      v.rotate(-radians(60)); 
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