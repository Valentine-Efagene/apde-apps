/*
Reference:
https://qiita.com/hotman78/items/e494ef3477d80f82a627, 10th March, 2019.
*/

import android.view.*;
import android.widget.*;
import android.support.v4.app.*;

void setup() { 
  runOnUiThread(new Runnable() { 
    public void run() { 
      FrameLayout fl = new FrameLayout(getContext());
      EditText et = new EditText(getContext());
      et.setBackgroundColor(color(255));
      
      FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(500, 200);
      lp.topMargin = height/2;
      lp.leftMargin = width/2;
      View surfaceView = getSurface().getSurfaceView();
      ViewGroup parent=(ViewGroup)surfaceView.getParent();
      parent.removeView(surfaceView);
      parent.addView(fl);
      fl.addView(surfaceView);
      fl.addView(et,lp);
    }
  } );
}

void draw(){ 
  background(255,0,0); 
}