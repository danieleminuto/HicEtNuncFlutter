import 'package:flutter/cupertino.dart';

import '../../UI/utility/Contratto.dart';
import '../../UI/utility/Istruzione.dart';
import 'Titolo di Studio.dart';

class Utente {

  Utente({@required this.email, @required this.nome, @required this.cognome, @required this.dataDiNascita, this.cittaResidenza
  ,@required this.maggiorTitoloDiStudio, this.altriTitoli, this.lavoroIdeale, @required this.contrattoDesiderato, this.descrizione,this.nomiTitoli});
//++++++ anagrafica +++++/
String email;
String nome;
String cognome;
String dataDiNascita;
String cittaResidenza;
String descrizione;

//+++++++++ istruzione ++++++++//

TitoloDiStudio maggiorTitoloDiStudio;
List<TitoloDiStudio> altriTitoli;
String lavoroIdeale;
List<String> nomiTitoli;

Contratto contrattoDesiderato;

  @override
  String toString() {
    return 'Utente{email: $email, nome: $nome, cognome: $cognome, dataDiNascita: $dataDiNascita, cittaResidenza: $cittaResidenza, descrizione: $descrizione, maggiorTitoloDiStudio: $maggiorTitoloDiStudio, altriTitoli: $altriTitoli, lavoroIdeale: $lavoroIdeale, contrattoDesiderato: $contrattoDesiderato, nomiTitoli: $nomiTitoli}';
  }

  factory Utente.fromJson(Map<String, dynamic> json) {
    TitoloDiStudio tds= TitoloDiStudio.fromJson(json['maggiorTitoloDiStudio']);
    List<TitoloDiStudio> altriTitoli= List<TitoloDiStudio>.from(json['altriTitoli'].map((i) => TitoloDiStudio.fromJson(i)).toList());
    List<String> nomiTitoli=List<String>.from(json['nomiTitoli']);
    Contratto contratto=ContrattoConverter.fromString(json['contrattoDesiderato']);
    return Utente(
      email: json['email'],
      nome: json['nome'],
      cognome: json['cognome'],
      dataDiNascita: json['dataDiNascita'],
      cittaResidenza: json['cittaResidenza'],
      descrizione: json['descrizione'],
      maggiorTitoloDiStudio: tds,
      nomiTitoli: nomiTitoli,
      altriTitoli: altriTitoli,
      lavoroIdeale: json['lavoroIdeale'],
      contrattoDesiderato: contratto,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'nome': nome,
    'cognome': cognome,
    'dataDiNascita': dataDiNascita,
    'cittaResidenza': cittaResidenza,
    'descrizione': descrizione,
    'maggiorTitoloDiStudio': maggiorTitoloDiStudio,
    'altriTitoli': altriTitoli,
    'lavoroIdeale': lavoroIdeale,
    'contrattoDesiderato': ContrattoConverter.getString(contrattoDesiderato),
    'nomiTitoli': nomiTitoli,

  };
}

