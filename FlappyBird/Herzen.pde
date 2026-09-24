class Herzen {
  PImage herzBild;
  String[] letztesLeben;
  int leben;
  float positionX;
  float positionY;
  float bildBreite;
  float bildHoehe;
  float faktor;
  String bildPfad;

  Herzen(float faktor, int leben) {
    
    letztesLeben = new String[]{
      "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/dreiHerzen.png",
      "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/keinHerz.png"      
    };
    
    if (leben == 3) {
      bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/dreiHerzen.png";
    } else if (leben == 2) {
      bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/zweiHerzen.png";
    } else if (leben == 1) {
      bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/einHerz.png";
    } else if (leben == 0) {
      bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/keinHerz.png";
    } else if (leben < 0 ){
      bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/keinHerz.png";
    }
    herzBild = loadImage(bildPfad);
    bildBreite = herzBild.width * faktor;
    bildHoehe = herzBild.height * faktor;
  }

  void setzePosition(float positionX, float positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
  }

  void zeichne() {
    image(herzBild, positionX, positionY, bildBreite, bildHoehe);
  }
}
