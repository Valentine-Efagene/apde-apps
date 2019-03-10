PrintWriter output;

void setup() { 
  // Create a new file in the sketch directory 
  requestPermission("android.permission.READ_EXTERNAL_STORAGE", "handlePermission");
  } 
  
  void handlePermission(boolean granted) { 
    if (granted) {
      //output = createWriter("/storage/emulated/0/Sketchbook/file/positions.txt"); 
      output = createWriter("/storage/emulated/0/Sketchbook/file/positions2.txt"); 
    }else{
      println("File not created!");
    }
  }
  
  void draw() { 
    if(output == null){
      return; 
    }
    
    point(mouseX, mouseY); 
    output.println(mouseX + "t" + mouseY); 
    // Write the coordinate to the file 
  } 
  
  void mousePressed() { 
    if(output == null){
      return;
    }
    
    
    output.flush(); 
    // Writes the remaining data to the file 
    output.close(); 
    // Finishes the file exit(); 
    // Stops the program
   }