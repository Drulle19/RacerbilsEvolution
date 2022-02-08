//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int populationSize  = 100;  
float lifespan = 500;
ArrayList<CarSystem> generations = new ArrayList();
//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(500, 600);
  trackImage = loadImage("track.png");
  generations.add(carSystem);
}

void draw() {
  clear();
  fill(255);
  rect(0,50,1000,1000);
  image(trackImage,0,80);  
  
  if(frameCount%lifespan == 0){
    CarSystem G = new CarSystem(generations.size()-1);
    generations.add(G);
  }

  carSystem.updateAndDisplay();
  
  
  
  //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
  /* if (frameCount%200==0) {
      println("FJERN DEM DER KØRER UDENFOR BANEN frameCount: " + frameCount);
      for (int i = carSystem.CarControllerList.size()-1 ; i >= 0;  i--) {
        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        if(s.whiteSensorFrameCount > 0){
          carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
         }
      }
    }*/
    //
}
