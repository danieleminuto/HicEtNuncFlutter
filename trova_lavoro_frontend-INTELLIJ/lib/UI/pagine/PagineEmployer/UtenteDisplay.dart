import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/NavBarEmployer.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/titoloDiStudioWidget.dart';
import 'package:trova_lavoro_frontend/UI/pagine/modificaUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';

class UtenteDisplayWidget extends StatefulWidget {

  Utente utente;
  bool lavorando=false;
  bool contatti=false;

  UtenteDisplayWidget({Key key, @required this.utente}) : super(key: key);
  @override
  _UtenteDisplayWidgetState createState() => _UtenteDisplayWidgetState();
}

class _UtenteDisplayWidgetState extends State<UtenteDisplayWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavbarEmployer(lavorando: widget.lavorando,),
              Container(
                color: verdeSfondo,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Center(
                      child: Wrap(
                        children: [
                          Text(
                            "${widget.utente.nome} ${widget.utente.cognome}",
                            style: TextStyle(
                                fontSize: 30
                            ),
                          ),

                        ],
                      ),
                    ),
                    // SECONDA RIGA
                    SizedBox(height: 20,),
                    Wrap(
                      children: [
                        Text(
                          "Data di nascita:  ",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          "${widget.utente.dataDiNascita}",
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                        ),

                        SizedBox(width: 20,),

                        Text(
                          "Residente a:  ",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          "${widget.utente.cittaResidenza}",
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                        ),

                        SizedBox(width: 20,),

                        Text(
                          "Contratto desiderato:  ",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          ConvertiFiltri.contrattoEnumToString(widget.utente.contrattoDesiderato),
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                        ),

                        SizedBox(width: 20,),

                        Text(
                          "Lavoro desiderato:  ",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          "${widget.utente.lavoroIdeale}",
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Wrap(
                        children:[

                          Text(
                            "Descrizione:  ",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: verdeBarra,
                                    width: 2.0
                                )
                            ),
                            child: Container(
                              width: 400,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${widget.utente.descrizione}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        child: Column(
                          children: [
                            Text(
                              "Maggior titolo di studio:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height:10),
                            titoloDiStudioWidget(titolo: widget.utente.maggiorTitoloDiStudio),
                          ],
                        )
                    ),
                    SizedBox(height:30),
                    Text(
                      "Altri titoli:",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height:10),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.utente.altriTitoli.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: titoloDiStudioWidget(
                                  titolo: widget.utente.altriTitoli[index],
                                ),
                              ),
                            )
                        );
                      },

                    ),
                    SizedBox(height: 20,),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        widget.contatti=true;
                        setState(() {

                        });
                      },

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      color: verdeBarra,
                      child: Text(
                        "Mostra Contatti",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(child: Visibility(
                        visible: widget.contatti,
                        child: Text(widget.utente.email))),
                    SizedBox(height: 100,)

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
