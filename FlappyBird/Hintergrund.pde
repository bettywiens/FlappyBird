class Hintergrund{
  String bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/background/layer_background.png";
  
  PImage hintergrund;
  
  Hintergrund(){
    hintergrund = loadImage(bildPfad);
    
  }
  
  void zeichne(){
    image(hintergrund, 0, 0, width, height);
  }
}
