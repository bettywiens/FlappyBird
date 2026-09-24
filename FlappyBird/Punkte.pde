class Punkte {
  PImage Grafik;
  PImage Stelle1;
  PImage Stelle2;
  int punkte;
  float positionXGrafik;
  float positionYGrafik;
  float positionXStelle1;
  float positionYStelle1;
  float positionXStelle2;
  float positionYStelle2;
  
  float bildBreiteGrafik;
  float bildHoeheGrafik;
  float bildBreiteStelle1;
  float bildHoeheStelle1;
  float bildBreiteStelle2;
  float bildHoeheStelle2;
  
  float faktor;
  String bildPfadGrafik;
  String bildPfadStelle1;
  String bildPfadStelle2;

  Punkte(float faktor, int punkte) {
    if (leben == 3) {
      this.bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/dreiHerzen.png";
    } else if (leben == 2) {
      this.bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/zweiHerzen.png";
    } else if (leben == 1) {
      this.bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/einHerz.png";
    } else if (leben == 0) {
      this.bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/keinHerz.png";
    } else if (leben < 0 ){
      this.bildPfad = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/button/keinHerz.png";
    }
    Grafik = loadImage(bildPfadGrafik);
    bildBreiteGrafik = Grafik.width * faktor;
    bildHoeheGrafik = Grafik.height * faktor;
    
    Stelle1 = loadImage(bildPfadStelle1);
    bildBreiteGrafik = Stelle1.width * faktor;
    bildHoeheGrafik = Stelle1.height * faktor;
    
    Stelle2 = loadImage(bildPfadStelle1);
    bildBreiteGrafik = Stelle2.width * faktor;
    bildHoeheGrafik = Stelle2.height * faktor;
  }

  void setzePosition(float positionX, float positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
  }

  void zeichne() {
    image(herzBild, positionX, positionY, bildBreite, bildHoehe);
  }
