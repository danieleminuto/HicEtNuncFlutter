import 'Contratto.dart';
import 'Istruzione.dart';

class ConvertiFiltri{

  static String istruzioneEnumToString(Istruzione i){
    switch(i){
      case Istruzione.LICENZAELEMENTARE:
        return "licenza Elementare";
      case Istruzione.LICENZAMEDIA:
        return "licenza Media";
      case Istruzione.DIPLOMA:
        return "diploma";
      case Istruzione.LAUREATRIENNALE:
        return "laurea Triennale";
      case Istruzione.LAUREAMAGISTRALE:
        return "laurea Magistrale";
      case Istruzione.MASTER2LIVELLO:
        return "master II Livello";
      default:
        return "dottorato";
    }
  }

  static Istruzione istruzioneStringToEnum(String i){
    switch(i){
      case "licenza Elementare":
        return Istruzione.LICENZAELEMENTARE;
      case "licenza Media":
        return Istruzione.LICENZAMEDIA;
      case "diploma":
        return Istruzione.DIPLOMA;
      case "laurea Triennale":
        return Istruzione.LAUREATRIENNALE;
      case "laurea Magistrale":
        return Istruzione.LAUREAMAGISTRALE;
      case "master II Livello":
        return Istruzione.MASTER2LIVELLO;
      case "dottorato":
        return Istruzione.DOTTORATO;
      default:
        return null;

    }
  }

  static Contratto contrattoStringToEnum(String s) {
    switch (s) {
      case "stage e Tirocini" :
        return Contratto.STAGETIROCINI;
      case "apprendistato alta formazione e ricerca" :
        return Contratto.APPRENDISTATOALTAFORMAZIONEERICERCA;
      case "apprendistato qualifica post diploma" :
        return Contratto.APPRENDISTATOQUALIFICAPOSTDIPLOMA;
      case "collaborazione a progetto" :
        return Contratto.COLLABORAZIONEPROGETTO;
      case "collaborazione occasionale":
        return Contratto.COLLABORAZIONEOCCASIONALE;
      case "inserimento" :
        return Contratto.INSERIMENTO;
      case "autonomo":
        return Contratto.AUTONOMO;
      case "determinato":
        return Contratto.DETERMINATO;
      case "indeterminato":
        return Contratto.INDETERMINATO;
      case "part time":
        return Contratto.PARTTIME;
      case "apprendistato professionalizzante":
        return Contratto.APPRENDISTATOPROFESSIONALIZZANTE;
      case "apprendistato":
        return Contratto.APPRENDISTATO;
      case "ns":
        return Contratto.NS;
      default:
        return null;
    }
  }
  static String contrattoEnumToString(Contratto c) {
    switch (c) {
      case Contratto.APPRENDISTATO:
        return "apprendistato";
      case Contratto.APPRENDISTATOPROFESSIONALIZZANTE:
        return "apprendistato professionalizzante";
      case Contratto.PARTTIME:
        return "part time";
      case Contratto.INDETERMINATO:
        return "indeterminato";
      case Contratto.DETERMINATO:
        return "determinato";
      case Contratto.AUTONOMO:
        return "autonomo";
      case Contratto.INSERIMENTO:
        return "inserimento";
      case Contratto.COLLABORAZIONEOCCASIONALE:
        return "collaborazione occasionale";
      case Contratto.COLLABORAZIONEPROGETTO:
        return "collaborazione a progetto";
      case Contratto.APPRENDISTATOQUALIFICAPOSTDIPLOMA:
        return "apprendistato qualifica post diploma";
      case Contratto.APPRENDISTATOALTAFORMAZIONEERICERCA:
        return "apprendistato alta formazione e ricerca";
      case Contratto.STAGETIROCINI:
        return "stage e Tirocini";
      default:
        return "ns";
    }
  }

}
