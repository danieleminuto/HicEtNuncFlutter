import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';

class Filtri {

   List<String> contrattiAccettati;
   bool sceltaContratti;
   List<String> istruzioneAccettata;
   bool sceltaIstruzione;

   Filtri({this.contrattiAccettati,this.istruzioneAccettata,this.sceltaContratti,this.sceltaIstruzione});

  factory Filtri.fromJson(Map<String, dynamic> json) {
     List<String> contratti= List<String>.from(json['contrattiAccettati'].map((i) => ContrattoConverter.getString(i)).toList());
     List<String> istruzione= List<String>.from(json['istruzioneAccettata'].map((i) => IstruzioneConverter.getString(i)).toList());

     return Filtri(
       contrattiAccettati: contratti,
       sceltaContratti: json['sceltaContratti'],
       istruzioneAccettata: istruzione,
       sceltaIstruzione: json['sceltaIstruzione'],

     );
   }

   Map<String, dynamic> toJson() => {
     'contrattiAccettati': contrattiAccettati,
     'sceltaContratti': sceltaContratti,
     'istruzioneAccettata': istruzioneAccettata,
     'sceltaIstruzione': sceltaIstruzione,

   };

   @override
  String toString() {
    return 'Filtri{contrattiAccettati: $contrattiAccettati, sceltaContratti: $sceltaContratti, istruzioneAccettata: $istruzioneAccettata, sceltaIstruzione: $sceltaIstruzione}';
  }
}
