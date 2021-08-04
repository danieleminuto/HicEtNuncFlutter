
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomeUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/HomeEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/ProfiloEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/RicercaUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/ProfiloUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomePageWidget.dart';



class NavbarEmployer extends StatefulWidget {
  bool lavorando=false;

  NavbarEmployer({Key key, this.lavorando});
  @override

  _NavbarEmployerState createState() => _NavbarEmployerState();
}

class _NavbarEmployerState extends State<NavbarEmployer> {
  String text;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      color: verdeBarra,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Text(
              'Trovare Lavoro è Facile!',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Pattaya',
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Visibility(child: CircularProgressIndicator(strokeWidth: 2,), visible: widget.lavorando ,),
          Container(
            width: 500,
            height: 50,
            child: Padding(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/8, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 2, 5),
                      child: TextFormField(
                        onChanged: (value){
                          text=value;
                        },
                        onFieldSubmitted: (value){
                          avviaRicercaKeyword(text, context);
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Ricerca',
                          hintStyle:
                          TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0x6CFFFFFF),
                          contentPadding:
                          EdgeInsets.fromLTRB(0, 0, 0, 6),
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      avviaRicercaKeyword(text, context);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    iconSize: 30,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(200, 5, 0, 0),
            child: IconButton(
              onPressed: ()  {
                navigaHome(context);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              iconSize: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: IconButton(
              onPressed: ()  {
                caricaProfilo(context);

              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
              iconSize: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
            child: IconButton(
              onPressed: ()  {
                logout(context);

              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
              iconSize: 30,
            ),
          )
        ],
      ),



    );

  }


  void caricaProfilo(BuildContext context){
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.getEmployer().then((employer) async {
      print(employer.toString());
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProfiloEmployer(
                employer: employer,
              ),
        ),
      );
    });
  }

  void navigaHome(BuildContext context) {
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.caricaAnnunci(0).then((annunci) async {
      if (annunci.isEmpty) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeEmployerWidget(

                  annunci: [
                    Annuncio(emailDatore: 'admin',
                        gradoIstruzioneRichiesto: 0,
                        titolo: 'Nessun Annuncio Trovato',
                        numCandidature: 0)
                  ],
                ),
          ),
        );
      }
      else {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeEmployerWidget(

                  annunci: annunci,
                ),
          ),
        );
      }
    }
    );
  }

  avviaRicercaKeyword(String keyWord,BuildContext context) {
    setState(() {
      widget.lavorando = true;
    });
    if(keyWord=="" || keyWord==null){
      keyWord=" ";
    }
    Model.sharedInstance.cercaKeywordEmployer(keyWord,0).then((value) {
      if (value.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RicercaUtente(
                  text: keyWord,
                  daAnnuncio: false,
                  utenti:value,
                ),
          ),
        );
      }
      else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RicercaUtente(
                  text: keyWord,
                  daAnnuncio: false,
                  utenti: [
                    Utente(maggiorTitoloDiStudio:
                    TitoloDiStudio(titolo: "", istruzione: null, annoInizio: '', inCorso: false) ,
                        email: '', dataDiNascita: '', contrattoDesiderato: null, nome: 'Nessun utente Trovato', cognome: '',altriTitoli: [])
                  ],
                ),
          ),
        );
      }
    }
    );
  }

  void logout(BuildContext context) {
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.logOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePageWidget()
        ),
      );
    });
  }
}
