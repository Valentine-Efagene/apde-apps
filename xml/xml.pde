XML xml; 
int displacement = 200;

void setup() { 
  textSize(32);
  xml = loadXML("mammals.xml"); 
  XML[] children = xml.getChildren("animal"); 
  
  for (int i = 0; i < children.length; i++) { 
    int id = children[i].getInt("id"); 
    String coloring = children[i].getString("species"); 
    String name = children[i].getContent(); 
    fill(0);
    text(id + ", " + coloring + ", " + name, 200, 200 + i * displacement ); 
  } 
}