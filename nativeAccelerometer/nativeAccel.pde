import android.content.Context; 
import android.hardware.Sensor; 
import android.hardware.SensorManager; 
import android.hardware.SensorEventListener;
import android.hardware.SensorEvent;

Context context; 
SensorManager manager; 
Sensor sensor; 
AccelerometerListener listener; 
float ax=0, ay=0, az=0;

void setup() {   
fullScreen();   
textSize(32);   
background(0);
context = getActivity();   
manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);   
sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER); 
listener = new AccelerometerListener();   manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
}

void draw(){
  background(0);
  text("X: " + ax + "\nY: " + ay + "\nZ: " + az, width/2, height/2, width, height);
}

class AccelerometerListener implements SensorEventListener {   
  public void onSensorChanged(SensorEvent event) {
    ax=event.values[0];
    ay=event.values[1];
    az=event.values[2];
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