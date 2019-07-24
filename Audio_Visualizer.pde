 // This an an Audio Visualizer
 // @author (Ismail Abuhashish)
 //@Version (23/7/19)
import ddf.minim.analysis.*;
import ddf.minim.*;
import java.awt.Color;
Minim minim;
AudioPlayer jingle;
AudioInput input;
FFT fft;
int[][] colo=new int[300][3];
//AudioIn in;
 
void setup()
{
  size(480, 320);
//fullScreen();
  noCursor();

  minim = new Minim(this);
 
 
  input = minim.getLineIn();
 
  fft = new FFT(input.bufferSize(), input.sampleRate());
 
 // textFont(createFont("Arial", 16));
 
//windowName = "Audio Visualizer";
}
 
void draw()
{
  background(0);
  stroke(255);
 
  fft.forward(input.mix);

  for(int i = 0; i < fft.specSize(); i++)
  {
 //color randomizer
Color c;
        int RMax = 255;
        int RMin = 0;
        int randomRNum = (int)(Math.random() * ((RMax - RMin) +1)) + RMin; 
        int GMax = 255;
        int GMin = 0;
        int randomGNum = (int)(Math.random() * ((GMax - GMin) +1)) + GMin; 
        int BMax = 255;
        int BMin = 0;
        int randomBNum = (int)(Math.random() * ((BMax - BMin) +1)) + BMin; 
        c = new Color (randomRNum, randomGNum, randomBNum);
        fill (randomRNum,randomGNum,randomBNum); 
//variables
 float high = 0;
 int dot = 0;
 
 if(fft.getBand(i) > high){
 high = fft.getBand(i);
 dot = i;
 
 }
 //the sound "waves" aka sound squares
 rect(dot*20, 260, 15, high*-10);
 
}
 
}
