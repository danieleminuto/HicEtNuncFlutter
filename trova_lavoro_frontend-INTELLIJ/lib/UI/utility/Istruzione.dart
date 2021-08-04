enum Istruzione {
  LICENZAELEMENTARE,
  LICENZAMEDIA,
  DIPLOMA,
  LAUREATRIENNALE,
  LAUREAMAGISTRALE,
  MASTER2LIVELLO,
  DOTTORATO


}

class IstruzioneConverter{


  static String getString(Istruzione i){
    switch(i){

      case Istruzione.LICENZAELEMENTARE:
        return "LICENZAELEMENTARE";
      case Istruzione.LICENZAMEDIA:
        return "LICENZAMEDIA";
      case Istruzione.DIPLOMA:
        return "DIPLOMA";
      case Istruzione.LAUREATRIENNALE:
        return "LAUREATRIENNALE";
      case Istruzione.LAUREAMAGISTRALE:
        return "LAUREAMAGISTRALE";
      case Istruzione.MASTER2LIVELLO:
        return "MASTER2LIVELLO";
      case Istruzione.DOTTORATO:
        return "DOTTORATO";
    }
  }

  static Istruzione fromString(String s){
    switch(s){
      case "LICENZAELEMENTARE":
        return Istruzione.LICENZAELEMENTARE;
      case "LICENZAMEDIA":
        return Istruzione.LICENZAMEDIA;
      case "DIPLOMA":
        return Istruzione.DIPLOMA;
      case "LAUREATRIENNALE":
        return Istruzione.LAUREATRIENNALE;
      case "LAUREAMAGISTRALE":
        return Istruzione.LAUREAMAGISTRALE;
      case "MASTER2LIVELLO":
        return Istruzione.MASTER2LIVELLO;
      default:
        return Istruzione.DOTTORATO;

    }
  }

  static String fromStringHumanFriendly(String s){
    switch(s){
      case "LICENZAELEMENTARE":
        return "Licenza elementare";
      case "LICENZAMEDIA":
        return "Licenza media";
      case "DIPLOMA":
        return "Diploma";
      case "LAUREATRIENNALE":
        return "Laurea triennale";
      case "LAUREAMAGISTRALE":
        return "Laurea magistrale";
      case "MASTER2LIVELLO":
        return "Master secondo livello";
      default:
        return "Dottorato";

    }
  }
}
