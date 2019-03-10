/*
Reference:
https://qiita.com/hotman78/items/e494ef3477d80f82a627, 10th March, 2019.
*/

import android.view.*;
import android.widget.*;
import android.support.v4.app.*;
import android.view.View.OnKeyListener;
import android.view.KeyEvent;
import android.view.View; 

public String[] a = {""};
Additional ad;

void setup() { 
  ad = new Additional(a);
  runOnUiThread(ad);
}

void draw(){ 
  println(a[0]);
}

class Additional implements Runnable, OnKeyListener{
  String[] s;
  EditText et;
  
  Additional(String[] s){
    this.s = s;
  }
  
  public boolean onKey(View v, int keyCode, KeyEvent event) { 
     if ((event.getAction() == KeyEvent.ACTION_DOWN) && (keyCode == KeyEvent.KEYCODE_ENTER)) { 
        s[0] = et.getText().toString();
        et.setVisibility(View.INVISIBLE);
        return true;
     }
          
     return false; 
  } 
  
  public void run() { 
      FrameLayout fl = new FrameLayout(getContext());
      et = new EditText(getContext());
      et.setBackgroundColor(color(255));
      
      FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(500, 100);
      lp.topMargin = 10;
      lp.leftMargin = 10;
      View surfaceView = getSurface().getSurfaceView();
      ViewGroup parent=(ViewGroup)surfaceView.getParent();
      parent.removeView(surfaceView);
      parent.addView(fl);
      fl.addView(surfaceView);
      fl.addView(et,lp);
      et.setOnKeyListener(this);
    }
}