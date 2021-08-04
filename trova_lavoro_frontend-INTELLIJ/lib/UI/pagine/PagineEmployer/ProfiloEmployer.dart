
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/Model/objects/Employer.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/NavBarEmployer.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/titoloDiStudioWidget.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/HomeEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/modificaUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';
import 'package:trova_lavoro_frontend/UI/utility/popUpVeloce.dart';

class ProfiloEmployer extends StatefulWidget {

  Employer employer;
  bool lavorando=false;
  bool aggiungiAnnuncio=false;
  ProfiloEmployer({Key key, @required this.employer}) : super(key: key);
  @override
  _ProfiloEmployerState createState() => _ProfiloEmployerState();
}

class _ProfiloEmployerState extends State<ProfiloEmployer> {
  @override
  Widget build(BuildContext context) {
    Annuncio daAggiungere=new Annuncio(titolo: null, emailDatore: widget.employer.email, numCandidature: 0, contrattoOfferto: null, retribuzioneAnnua: null,descrizione: null,data:DateTime.now().toString(),
    nomeDatore: widget.employer.azienda,requisiti: null,istruzioneRichiesta: null);
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
                            "${widget.employer.nome} ${widget.employer.cognome}",
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
                          "email:  ",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          "${widget.employer.email}",
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                        ),

                        SizedBox(width: 20,),

                        Text(
                          "Azienda:  ",
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        Text(
                          "${widget.employer.azienda}",
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      ]
                    ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        "Aggiungi un nuovo annuncio:",
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
                          widget.aggiungiAnnuncio=!widget.aggiungiAnnuncio;
                          setState(() {});
                        }
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible: widget.aggiungiAnnuncio,
                  child:
                  Column(
                      children: [Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Text(
                                "Titolo*:  ",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              child: InputField(
                                labelText: "titolo",

                                onChanged: (titolo){
                                  daAggiungere.titolo=titolo;
                                },

                              ),
                            ),
                            ]
                      ),
                            SizedBox(height: 20,),
                        Wrap(
                            children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Text(
                                "Descrizione*:  ",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              child: InputField(
                                maxLength: 300,
                                labelText: "Descrizione",
                                multiline: true,
                                onChanged: (value){
                                  daAggiungere.descrizione=value;
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
                                "Istruzione richiesta*:  ",
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
                                  daAggiungere.istruzioneRichiesta=ConvertiFiltri.istruzioneStringToEnum(selection);
                                },
                              ),
                            ),
                            ]),
                        SizedBox(height: 20,),
                        Wrap(children: [

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "RAL:  ",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ),

                            Container(
                              width: 300,
                              child: InputField(
                                labelText: "(in €)",
                                onChanged: (value){
                                  daAggiungere.retribuzioneAnnua=int.parse(value);
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
                                "Requisiti*:  ",
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ),

                            Container(
                              width: 300,
                              child: InputField(
                                labelText: "requisiti",
                                maxLength: 300,
                                multiline: true,
                                onChanged: (value){
                                  daAggiungere.requisiti=value;
                                },

                              ),
                            ),
                         ]),
                        Wrap(
                           children:[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "Contratto offerto:  ",
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
                                  daAggiungere.contrattoOfferto=ConvertiFiltri.contrattoStringToEnum(selection);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Wrap(
                          children: [
                            MaterialButton(
                              minWidth: 20,
                              onPressed: () {
                                if( daAggiungere.titolo==null || daAggiungere.descrizione==null
                                    || daAggiungere.requisiti==null){
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
                                  widget.aggiungiAnnuncio=false;
                                  aggiungiAnnuncio(daAggiungere);
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
                        ),



                     ]
                  ),
                ),
                    SizedBox(height: 500,),
               ],
              ),

           ),

          ]
              )

        ),
       ),
    );

  }

  void aggiungiAnnuncio(Annuncio daAggiungere) async {
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.addAnnuncio(daAggiungere).then((value){
      if(value!=null){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Aggiunto correttamente!"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfiloEmployer(employer: widget.employer),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }


}

