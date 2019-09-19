import processing.sound.*;
PImage img;
int Button1x, Button1y, Button2x, Button2y, Button3x, Button3y, Button4x, Button4y, BellButtonx, BellButtony, HelpButtonx,HelpButtony;
int NumButtonSize=50, BellButtonSize=60,HelpButtonSize=125;
color ButtonHighlight,NumButtonColor=255;
String desiredFloor,baseFloor;
boolean Button1Over=false,Button2Over=false,Button3Over=false,Button4Over=false,BellButtonOver=false,HelpButtonOver=false;
SoundFile sound1,sound2,sound3,sound4,soundbell,soundhelp,currentsound,basesound;
void setup(){
  size(500,1000);
  baseFloor="--";
  desiredFloor=baseFloor;
  img = loadImage("infinity_gauntlet.png");
  ButtonHighlight=color(0);
  //Button 1 Loc
  Button1x=100;
  Button1y=335;
  
  //Button 2 Loc
  Button2x=165;
  Button2y=300;
  
  //Button 3 Loc
  Button3x=225;
  Button3y=285;
  
  //Button 4 Loc
  Button4x=295;
  Button4y=325;
  
  //Bell Button Loc
  BellButtonx=350;
  BellButtony=425;
  
  //Help Button Loc
  HelpButtonx=210;
  HelpButtony=430;
  
  ellipseMode(CENTER);
  
  //Load Sound for Button 1
  sound1 = new SoundFile(this, "sound1.wav");
  
  //Load Sound for Button 2
  sound2 = new SoundFile(this, "sound2.wav");
  
  //Load Sound for Button 3
  sound3 = new SoundFile(this, "sound3.wav");
  
  //Load Sound for Button 4
  sound4 = new SoundFile(this, "sound4.wav");
  
  //Load Sound for Bell Button
  soundbell = new SoundFile(this, "soundbell.wav");
  
  //Load Sound for Help Button
  soundhelp = new SoundFile(this, "soundhelp.wav");
}

void draw(){
  update(mouseX,mouseY);
  background(0);
  image(img,0,0);
  
  
  textSize(16);
  fill(0);
  text(desiredFloor,215,640);

  
  //Button 1 Display
  fill(0,0);
  ellipse(Button1x,Button1y,NumButtonSize,NumButtonSize);
  
  //Button 2 Display
  fill(0,0);
  ellipse(Button2x,Button2y,NumButtonSize,NumButtonSize);
  
  //Button 3 Display
  fill(0,0);
  ellipse(Button3x,Button3y,NumButtonSize,NumButtonSize);
  
  //Button 4 Display
  fill(0,0);
  ellipse(Button4x,Button4y,NumButtonSize,NumButtonSize);
  
  //Bell Button Display
  fill(0,0);
  ellipse(BellButtonx,BellButtony,BellButtonSize,BellButtonSize);
  
  //Help Button Display
  fill(0,0);
  ellipse(HelpButtonx,HelpButtony,HelpButtonSize,HelpButtonSize);
    
}

void update(int x, int y)
{
  //Button 1 Update
  if (OverButton(Button1x,Button1y,NumButtonSize)){
    Button1Over=true;
  }
  else {
    Button1Over=false;
  }
  
  //Button 2 Update
  if (OverButton(Button2x,Button2y,NumButtonSize)){
    Button2Over=true;
  }
  else {
    Button2Over=false;
  }
  
  //Button 3 Update
  if (OverButton(Button3x,Button3y,NumButtonSize)){
    Button3Over=true;
  }
  else {
    Button3Over=false;
  }
  
  //Button 4 Update
  if (OverButton(Button4x,Button4y,NumButtonSize)){
    Button4Over=true;
  }
  else {
    Button4Over=false;
  }
  
  //Bell Button Update
  if (OverButton(BellButtonx,BellButtony,BellButtonSize)){
    BellButtonOver=true;
  }
  else {
    BellButtonOver=false;
  }
  
  //Help Button Update
  if (OverButton(HelpButtonx,HelpButtony,HelpButtonSize)){
    HelpButtonOver=true;
  }
  else {
    HelpButtonOver=false;
  }
}

void mousePressed(){
  //Button 1 Mouse Pressed
  if (Button1Over){
    sound1.play();
    desiredFloor="1";
  }
  
  //Button 2 Mouse Pressed
  if (Button2Over){
    sound2.play();
    desiredFloor="2";
  }
  
  //Button 3 Mouse Pressed
  if (Button3Over){
    sound3.play();
    desiredFloor="3";
  }
  
  //Button 4 Mouse Pressed
  if (Button4Over){
    sound4.play();
    desiredFloor="4";
  }
  
  //Bell Button Mouse Pressed
  if (BellButtonOver){
    soundbell.play();
  }
  
  //Help Button Mouse Pressed
  if (HelpButtonOver){
    soundhelp.play();
  }
}

boolean OverButton(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX)+sq(disY))<diameter/2){
    return true;
  } else{
    return false;
  }
}
