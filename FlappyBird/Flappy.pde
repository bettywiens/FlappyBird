class Flappy {

  String bildPfad[] = {
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-1.png",
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-2.png",
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-3.png",
    "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/flappy/frame-4.png"
  };

  float size = 0.4f;
  PImage[] flappy;
  float flappyX;
  float flappyY;
  float flappyBreite;
  float flappyHoehe;
  int animation;
  float deltaTime;
  float time;

  Flappy() {
    animation = 0;
    time = 0;
    flappy = new PImage[bildPfad.length];
    for (int i = 0; i < bildPfad.length; i++){
      flappy[i] = loadImage(bildPfad[i]);
    }
    
    flappyX = 100;
    flappyY = 100;
  }
  
  void zeichne(){
    flappyBreite = flappy[0].width * width / hintergrund.hintergrund.width *  size;
    flappyHoehe = flappy[0].height * height / hintergrund.hintergrund.height * size;
    image(flappy[0], flappyX, flappyY, flappyBreite, flappyHoehe);
  }
  
  void bewege(){
    deltaTime = millis();
    time += deltaTime;
  }
  
}
