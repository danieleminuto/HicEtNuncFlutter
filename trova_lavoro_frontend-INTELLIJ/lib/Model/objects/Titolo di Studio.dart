
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';

class TitoloDiStudio {

  TitoloDiStudio({@required this.titolo, @required this.istruzione, this.voto, this.annoFine, @required this.annoInizio
    ,@required this.inCorso, this.istituto});
  String titolo="";
  /* ricorda che questo non lo devi dare in input, devi farlo sceglie. è un' enum*/
  Istruzione istruzione;
  int voto;
  bool inCorso;
  String istituto;
  String annoInizio;
  String annoFine;

  @override
  String toString() {
    return 'TitoloDiStudio{titolo: $titolo, istruzione: $istruzione, voto: $voto, inCorso: $inCorso, istituto: $istituto, annoInizio: $annoInizio, annoFine: $annoFine}';
  }

  factory TitoloDiStudio.fromJson(Map<String, dynamic> json) {
    Istruzione istr=IstruzioneConverter.fromString( json['istruzione']);
    return TitoloDiStudio(
      titolo: json['titolo'],
      istruzione: istr,
      voto: json['voto'],
      inCorso: json['inCorso'],
      istituto: json['istituto'],
      annoInizio: json['annoInizio'],
      annoFine: json['annoFine'],
    );
  }

  Map<String, dynamic> toJson() => {
    'titolo': titolo,
    'istruzione': IstruzioneConverter.getString(istruzione),
    'voto': voto,
    'inCorso': inCorso,
    'istituto': istituto,
    'annoInizio': annoInizio,
    'annoFine': annoFine,
  };

}


