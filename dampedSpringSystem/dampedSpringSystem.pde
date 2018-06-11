ControlP5 cp5;
Slider slider;
Body body;
Chart myChart;

void setup() {
  fullScreen();
  cp5 = new ControlP5(this);
  body = new Body(80);
  body.setY(260);
  slider = cp5.addSlider("slider");
  slider.setPosition(100, 1100).setSize(500, 70).setRange(0, 1000).setValue(0);
   myChart = cp5.addChart("dataflow")
               .setPosition(50, 50)
               .setSize(700, 600)
               .setRange(-20, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(255))
               ;

  myChart.addDataSet("incoming");
  myChart.setData("incoming", new float[100]);
}

void slider(int value){
  float force = value;
  body.applyForce(force);
  body.setKe(5);
  body.setKv(5);
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  body.update();
  body.display();
  myChart.push("incoming", body.getX());
  popMatrix();
}