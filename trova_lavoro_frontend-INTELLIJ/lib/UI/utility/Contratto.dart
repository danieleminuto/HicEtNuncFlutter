 
enum Contratto {
    APPRENDISTATO,
    APPRENDISTATOPROFESSIONALIZZANTE,
    PARTTIME,
    INDETERMINATO,
    DETERMINATO,
    AUTONOMO,
    INSERIMENTO,
    COLLABORAZIONEOCCASIONALE,
    COLLABORAZIONEPROGETTO,
    APPRENDISTATOQUALIFICAPOSTDIPLOMA,
    APPRENDISTATOALTAFORMAZIONEERICERCA,
    STAGETIROCINI,
    NS
}

class ContrattoConverter{
    static String getString(Contratto c) {
        switch (c) {
            case Contratto.APPRENDISTATO:
                return "APPRENDISTATO" ;
            case Contratto.APPRENDISTATOPROFESSIONALIZZANTE:
                return "APPRENDISTATOPROFESSIONALIZZANTE" ;
            case Contratto.PARTTIME:
                return "PARTTIME" ;
            case Contratto.INDETERMINATO :
                return "INDETERMINATO" ;
            case Contratto.DETERMINATO :
                return "DETERMINATO" ;
            case Contratto.AUTONOMO:
                return "AUTONOMO" ;
            case Contratto.INSERIMENTO:
                return "INSERIMENTO" ;
            case Contratto.COLLABORAZIONEOCCASIONALE:
                return "COLLABORAZIONEOCCASIONALE" ;
            case Contratto.COLLABORAZIONEPROGETTO:
                return "COLLABORAZIONEPROGETTO" ;
            case Contratto.APPRENDISTATOQUALIFICAPOSTDIPLOMA:
                return "APPRENDISTATOQUALIFICAPOSTDIPLOMA" ;
            case Contratto.APPRENDISTATOALTAFORMAZIONEERICERCA :
                return "APPRENDISTATOALTAFORMAZIONEERICERCA";
            case Contratto.STAGETIROCINI:
                return "STAGETIROCINI" ;
            default:
                return "NS";
        }
    }
    static Contratto fromString(String s){
        switch(s){
            case "APPRENDISTATO":
                return Contratto.APPRENDISTATO ;
            case "APPRENDISTATOPROFESSIONALIZZANTE":
                return Contratto.APPRENDISTATOPROFESSIONALIZZANTE ;
            case "PARTTIME":
                return Contratto.PARTTIME ;
            case "INDETERMINATO":
                return Contratto.INDETERMINATO ;
            case "DETERMINATO":
                return Contratto.DETERMINATO ;
            case "AUTONOMO":
                return Contratto.AUTONOMO ;
            case "INSERIMENTO":
                return Contratto.INSERIMENTO ;
            case "COLLABORAZIONEOCCASIONALE":
                return Contratto.COLLABORAZIONEOCCASIONALE ;
            case "COLLABORAZIONEPROGETTO":
                return Contratto.COLLABORAZIONEPROGETTO ;
            case "APPRENDISTATOQUALIFICAPOSTDIPLOMA":
                return Contratto.APPRENDISTATOQUALIFICAPOSTDIPLOMA ;
            case "APPRENDISTATOALTAFORMAZIONEERICERCA":
                return Contratto.APPRENDISTATOALTAFORMAZIONEERICERCA ;
            case "STAGETIROCINI":
                return Contratto.STAGETIROCINI ;
            default:
                return Contratto.NS;
        }
    }
}

