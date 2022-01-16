int DAY_LEN ;
int PEOPLE_COUNT;
String[] textFile;
Person[] people;
int TOP_VISIBLE = 13;
float[] maxes;
float[] scales;

float X_MIN = 100;
float X_MAX = 1600;
float Y_MIN = 300;
float Y_MAX = 1000;
float X_W = X_MAX-X_MIN;
float Y_H = Y_MAX-Y_MIN;


void setup(){
  textFile = loadStrings("data.tsv");
 String[] parts = textFile[0].split("\t");
 DAY_LEN = textFile.length-1;
 PEOPLE_COUNT = parts.length-1;
 
 maxes = new float[DAY_LEN];
 scales = new float[DAY_LEN];
 for(int d = 0; d < DAY_LEN; d++){
   maxes[d] = 0;
   scales[d] = 0;
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
  
}
void draw(){
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
float valueToX(){
}
float valueToY(){
}
