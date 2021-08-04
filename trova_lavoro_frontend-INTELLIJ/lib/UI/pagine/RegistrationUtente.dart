

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/pagine/LoginUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';
import 'package:trova_lavoro_frontend/UI/utility/popUpVeloce.dart';


class RegistrationUtente extends StatefulWidget {
  Utente utente=new Utente(email: null, nome: null, cognome: null, dataDiNascita: null, maggiorTitoloDiStudio: null, contrattoDesiderato: null);
  bool eliminaTitoloSingolo=false;
  bool aggiungiTitolo1=false;
  bool aggiungiTitolo2=false;
  bool flagInCorso1=false;
  bool flagInCorso2=false;
  bool showCalendar=false;
  bool lavorando=false;
  DateTime time=DateTime.utc(2015,12,27);
  String username;
  String password;
  TitoloDiStudio daAggiungere = new TitoloDiStudio(titolo: null, istruzione: null, annoInizio: null, inCorso: false);
  TitoloDiStudio maggiorTitoloDaAggiungere = new TitoloDiStudio(titolo: null, istruzione: null, annoInizio: null, inCorso: false);
  RegistrationUtente({Key key}) : super(key: key);

  @override
  _RegistrationUtenteState createState() => _RegistrationUtenteState();
}

class _RegistrationUtenteState extends State<RegistrationUtente> {
  @override
  Widget build(BuildContext context) {

    TitoloDiStudio daEliminare = new TitoloDiStudio(
        titolo: null, istruzione: null, annoInizio: null, inCorso: false);
    List<String> nomiTitoli = [];
    if (widget.utente.maggiorTitoloDiStudio != null)
      nomiTitoli.add(widget.utente.maggiorTitoloDiStudio.titolo.toLowerCase());
    if (widget.utente.altriTitoli == null) {
      widget.utente.altriTitoli = [];
      setState(() {});
    }
    for (TitoloDiStudio t in widget.utente.altriTitoli) {
      nomiTitoli.add(t.titolo);
    }



    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: verdeBarra,
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
            child: Wrap(

              children: [
                Text(
                  'Trovare Lavoro è Facile!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),

                ),

              ],
            ),
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                //height: MediaQuery.of(context).size.height,
                color: verdeSfondo,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Column(
                  children: [

                    SizedBox(height: 50,),
                    // email
                    Wrap(
                        children: [
                          Container(
                            width: 500,
                            child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Email:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "email *",
                                      onChanged: (value) {
                                        widget.utente.email = value;
                                        widget.username = value;
                                      },
                                      isUsername: true,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 30,),
                    // password
                    Wrap(
                        children: [
                          Container(
                            width: 500,
                            child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Password:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "password *",
                                      onChanged: (value) {
                                        widget.password = value;
                                      },
                                      isPassword: true,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 30,),
                    // nome
                    Wrap(
                        children: [
                          Container(
                            width: 500,
                            child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Nome:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Nome *",
                                      onChanged: (value) {
                                        widget.utente.nome = value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 30,),
                    // cognome
                    Wrap(
                        children: [
                          Container(
                            width: 500,
                            child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Cognome:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Cognome *",
                                      onChanged: (value) {
                                        widget.utente.cognome = value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 30,),
                    // Data Di nascita
                    Wrap(
                      children: [
                        Container(
                          width: 500,
                          child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    "Data di nascita:  ",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: !widget.showCalendar,
                                  child: Wrap(
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.calendar_today,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            widget.showCalendar =
                                            !widget.showCalendar;
                                            setState(() {});
                                          }
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 0, 0),
                                        child: Text(
                                            "*"
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: widget.showCalendar,
                                  child: Container(
                                    width: 300,
                                    height: 200,
                                    child: CalendarDatePicker(
                                      onDateChanged: (DateTime value) {
                                        widget.time = value;
                                        widget.utente.dataDiNascita =
                                            value.toString();
                                        widget.showCalendar =
                                        !widget.showCalendar;
                                        setState(() {});
                                      },
                                      firstDate: DateTime(1900, 1),
                                      initialDate: widget.time,
                                      lastDate: DateTime.now(),


                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    // Residenza
                    Wrap(
                        children: [
                          Container(
                            width: 500,
                            child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Residente a:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Residenza",
                                      onChanged: (value) {
                                        widget.utente.cittaResidenza = value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 30,),
                    //Contratto
                    Wrap(
                      children: [
                        Container(
                          width: 500,
                          child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    "Contratto desiderato:  ",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  child: Autocomplete<String>(
                                    optionsBuilder: (
                                        TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return listaContratti.where((
                                          String option) {
                                        return option.contains(
                                            textEditingValue.text
                                                .toLowerCase());
                                      });
                                    },
                                    onSelected: (String selection) {
                                      widget.utente.contrattoDesiderato =
                                          ConvertiFiltri.contrattoStringToEnum(
                                              selection);
                                    },
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    //Lavoro Desiderato
                    Wrap(
                      children: [
                        Container(
                          width: 500,
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Text(
                                  "Lavoro desiderato:  ",
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Container(
                                width: 300,
                                child: InputField(
                                  labelText: "Lavoro ideale",
                                  onChanged: (value) {
                                    widget.utente.lavoroIdeale = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    //Descrizione
                    Wrap(
                      children: [
                        Container(
                          width: 500,
                          child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 30, 0, 0),
                                  child: Text(
                                    "Descrizione:  ",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InputField(
                                      labelText: "Descriviti",
                                      multiline: true,
                                      maxLength: 330,
                                      onChanged: (value) {
                                        widget.utente.descrizione = value;
                                      },
                                    ),
                                  ),
                                ),

                              ]
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // aggiungi maggior titolo di studio
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Aggiungi il tuo maggior titolo di Studio*:",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              widget.aggiungiTitolo1 = !widget.aggiungiTitolo1;
                              setState(() {});
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Visibility(
                        visible: widget.aggiungiTitolo1,
                        child:
                        Column(
                            children: [Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Nome Titolo*:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Nome",
                                      onChanged: (value) {
                                        widget.maggiorTitoloDaAggiungere.titolo =
                                            value;
                                      },

                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Ente rilasciante*:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Istituto",
                                      onChanged: (value) {
                                        widget.maggiorTitoloDaAggiungere.istituto =
                                            value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                              Wrap(
                                children: [
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Grado titolo*:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: Autocomplete<String>(
                                      optionsBuilder: (
                                          TextEditingValue textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return listaIstruzioni.where((
                                            String option) {
                                          return option.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      onSelected: (String selection) {
                                        widget.maggiorTitoloDaAggiungere.istruzione =
                                            ConvertiFiltri
                                                .istruzioneStringToEnum(
                                                selection);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Voto:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "voto",
                                      onChanged: (value) {
                                        widget.maggiorTitoloDaAggiungere.voto =
                                            int.parse(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Anno Inizio:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: InputField(
                                      labelText: "Anno",
                                      maxLength: 4,
                                      onChanged: (value) {
                                        widget.maggiorTitoloDaAggiungere.annoInizio =
                                            value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Anno Fine (o Previsto):  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: InputField(
                                      labelText: "Anno",
                                      maxLength: 4,
                                      onChanged: (value) {
                                        widget.maggiorTitoloDaAggiungere.annoFine =
                                            value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                        title: Text(
                                            "In corso di conseguimento: "),
                                        value: widget.flagInCorso1,
                                        onChanged: (value) {
                                          widget.flagInCorso1 = value;
                                          widget.maggiorTitoloDaAggiungere.inCorso =
                                              value;
                                          setState(() {});
                                        }
                                    ),
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  MaterialButton(
                                    minWidth: 20,
                                    onPressed: () {
                                      if (widget.maggiorTitoloDaAggiungere.titolo ==
                                          null ||
                                          widget.maggiorTitoloDaAggiungere.istituto ==
                                              null
                                          || widget.maggiorTitoloDaAggiungere
                                              .istruzione == null) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return popUpVeloce(
                                                message: "compilare tutti i campi richiesti",
                                              );
                                            }
                                        );
                                      }
                                      else {
                                        widget.utente.maggiorTitoloDiStudio =
                                            widget.maggiorTitoloDaAggiungere;
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return popUpVeloce(
                                                message: "${widget.maggiorTitoloDaAggiungere
                                                    .toString()} \nAggiunto correttamente!",
                                              );
                                            }
                                        );
                                        widget.aggiungiTitolo1 = false;
                                        setState(() {});
                                      }
                                    },

                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    color: verdeBarra,
                                    child: Text(
                                      "Aggiungi",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ]
                        )
                    ),
                    // aggiungi titolo
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Aggiungi un altro titolo di Studio:",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              widget.aggiungiTitolo2 = !widget.aggiungiTitolo2;
                              setState(() {});
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Visibility(
                        visible: widget.aggiungiTitolo2,
                        child:
                        Column(
                            children: [Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Nome Titolo*:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Nome",
                                      onChanged: (value) {
                                        widget.daAggiungere.titolo = value;
                                      },

                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      "Ente rilasciante*:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Istituto",
                                      onChanged: (value) {
                                        widget.daAggiungere.istituto = value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                              Wrap(
                                children: [
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Grado titolo*:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: Autocomplete<String>(
                                      optionsBuilder: (
                                          TextEditingValue textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return listaIstruzioni.where((
                                            String option) {
                                          return option.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      onSelected: (String selection) {
                                        widget.daAggiungere.istruzione = ConvertiFiltri
                                            .istruzioneStringToEnum(selection);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Voto:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "voto",
                                      onChanged: (value) {
                                        widget.daAggiungere.voto = int.parse(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Anno Inizio:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: InputField(
                                      labelText: "Anno",
                                      maxLength: 4,
                                      onChanged: (value) {
                                        widget.daAggiungere.annoInizio = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 20, 0, 0),
                                    child: Text(
                                      "Anno Fine (o Previsto):  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: InputField(
                                      labelText: "Anno",
                                      maxLength: 4,
                                      onChanged: (value) {
                                        widget.daAggiungere.annoFine = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    width: 200,
                                    child: CheckboxListTile(
                                        title: Text(
                                            "In corso di conseguimento: "),
                                        value: widget.flagInCorso2,
                                        onChanged: (value) {
                                          widget.flagInCorso2 = value;
                                          widget.daAggiungere.inCorso = value;
                                          setState(() {});
                                        }
                                    ),
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  MaterialButton(
                                    minWidth: 20,
                                    onPressed: () {
                                      if (widget.daAggiungere.titolo == null || widget.daAggiungere.istituto == null
                                          || widget.daAggiungere.istruzione == null) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return popUpVeloce(
                                                message: "compilare tutti i campi richiesti",
                                              );
                                            }
                                        );
                                      }
                                      else {
                                        widget.utente.altriTitoli.add(
                                            widget.daAggiungere);
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return popUpVeloce(
                                                message: "${widget.daAggiungere.toString()} \nAggiunto correttamente!",
                                              );
                                            }
                                        );
                                        widget.aggiungiTitolo2 = false;
                                        setState(() {});
                                      }
                                    },

                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    color: verdeBarra,
                                    child: Text(
                                      "Aggiungi",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                            ]
                        )
                    ),
                    //Rimuovi maggior titolo di studio
                    Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              "Rimuovi il maggior titolo di studio:  ",
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return popUpVeloce(
                                        message: "Eliminato",
                                      );
                                    }
                                );
                                bool elimina = true;
                                for (TitoloDiStudio t in widget.utente
                                    .altriTitoli) {
                                  if (t.titolo == daEliminare.titolo)
                                    elimina = false;
                                }
                                if (elimina)
                                  nomiTitoli.remove(daEliminare.titolo);
                                print("Rimuovo il maggior titolo di Studio");
                              }
                          )
                        ]
                    ),
                    SizedBox(height: 20,),
                    //Rimuovi altro titolo
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Rimuovi un altro titolo di studio:",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        IconButton(
                            icon: Icon(
                              Icons.info_outline,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Titoli di studio correnti"),
                                    content: Text(nomiTitoli.toString()),
                                    actions: [
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          widget.eliminaTitoloSingolo = true;
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                        ),
                      ],
                    ),
                    Visibility(
                      visible: widget.eliminaTitoloSingolo,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Text(
                              "Nome Titolo:  ",
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Autocomplete<String>(
                              optionsBuilder: (
                                  TextEditingValue textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return nomiTitoli.where((String option) {
                                  return option.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (String selection) {
                                daEliminare.titolo = selection;
                                print('You just selected $selection');
                              },
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Text(
                              "grado:  ",
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Autocomplete<String>(
                              optionsBuilder: (
                                  TextEditingValue textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return listaIstruzioni.where((String option) {
                                  return option.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (String selection) {
                                daEliminare.istruzione =
                                    ConvertiFiltri.istruzioneStringToEnum(
                                        selection);
                                print('You just selected $selection');
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.delete_sweep,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  TitoloDiStudio tmp = null;
                                  for (TitoloDiStudio t in widget.utente
                                      .altriTitoli) {
                                    if (t.titolo == daEliminare.titolo &&
                                        t.istruzione ==
                                            daEliminare.istruzione) {
                                      tmp = t;
                                    }
                                  }
                                  if (tmp != null) {
                                    if (widget.utente.maggiorTitoloDiStudio
                                        .titolo != tmp.titolo)
                                      widget.utente.altriTitoli.remove(tmp);
                                    nomiTitoli.remove(tmp.titolo);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return popUpVeloce(
                                            message: "Eliminato",
                                          );
                                        }
                                    );
                                  }
                                  else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return popUpVeloce(
                                            message: "Titolo non esistente",
                                          );
                                        }
                                    );
                                  }
                                  widget.eliminaTitoloSingolo = false;
                                  setState(() {});
                                }
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),

                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        if (widget.username == null ||
                            !regexEmail.hasMatch(widget.username) ||
                            widget.password == null || widget.time == DateTime.utc(2015,12,27)
                            || widget.utente.nome == null || widget.utente.cognome == null ||
                            widget.utente.maggiorTitoloDiStudio == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return popUpVeloce(
                                  message: "compilare tutti i campi richiesti",
                                );
                              }
                          );
                        }
                        else {

                          registrami(widget.utente, widget.username, widget
                              .password, context);
                        }
                      },

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0))),
                      color: verdeBarra,
                      child: Text(
                        "Registrami",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    Visibility(
                      child: CircularProgressIndicator(strokeWidth: 2,),
                      visible: widget.lavorando,),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registrami(Utente utente, String email, String password,
      BuildContext context) async {
    setState(() {
      widget.lavorando = true;
    });
    await Model.sharedInstance.registraUser(utente, email, password).then((
        value) async {
      if (value) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginUser(),
          ),
        );
      }
    });
  }

}
