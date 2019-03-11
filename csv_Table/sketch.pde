Table table; 

void setup() { 
  requestPermission("android.permission.READ_EXTERNAL_STORAGE", "handlePermission");
  table = new Table(); 
  table.addColumn("id"); 
  table.addColumn("species"); 
  table.addColumn("name"); 
  TableRow newRow = table.addRow(); 
  newRow.setInt("id", table.lastRowIndex()); 
  newRow.setString("species", "Panthera leo"); 
  newRow.setString("name", "Lion"); 
}

void handlePermission(boolean granted) { 
  if (granted) {
    saveTable(table, "/storage/emulated/0/Sketchbook/file/table.csv"); 
  }else{
    println("File not created!");
  }
}