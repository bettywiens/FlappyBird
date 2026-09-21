class Spitze{
  String bildPfadOben = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/spikes/spike.png";
  String bildPfadUnten = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/spikes/spike_f.png";
  
  PImage spitzeOben;
  PImage spitzeUnten;
  float bildBreite;
  float bildHöhe;
  float spitzeX;
  float spitzeY;

  Spitze(int nummer){
    spitzeOben = loadImage(bildPfadOben);
    spitzeUnten = loadImage(bildPfadUnten);
    spitzeX = width / spitzenNummer * (nummer + 1);
    randomYHoehe(); // ?
  }
  
  void zeichne(){
    bildBreite = spitzeUnten.width * width / hintergrund.hintergrund.width; // ?
    bildHöhe = spitzeUnten.height *  height / hintergrund.hintergrund.height; // ?
    image(spitzeOben, spitzeX, spitzeY + luecke/2, bildBreite, bildHöhe);
    image(spitzeUnten, spitzeX, spitzeY - bildHöhe - luecke/2, bildBreite, bildHöhe);
  }
  
  void bewege(){
    spitzeX -= geschwindigkeit;
    
    if (spitzeX <= 0 - bildBreite){
      spitzeX = width;
      randomYHoehe();
    }
  }
  
  void randomYHoehe(){
    spitzeY = random(height / 9, height / 10 * 6);
  }
}
