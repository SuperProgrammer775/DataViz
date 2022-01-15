int DAY_LEN ;
int PEOPLE_COUNT;
String[] textFile;
Person[] people;
int TOP_VISIBLE = 13;

void setup(){
  textFile = loadStrings("data.tsv");
 String[] parts = textFile[0].split("\t");
 PEOPLE_COUNT = parts.length-1;
 DAY_LEN = textFile.length-1;
 people = new Person[PEOPLE_COUNT];
 for(int i = 0; i < PEOPLE_COUNT; i++){
   people[i] = new Person(parts[i+1]);
 }
 for(int d = 0; d < DAY_LEN; d++){
   String[] dataParts = textFile[d+1].split("\t");
   for(int p = 0; p < PEOPLE_COUNT; p++){
   people[p].values[d] = Float.parseFloat(dataParts[p+1]);
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
