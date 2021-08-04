
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/NavBarEmployer.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/HomeEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/RicercaUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';
import 'package:trova_lavoro_frontend/UI/utility/popUpVeloce.dart';




class AnnuncioDisplayEmployerWidget extends StatefulWidget {


  Annuncio annuncio;
  bool modificaAnnuncio=false;
  bool lavorando=false;

  AnnuncioDisplayEmployerWidget({Key key,  @required this.annuncio});



  @override
  _AnnuncioDisplayEmployerWidgetState createState() => _AnnuncioDisplayEmployerWidgetState();
}

class _AnnuncioDisplayEmployerWidgetState extends State<AnnuncioDisplayEmployerWidget> {


  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Annuncio daAggiungere=new Annuncio(titolo: widget.annuncio.titolo, emailDatore: widget.annuncio.emailDatore, numCandidature: 0, contrattoOfferto: widget.annuncio.contrattoOfferto, retribuzioneAnnua: widget.annuncio.retribuzioneAnnua,descrizione: widget.annuncio.descrizione,data:DateTime.now().toString(),
        nomeDatore: widget.annuncio.nomeDatore,requisiti: widget.annuncio.requisiti, istruzioneRichiesta: widget.annuncio.istruzioneRichiesta,id: widget.annuncio.id);

    return Scaffold(




      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavbarEmployer(lavorando: widget.lavorando,),
              Container(
                height: MediaQuery.of(context).size.height,
                color: verdeSfondo,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Text(

                                widget.annuncio.titolo!=null?  widget.annuncio.titolo: "-",

                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Wrap(

                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Text(
                                'Pubblicato il:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(

                                widget.annuncio.getData.toString()!=null? widget.annuncio.getData().toString() : "-",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Text(
                                'Pubblicato da:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(

                                widget.annuncio.getNomeDatore()!=null? widget.annuncio.getNomeDatore(): "-",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Text(
                                'Contratto Offerto:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                              child: Text(

                                ConvertiFiltri.contrattoEnumToString(widget.annuncio.contrattoOfferto),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Text(
                                'RAL (in €):',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                widget.annuncio.getRetribuzioneAnnua().toString()!=null? widget.annuncio.getRetribuzioneAnnua().toString(): "NS",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                                child: Text(
                                  'Requisiti:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(110, 0, 20, 0),
                                  child: Text(
                                    widget.annuncio.getRequisiti()!=null? widget.annuncio.getRequisiti(): "",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                              child: Text(
                                'Descrizione lavoro:',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Text(
                                  widget.annuncio.getDescrizione()!=null? widget.annuncio.getDescrizione(): "",
                                  maxLines: 10,

                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                            child: Text(
                              "Modifica annuncio:",
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
                                setState(() {
                                  widget.modificaAnnuncio=!widget.modificaAnnuncio;
                                });
                              }
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Visibility(
                        visible: widget.modificaAnnuncio,
                        child: Column(
                          children: [Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Text(
                                    "Titolo:  ",
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
                                      "Descrizione:  ",
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
                                      "Istruzione richiesta:  ",
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
                                      "Requisiti:  ",
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
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text("compilare tutti i campi richiesti"),
                                            actions: [
                                              FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                    else {
                                      widget.modificaAnnuncio=false;
                                      modificaAnnuncio(daAggiungere,context);
                                    }
                                  },

                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                  color: verdeBarra,
                                  child: Text(
                                    "Modifica",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width ,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 50,0, 0),
                            child: MaterialButton(
                              minWidth: 20,

                                onPressed: (){
                                  cercaUtenteIdoneo(widget.annuncio.getId(),context,0);
                                },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                              color: verdeBarra,
                              child: Text(
                                "Cerca un utente idoneo",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width ,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 50,0, 0),
                            child: MaterialButton(
                              minWidth: 20,

                              onPressed: (){
                                eliminaAnnuncio(widget.annuncio.getId(),context);
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                              color: verdeBarra,
                              child: Text(
                                "Elimina annuncio",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),



                      SizedBox(height: 100,)
                    ],
                  ),
                ),

              ),
            ],
          ),

        ),
      ),

    );
  }

  cercaUtenteIdoneo(String id, BuildContext context,int page) {
  setState(() {
    widget.lavorando=true;
  });
   Model.sharedInstance.cercaUtenteDaAnnuncio(id, page).then((value) async {
     if (value.isNotEmpty) {
       Navigator.push(
         context,
         MaterialPageRoute(
           builder: (context) =>
               RicercaUtente(
                 text: "",
                 daAnnuncio: true,
                 idAnnuncio: id,
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
   });
  }


  void modificaAnnuncio(Annuncio daAggiungere, BuildContext context ){
    Model.sharedInstance.updateAnnuncio(daAggiungere, daAggiungere.id).then((value) {
      if(value!=null) {
        navigaHome(context);
      }
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
                        titolo: 'Non hai pubblicato nessun annuncio',
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

  void eliminaAnnuncio(String idAnnuncio, BuildContext context) async{
    Model.sharedInstance.removeAnnuncio(idAnnuncio).then((value) {
      if(value){
        navigaHome(context);
      }
      else{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Qualcosa è andato storto, riporvare"),
              actions: [
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
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
