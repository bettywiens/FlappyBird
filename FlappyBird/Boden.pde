class Boden{
  
  String bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/background/layer_floor.png";  
  
  PImage boden1;
  PImage boden2;
  
  float boden1X = 0;
  float boden1Y = 0;
  
  float boden2X = width;
  float boden2Y = 0;
  
  Boden(){    
    boden1 =loadImage(bildPfad);
    boden2 =loadImage(bildPfad);
  }
  
  void zeichne(){
    image(boden1, boden1X, boden1Y, width, height);
    image(boden2, boden2X, boden2Y, width, height);
  }
  
  void bewege(){
    boden1X -= geschwindigkeit;
    boden2X -= geschwindigkeit;
    
    if(boden1X <= -width){
      boden1X = width + boden2X; // ?
    }
    
    if(boden2X <= -width){
      boden2X = width + boden1X; // ?
    }
  }
}
