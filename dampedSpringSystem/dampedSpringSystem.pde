ControlP5 cp5;
Slider slider, keSlider, kvSlider;
Button reset;
Body body;
Chart myChart;

void setup() {
  fullScreen();
  cp5 = new ControlP5(this);
  body = new Body(80);
  body.setY(260);
  
  reset = cp5.addButton("reset");
  reset.setPosition(50, 700)
    .setSize(70, 70);
  
  slider = cp5.addSlider("force");
  slider.setPosition(100, 1050)
    .setSize(500, 30)
    .setRange(0, 1000)
    .setValue(0);
    
  keSlider = cp5.addSlider("Elasticity");
  keSlider.setPosition(100, 1100)
    .setSize(500, 30)
    .setRange(0, 50)
    .setValue(0);
    
  kvSlider = cp5.addSlider("coefficient_of_friction");
  kvSlider.setPosition(100, 1150)
    .setSize(500, 30)
    .setRange(0, 50)
    .setValue(0);
  
   myChart = cp5.addChart("displacement")
               .setPosition(50, 50)
               .setSize(700, 600)
               .setRange(-360, 360)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(255));

  myChart.addDataSet("displacement");
  myChart.setData("displacement", new float[100]);
}

void force(int value){
  body.applyForce(value);
}

void elasticity(int value){
  body.setKv(value);
}

void coefficient_of_friction(int value){
  body.setKe(value);
}

void reset(){
  body.reset();
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  body.update();
  body.display();
  myChart.push("displacement", body.getX());
  popMatrix();
}