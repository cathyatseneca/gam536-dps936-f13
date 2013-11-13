/* please note that there appears to be a bug in pjs where if you want to
   test a character i in the string, you need to compare it against the string
   with "" and not '', if you are using processing ide, change it to ''*/

String s= "X";
String rule="FF";
String xRule="F-[[X]+X]+F[+FX]-X";
float stepSize = 1;   //how long each edge is
float delta=(PI/9);
int iteration = 7;  //number of times s is by the production rule
int curr;       //used to show which part of string to draw
int speed=1000;  //handles 10 characters of the string per frame

class State{
  float x_;
  float y_;
  float alpha_;
  
  State(){
    x_=0;
    y_=0;
    alpha_=PI/2;
  }
  State(float posX,float posY,float alpha){
    x_=posX;
    y_=posY;
    alpha_=alpha;
  }
  void update(float posX,float posY,float alpha){
    x_=posX;
    y_=posY;
    alpha_=alpha;
  }
  void updateAlpha(float delta){
    alpha_+=delta;
  }
}
class Stack{
  ArrayList theStack_;
  int top_;
  Stack(){
    top_=0;
    theStack_=new ArrayList();
  }
  void push(State theState){
    theStack_.add(new State(theState.x_,theState.y_,theState.alpha_));
    top_++;
  }
  void pop(){
    if(top_> 0 ){
      theStack_.remove(top_-1);
      top_=top_-1;
    }
  }
  State top(){
    if(top_>0){
      return (State)theStack_.get(top_-1);
    }
  }
  boolean isEmpty(){
    boolean rc=true;
    if(top_>0){
      rc=false;
    }
    return rc;
  }
}

State currentState;
Stack theStack=new Stack();

void setup(){
  frameRate(60);
  size(1000,1000);
  background(255);
  curr=0;
  currentState = new State(width/2, height/2, PI/2);
  for(int i=0;i<iteration;i++){
     nextGeneration(s);
  }

}
void drawF(){
  float posXPrime = currentState.x_ + stepSize*cos(currentState.alpha_);
  float posYPrime = currentState.y_ - stepSize*sin(currentState.alpha_);
  line(currentState.x_,currentState.y_,posXPrime, posYPrime);
  currentState.x_=posXPrime;
  currentState.y_=posYPrime;
}
void drawPlus(){
  currentState.updateAlpha(delta);
}
void drawMinus(){
  currentState.updateAlpha(-delta);
}
//apply production rule to modify the string
void nextGeneration(String original){
  String tmp="";
  for(int i=0; i<original.length(); i++){
    if(original.charAt(i)=="F"){
      tmp=tmp+rule;
    }
    else if(original.charAt(i)=="X"){
      tmp=tmp+xRule;
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
    else if(s.charAt(curr)=="["){
      theStack.push(currentState);
    }
    else if(s.charAt(curr)=="]"){
      if(!theStack.isEmpty()){
        State tmp=(State) theStack.top();
        currentState.update(tmp.x_,tmp.y_,tmp.alpha_);
        theStack.pop();
      }
    }
    curr++;
    count++;
  }
  if(curr >=s.length()){
    noLoop();
  }
}