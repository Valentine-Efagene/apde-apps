import android.content.Context; 
import android.hardware.Sensor; 
import android.hardware.SensorManager; 
import android.hardware.SensorEventListener;
import android.hardware.SensorEvent;

ProximityListener listener;
Context context;
SensorManager manager;
Sensor sensor;
float result; 

void setup() {   
fullScreen();
result = 0;
textSize(32);   
background(0);
context = getActivity();   
manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);   
sensor = manager.getDefaultSensor(Sensor.TYPE_PROXIMITY); 
listener = new ProximityListener();   
manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
}

void draw(){
  background(0);
  text("proximity: " + result, 0, 0, width, height);
  
  if(result == 0){
    ellipse(width/2, height/2, 200, 200);
  }
}

class ProximityListener implements SensorEventListener {   
  public void onSensorChanged(SensorEvent event) {
    result=event.values[0];
  }   
  
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
    
  }
}

public void onResume() {   
super.onResume();   
if (manager != null) {     
manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);   
} 
} 

public void onPause() {   
super.onPause();   
if (manager != null) {     
manager.unregisterListener(listener);   
}
}