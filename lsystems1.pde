/* please note that there appears to be a bug in pjs where if you want to
   test a character i in the string, you need to compare it against the string
   with "" and not '', if you are using processing ide, change it to ''*/

String s= "F-F-F-F";
String rule="F-F+F+FF-F-F+F";

float alpha = PI/2;   
float stepSize = 2;   //how long each edge is
float delta=PI/2;  //90 degrees
int iteration = 3;  //number of times s is by the production rule
int curr;       //used to show which part of string to draw
int speed=20;  //handles 10 characters of the string per frame

float posX=200;  //starting location of turtle, you may need to change these to make it
float posY=200;  //fit

void setup(){
  frameRate(60);
  size(700,700);
  background(255);
  curr=0;
  for(int i=0;i<iteration;i++){
     nextGeneration(s);
  }

}
void drawF(){
  float posXPrime = posX + stepSize*cos(alpha);
  float posYPrime = posY - stepSize*sin(alpha);
  line(posX,posY,posXPrime, posYPrime);
  posX=posXPrime;
  posY=posYPrime;
}
void drawPlus(){
  alpha = alpha + delta;
}
void drawMinus(){
  alpha = alpha - delta;
}
//apply production rule to modify the string
void nextGeneration(String original){
  String tmp="";
  for(int i=0; i<original.length(); i++){
    if(original.charAt(i)=="F"){
      tmp=tmp+rule;
    }
    else{
      tmp=tmp+original.charAt(i);
    }
  }
  s=tmp;
}
void draw(){
  int count =0;
  while(curr < s.length() && count < speed){
    if (s.charAt(curr)=="F"){
      drawF();
    }
    else if (s.charAt(curr)=="+"){
      drawPlus();
    }
    else if (s.charAt(curr)=="-"){
      drawMinus();
    }
    curr++;
    count++;
  }
  if(curr >=s.length()){
    noLoop();
  }
}