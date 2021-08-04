import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomeUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/AnnuncioDisplay.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomePageWidget.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/pagine/LoginUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/ProfiloUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/RegistrationUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/modificaUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';

import 'Model/objects/Titolo di Studio.dart';

void main() {

  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    TitoloDiStudio titoloDiStudio=new TitoloDiStudio(titolo: "titolo", istruzione: Istruzione.DIPLOMA, annoInizio: "dataInizio", inCorso: false);
    Utente u= Utente(email: "daniele@gmail.com", nome: "daniele", cognome: "cognome", dataDiNascita: "dataDiNascita", maggiorTitoloDiStudio: titoloDiStudio, contrattoDesiderato: Contratto.NS, altriTitoli: [titoloDiStudio,titoloDiStudio,titoloDiStudio]);
    return MaterialApp(
      title: 'Hic et Nunc',
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      home: HomePageWidget()
      //ModificaUtente(utente: u)
      //ProfiloUtente(utente: u),
      //AnnuncioDisplayWidget(autore: "Daniele", emailAutore: "danieleminuto99@gmail.com", data: DateTime.now(), nCandidati: 0,titolo: "BRAVI TUTTI"),
    );
  }
}

