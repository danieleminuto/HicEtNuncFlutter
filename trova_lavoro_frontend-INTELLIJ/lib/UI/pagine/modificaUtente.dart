

import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';

import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/UtenteDisplay.dart';
import 'package:trova_lavoro_frontend/UI/pagine/ProfiloUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';
import 'package:trova_lavoro_frontend/UI/utility/popUpVeloce.dart';


class ModificaUtente extends StatefulWidget {
  Utente utente;
  bool eliminaTitoloSingolo=false;
  bool aggiungiTitolo=false;
  bool flagInCorso=false;
  bool lavorando=false;
  ModificaUtente({Key key, @required this.utente}) : super(key: key);
  TitoloDiStudio daAggiungere=new TitoloDiStudio(titolo: null, istruzione: null, annoInizio: null, inCorso: false, voto:0);

  @override
  _ModificaUtenteState createState() => _ModificaUtenteState();
}

class _ModificaUtenteState extends State<ModificaUtente> {
  @override
  Widget build(BuildContext context) {
    Utente usr=new Utente(email: widget.utente.email, nome: widget.utente.nome, cognome: widget.utente.cognome, dataDiNascita: widget.utente.dataDiNascita, maggiorTitoloDiStudio: widget.utente.maggiorTitoloDiStudio, contrattoDesiderato: widget.utente.contrattoDesiderato,descrizione: widget.utente.descrizione, lavoroIdeale: widget.utente.lavoroIdeale, cittaResidenza: widget.utente.cittaResidenza, altriTitoli: widget.utente.altriTitoli);
    TitoloDiStudio daEliminare=new TitoloDiStudio(titolo: null, istruzione: null, annoInizio: null, inCorso: false);




    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar(lavorando: widget.lavorando,),
              Container(
                //height: MediaQuery.of(context).size.height,
                color: verdeSfondo,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
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
                    SizedBox(height: 50,),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            "Data di nascita:  ",
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: InputField(
                          enabled: false,
                          labelText: "${widget.utente.dataDiNascita}",
                          ),
                        ),

                        SizedBox(width: 20,),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                            labelText: "${widget.utente.cittaResidenza}",
                            onChanged: (value){
                              usr.cittaResidenza=value;
                            },

                          ),
                        ),
                      ]
                    ),
                    SizedBox(height: 40,),
                    Wrap(
                        children: [

                          SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return listaContratti.where((String option) {
                                return option.contains(textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (String selection) {
                              usr.contrattoDesiderato=ConvertiFiltri.contrattoStringToEnum(selection);

                            },
                          ),
                        ),

                        SizedBox(width: 20,),

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
                            labelText: "${widget.utente.lavoroIdeale}",
                            onChanged: (value){
                              usr.lavoroIdeale=value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Wrap(
                        children:[
                          Padding(
                           padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                                labelText: "${widget.utente.descrizione}",
                                multiline: true,
                                maxLength: 330,
                                onChanged: (value){
                                  usr.descrizione=value;
                                },
                              ),
                            ),
                          ),

                        ]
                    ),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        moficaAnagrafica(usr, context);
                        },

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      color: verdeBarra,
                      child: Text(
                        "Salva",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      thickness: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                            onPressed: (){
                              removeTitoloDiStudio(widget.utente.maggiorTitoloDiStudio, context);
                            }
                          )
                      ]
                    ),


                    SizedBox(height: 20,),
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
                          onPressed: ()async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Titoli di studio correnti"),
                                  content: Text(widget.utente.nomiTitoli.toString()),
                                  actions: [
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        widget.eliminaTitoloSingolo=true;
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
                              optionsBuilder: (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                              }
                              return widget.utente.nomiTitoli.where((String option) {
                                if(textEditingValue.text.length!=1) {
                                  String sub=textEditingValue.text.substring(1);
                                  return option.contains(sub);
                                }
                                return option.contains(textEditingValue.text.toLowerCase());
                              });
                              },
                                onSelected: (String selection) {
                                  daEliminare.titolo=selection;

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
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return listaIstruzioni.where((String option) {
                                  return option.contains(textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (String selection) {
                                daEliminare.istruzione=ConvertiFiltri.istruzioneStringToEnum(selection);
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
                                onPressed: (){
                                  removeTitoloDiStudio(daEliminare,context);

                                  }
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: Text(
                            "Aggiungi un nuovo titolo di Studio:",
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
                            onPressed: (){
                              widget.aggiungiTitolo=!widget.aggiungiTitolo;
                              setState(() {});
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                Visibility(
                  visible: widget.aggiungiTitolo,
                  child:
                  Column(
                    children: [Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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

                            onChanged: (nome){
                              widget.daAggiungere.titolo=nome;
                            },

                          ),
                        ),
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                            onChanged: (istituto){
                              widget.daAggiungere.istituto=istituto;
                            },


                          ),
                        ),
                      ]
                    ),
                    Wrap(
                      children:[
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return listaIstruzioni.where((String option) {
                                return option.contains(textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (String selection) {
                              widget.daAggiungere.istruzione=ConvertiFiltri.istruzioneStringToEnum(selection);
                            },
                          ),
                        ),
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                            onChanged: (voto){
                              widget.daAggiungere.voto=int.parse(voto);
                            },

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                            onChanged: (anno){
                              widget.daAggiungere.annoInizio=anno;
                            },

                          ),
                        ),
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                            onChanged: (anno){
                              widget.daAggiungere.annoFine=anno;
                            },

                          ),
                        ),
                        SizedBox(width: 20,),
                       Container(
                         width: 200,
                         child: CheckboxListTile(
                             title: Text("In corso di conseguimento: "),
                             value: widget.flagInCorso,
                             onChanged: (value){
                               widget.flagInCorso=value;
                               widget.daAggiungere.inCorso=value;
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
                                if( widget.daAggiungere.titolo==null || widget.daAggiungere.istituto==null
                                || widget.daAggiungere.istruzione==null){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                          return popUpVeloce(
                                          message: "compilare tutti i campi richiesti",
                                          );
                                        }
                                    );
                                }
                                else {
                                  widget.aggiungiTitolo=false;
                                  TitoloDiStudio prova=widget.daAggiungere;
                                  int x=1;
                                  aggiungiTitoloDiStudio(widget.daAggiungere);
                                  }
                                },

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            color: verdeBarra,
                            child: Text(
                              "Aggiungi",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      )
                  ]
                )
              ),
                    SizedBox(height: 300,)
                    //AGGIUNGI E RIMUOVI TITOLO

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void aggiungiTitoloDiStudio(TitoloDiStudio titoloDiStudio){
      setState(() {
        widget.lavorando=true;
      });

      Model.sharedInstance.addTitoloDiStudio(titoloDiStudio).then((utente){
        if(utente!=null) {
          widget.utente = utente;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return popUpVeloce(
                  message: "Aggiunto correttamente",
                );
              }
          );
        }
        setState(() { widget.lavorando=false;});
      }
    );
  }
  void removeTitoloDiStudio(TitoloDiStudio titoloDiStudio, BuildContext context){
    setState(() {
      widget.lavorando=true;
    });

    Model.sharedInstance.removeTitoloDiStudio(titoloDiStudio).then((utente) {
      if (utente != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return popUpVeloce(
                message: "Eliminato",
              );
            }
        );
        widget.utente = utente;
        setState(() {widget.lavorando=false;});
      }
      else{
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return popUpVeloce(
                message: "Titolo di studio non valido",
              );
            }
        );
      }
    }
    );
  }

  void moficaAnagrafica(Utente utente, BuildContext context) {
    setState(() {
      widget.lavorando=true;
    });

    Model.sharedInstance.updateAnagrafica(utente).then((utenteModificato) {
      if (utenteModificato != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return popUpVeloce(
                message: "Modifica completata",
              );
            }
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProfiloUtente(utente: utenteModificato),
          ),
        );
      }
      else{
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return popUpVeloce(
                message: "Errore, riprova!",
              );
            }
        );
      }
      }
    );

  }

}
