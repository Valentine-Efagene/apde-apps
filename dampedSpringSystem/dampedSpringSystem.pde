ControlP5 cp5;
Slider slider, keSlider, kvSlider;
Button reset;
Body body;
Chart myChart;
float chartX, chartY,
  forceSliderX, forceSliderY,
  keSliderX, keSliderY,
  kvSliderX, kvSliderY;

void setup() {
  fullScreen();
  textSize(32);
  stroke(#0092FF);
  chartX = 50;
  chartY = 50;
  forceSliderX = 100;
  forceSliderY = height - 230;
  keSliderX = forceSliderX;
  keSliderY = forceSliderY + 50;
  kvSliderX = forceSliderX;
  kvSliderY = keSliderY + 50; 

  cp5 = new ControlP5(this);
  body = new Body(80);
  body.setY(300);
  
  reset = cp5.addButton("reset");
  reset.setPosition(50, 700)
    .setSize(70, 70);
  
  slider = cp5.addSlider("force");
  slider.setPosition(forceSliderX, forceSliderY)
    .setSize(500, 30)
    .setRange(0, 2000)
    .setValue(0);
    
  keSlider = cp5.addSlider("elasticity");
  keSlider.setPosition(keSliderX, keSliderY)
    .setSize(500, 30)
    .setRange(0, 50)
    .setValue(0);
    
  kvSlider = cp5.addSlider("coefficient_of_friction");
  kvSlider.setPosition(kvSliderX, kvSliderY)
    .setSize(500, 30)
    .setRange(0, 50)
    .setValue(0);
  
   myChart = cp5.addChart("displacement")
               .setPosition(chartX, chartY)
               .setSize(620, 600)
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
  body.setKe(value);
}

void coefficient_of_friction(int value){
  body.setKv(value);
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
  line(0, body.getY() + body.getRadius() + 50, 0, body.getY() - body.getRadius() - 50);
  line(-width/2, body.getY(), width/2, body.getY());
  text("x = " + body.getX(), -150, 50);
  text("v = " + body.getV(), -150, 100);
  text("a = " + body.getA(), -150, 150);
  myChart.push("displacement", body.getX());
  popMatrix();
}