int DAY_LEN ;
int PEOPLE_COUNT;
String[] textFile;
Person[] people;
int TOP_VISIBLE = 13;
float[] maxes;

float X_MIN = 100;
float X_MAX = 1600;
float Y_MIN = 300;
float Y_MAX = 1000;
float X_W = X_MAX-X_MIN;
float Y_H = Y_MAX-Y_MIN;
float currentScale =  -1;

int frames = 0;
float currentDay = 0;
float FRAMES_PER_DAY =  2.8;

void setup(){
  textFile = loadStrings("data.tsv");
 String[] parts = textFile[0].split("\t");
 DAY_LEN = textFile.length-1;
 PEOPLE_COUNT = parts.length-1;
 
 maxes = new float[DAY_LEN];
 for(int d = 0; d < DAY_LEN; d++){
   maxes[d] = 0;
 }
 people = new Person[PEOPLE_COUNT];
 for(int i = 0; i < PEOPLE_COUNT; i++){
   people[i] = new Person(parts[i+1]);
 }
 for(int d = 0; d < DAY_LEN; d++){
   String[] dataParts = textFile[d+1].split("\t");
   for(int p = 0; p < PEOPLE_COUNT; p++){
     float val = Float.parseFloat(dataParts[p+1]);
   people[p].values[d] = val;
   if(val > maxes[d]){
     maxes[d] = val;
   }
 }
  }
  getRankings();
  size(1920,1080);
}
void draw(){
  currentDay = frames/FRAMES_PER_DAY;
 currentScale = getXScale(currentDay);
 drawBackground();
 drawBars();
  
  
  frames++;
}
void drawBackground(){
  background(0);
  
}
void drawBars(){
  for(int p = 0; p < PEOPLE_COUNT; p++){
    float x = valueToX(val);
  }
  
}
void getRankings(){
  for(int d = 0; d < 1; d++){
  boolean[] taken = new boolean[PEOPLE_COUNT];
  for(int p = 0; p < PEOPLE_COUNT; p++){
  taken[p] = false;
  }
  for(int spot = 0; spot < TOP_VISIBLE; spot++){
 float record =  -1;
  int holder = -1;
   for(int p = 0; p < PEOPLE_COUNT; p++){
     if(!taken[p]){
  taken[p] = false;
  float val = people[p].values[d];
  if(val > record){
    record = val; 
    holder = p;
  }
     }
}
 people[holder].ranks[d] = spot;
 taken[holder] = true;
 println(people[holder].name);
  }
}
}
float stepIndex(float[] a, float index){
 return a[(int)index];
}
float linIndex(float[] a, float index){
  int indexInt = (int)index;
  float indexRem = index%1.0;
  float beforeVal = a[indexInt+1];
  float afterVal = a[indexInt+1];
 return lerp(beforeVal,afterVal,indexRem);
}
float WAIndex(float[] a, float index, float WINDOW_WIDTH){
    int startIndex = max(0,ceil(index-WINDOW_WIDTH));
  int endIndex = min(DAY_LEN-1,floor(index+WINDOW_WIDTH));
  float counter = 0;
  float summer = 0;
  for(int d = startIndex; d <= endIndex; d++){
    float val = a[d];
    float weight = 0.5+0.5*cos((d-index)/WINDOW_WIDTH*PI);
    counter += weight;
    summer += val*weight;
}
float finalResult = summer/counter;
return finalResult;
}
float getXScale(float d){
  return WAIndex(maxes,d,14)*1.2;
}
float valueToX(float val){
 return X_MIN+X_W*val/currentScale;
}
float valueToY(float rank){
  float y = Y_MIN+rank*(Y_H/TOP_VISIBLE);
  return y;
}
