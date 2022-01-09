int DAY_LEN ;
int PEOPLE_COUNT;
String[] textFile;
Person[] people;

void setup(){
  textFile = loadStrings("data.tsv");
 String[] parts = textFile[0].split("\t");
 PEOPLE_COUNT = parts.length-1;
 DAY_LEN = textFile.length-1;
 people = new Person[PEOPLE_COUNT];
 for(int i = 0; i < PEOPLE_COUNT; i++){
   people[i] = new Person(parts[i+1]);
   
 }
for(int line = 0; line < DAY_LEN; line++){
  String[] dataParts = textFile[line+1].split("\t");
  for(int p = 0; p < PEOPLE_COUNT; p++){
 people[p].values[line] = Float.parseFloat(dataParts[p+1]);

  }
}
 println(people[6].values[39]);
}
void draw(){
}
