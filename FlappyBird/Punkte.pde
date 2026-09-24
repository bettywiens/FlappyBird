class Punkte {
  PImage Grafik;
  PImage Stelle1;
  PImage Stelle2;

  int punkte;
  String punkteS = "0";
  char[] stellen = punkteS.toCharArray();
  char stelle1;
  char stelle2;

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
  String bildPfadGrafik = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/0.png";
  String bildPfadStelle1;
  String bildPfadStelle2;

  Punkte(float faktor, int punkte) {

    punkteS = String.valueOf(punkte);
    stellen = punkteS.toCharArray();
    if (punkte < 10){
      stelle1 = '0';
      stelle2 = punkteS.charAt(0);
    } else if (punkte >= 10){
      stelle1 = stellen[0];
      stelle2 = stellen[1];
    }

    // Stelle 1:
    if (stelle1 == '0') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/0.png";
    } else if (stelle1 == '1') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/1.png";
    } else if (stelle1 == '2') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/2.png";
    } else if (stelle1 == '3') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/3.png";
    } else if (stelle1 == '4') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/4.png";
    } else if (stelle1 == '5') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/5.png";
    } else if (stelle1 == '6') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/6.png";
    } else if (stelle1 == '7') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/7.png";
    } else if (stelle1 == '8') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/8.png";
    } else if (stelle1 == '9') {
      this.bildPfadStelle1 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/9.png";
    }

    // Stelle 2:
    if (stelle2 == '0') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/0.png";
    } else if (stelle2 == '1') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/1.png";
    } else if (stelle2 == '2') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/2.png";
    } else if (stelle2 == '3') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/3.png";
    } else if (stelle2 == '4') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/4.png";
    } else if (stelle2 == '5') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/5.png";
    } else if (stelle2 == '6') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/6.png";
    } else if (stelle2 == '7') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/7.png";
    } else if (stelle2 == '8') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/8.png";
    } else if (stelle2 == '9') {
      this.bildPfadStelle2 = "C:/Users/bwiens/Documents/GitHub/FlappyBird/data/zahlen/9.png";
    }


    Grafik = loadImage(bildPfadGrafik);
    bildBreiteGrafik = Grafik.width * faktor;
    bildHoeheGrafik = Grafik.height * faktor;

    Stelle1 = loadImage(bildPfadStelle1);
    bildBreiteStelle1 = Stelle1.width * faktor;
    bildHoeheStelle1 = Stelle1.height * faktor;

    Stelle2 = loadImage(bildPfadStelle2);
    bildBreiteStelle2 = Stelle2.width * faktor;
    bildHoeheStelle2 = Stelle2.height * faktor;
  }

  void setzePositionGrafik(float positionXGrafik, float positionYGrafik) {
    this.positionXGrafik = positionXGrafik;
    this.positionYGrafik = positionYGrafik;
  }

  void setzePositionStelle1(float positionXStelle1, float positionYStelle1) {
    this.positionXStelle1 = positionXStelle1;
    this.positionYStelle1 = positionYStelle1;
  }

  void setzePositionStelle2(float positionXStelle2, float positionYStelle2) {
    this.positionXStelle2 = positionXStelle2;
    this.positionYStelle2 = positionYStelle2;
  }

  void zeichneStelle1() {
    image(Stelle1, positionXStelle1, positionYStelle1, bildBreiteStelle1, bildHoeheStelle1);
  }

  void zeichneStelle2() {
    image(Stelle2, positionXStelle2, positionYStelle2, bildBreiteStelle2, bildHoeheStelle2);
  }
}
