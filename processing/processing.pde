/**
  * This sketch demonstrates how to use the BeatDetect object song SOUND_ENERGY mode.<br />
  * You must call <code>detect</code> every frame and then you can use <code>isOnset</code>
  * to track the beat of the music.
  * <p>
  * This sketch plays an entire song, so it may be a little slow to load.
  */

import ddf.minim.*;
import ddf.minim.analysis.*;
import java.util.Date;
 
Minim minim;
AudioPlayer song;
AudioInput in;
BeatDetect beat;

float eRadius;
String[] colours = {"#ff0099", "#f3f315", "#83f52c", "#ff6600", "#6e0dd0"};
int pushnumber = 0;

void setup()
{
  size(200, 200, P3D);
  minim = new Minim(this);
  
  // ** MP3 ** //
  song = minim.loadFile("BarbaraStreisand.mp3");
  song.play();
  
  // ** MIC ** //
  //in = minim.getLineIn(Minim.STEREO, int(1024));
  
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
  beat.setSensitivity(1000);
 
  ellipseMode(RADIUS);
  eRadius = 20;
  
}
 
void draw()
{
  background(0);
  
  // ** MP3 ** //
  beat.detect(song.mix);
  
  // ** MIC ** //
  //beat.detect(in.mix);
  
  float a = map(eRadius, 20, 80, 60, 255);
  fill(60, 255, 0, a);
  if ( beat.isOnset() )
  { 
    eRadius = 80;
    
    // Magic happens here
    pushNewColour();
    
  }
  ellipse(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

void pushNewColour()
{
  //Check we don't push a colour too often!
  Date currTime = new Date();
  
  JSONObject col1 = new JSONObject();
  col1.setString("colour", colours[pushnumber % 5]);
  Pusher.triggerPush("rave-1", "colour-change", col1.toString());
  
  JSONObject col2 = new JSONObject();
  col2.setString("colour", colours[(pushnumber + 1) % 5]);
  Pusher.triggerPush("rave-2", "colour-change", col2.toString());
  
  pushnumber++;
  
}
