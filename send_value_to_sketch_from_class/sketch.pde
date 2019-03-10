String a[] = {"init"};
Test t; 

void setup(){
  fullScreen();
  t = new Test(a);
}

void draw(){
  println(a[0]);
}

class Test{
  String[] p; 
  
  Test(String[] p){
    this.p = p;
    p[0] = "Test";
  }
}