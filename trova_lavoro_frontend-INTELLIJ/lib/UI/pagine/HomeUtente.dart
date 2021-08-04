import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Filtri.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';

import 'package:trova_lavoro_frontend/UI/pagine/AnnuncioDisplay.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';

class HomeUtenteWidget extends StatefulWidget{

  Map<String, bool> contrattiSelezionati = {
    'apprendistato':false,
    'apprendistato professionalizzante':false,
    'part time':false,
    "indeterminato":false,
    "determinato":false,
    "autonomo":false,
    "inserimento":false,
    "collaborazione occasionale":false,
    "collaborazione a progetto":false,
    "aprendistato qualifica post diploma":false,
    "apprendistato alta formazione e ricerca":false,
    "stage e Tirocini":false,
  };

  Map<String, bool> istruzioneSelezionata={
    'LICENZAELEMENTARE':false,
    'LICENZAMEDIA':false,
    'DIPLOMA':false,
    'LAUREATRIENNALE':false,
    'LAUREAMAGISTRALE':false,
    'MASTER2LIVELLO':false,
    'DOTTORATO':false,
  };

  List<Annuncio> annunci;
  bool lavorando=false;
  List<String> contrattiScelti=[];
  List<String> istruzioneScelta=[];
  bool mostraDesiderio;
  bool filtri=false;
  String text= " ";
  int pagina=0;
  @override
  _HomeUtenteWidgetState createState() => _HomeUtenteWidgetState();

  HomeUtenteWidget({Key key,@required this.annunci, this.mostraDesiderio, this.text});
  
}
class _HomeUtenteWidgetState extends State<HomeUtenteWidget> {




  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: ' ');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Navbar(lavorando: widget.lavorando,),
              Container(
                color: verdeSfondo,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child:SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [

                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        mostraFiltri(context);
                      },

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      color: verdeBarra,
                      child: Text(
                        "   Filtra   ",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),

                      SizedBox(height: 50,),

                      Center(
                        child: Visibility(
                          visible: widget.mostraDesiderio,
                          child: Text(
                            "Pensiamo che questi annunci possano interessarti:",
                            style: TextStyle(
                                fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                            SizedBox(height: 10,),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: widget.annunci.length,
                              itemBuilder: (BuildContext context, int index){
                                return Center(
                                  child: Card(
                                    color: Colors.lightGreen[100],
                                    elevation: 5,
                                    child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              AnnuncioDisplayWidget(
                                                                annuncio: widget.annunci[index]
                                                                ),
                                                        ),
                                                      );
                                      },
                                      child: SizedBox(
                                        width: 300,
                                        height: 100,
                                        child: Center(
                                            child: Text(
                                            '${widget.annunci[index].getTitolo()} \n pubblicato da: ${widget.annunci[index].getNomeDatore()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              ),
                                            ),
                                          ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                      SizedBox(height: 50,),
                      Wrap(
                        children: [
                        IconButton(icon: Icon(
                            Icons.arrow_back_ios_outlined,
                           color: Colors.black,
                         ),
                            onPressed: ()async{
                              if(widget.pagina!=0){
                                if(widget.mostraDesiderio){
                                  widget.pagina=widget.pagina-1;
                                  annuncioDesiderio(widget.pagina);
                                }
                                else if(widget.filtri){
                                  Filtri filter=new Filtri(
                                  contrattiAccettati: widget.contrattiScelti,
                                  sceltaContratti: widget.contrattiScelti.isNotEmpty,
                                  istruzioneAccettata: widget.istruzioneScelta,
                                  sceltaIstruzione: widget.istruzioneScelta.isNotEmpty,
                                  );
                                  widget.pagina=widget.pagina-1;
                                  avviaRicercaKeywordEFiltri(widget.text, filter,widget.pagina);

                                }
                                else{
                                  widget.pagina=widget.pagina-1;
                                  avviaRicercaKeyword(widget.text,widget.pagina);
                                }
                              }
                            }
                            ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text((widget.pagina+1).toString()),
                          ),
                          IconButton(icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                            onPressed: ()async {
                              if(widget.mostraDesiderio){
                                widget.pagina=widget.pagina+1;
                                annuncioDesiderio(widget.pagina);
                              }
                              else if (widget.filtri) {
                                  Filtri filter = new Filtri(
                                    contrattiAccettati: widget.contrattiScelti,
                                    sceltaContratti: widget.contrattiScelti.isNotEmpty,
                                    istruzioneAccettata: widget.istruzioneScelta,
                                    sceltaIstruzione: widget.istruzioneScelta.isNotEmpty,
                                  );
                                  widget.pagina = widget.pagina + 1;
                                  avviaRicercaKeywordEFiltri(widget.text, filter, widget.pagina);
                                }
                                else {
                                  widget.pagina = widget.pagina + 1;
                                  avviaRicercaKeyword(widget.text, widget.pagina);
                                }

                            }
                          ),
                        ],
                      ),
                      SizedBox(height: 100,),

                    ],

                  ),
                ),


              ),
      ),
            ],
          ),
        ),
    ),
  );

  }


  avviaRicercaKeywordEFiltri(String keyWord,Filtri filtri,int page){
    if(keyWord==null)
      keyWord= " ";
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.ricercaFiltri(keyWord,filtri,page).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          widget.mostraDesiderio=false;
          widget.contrattiScelti = filtri.contrattiAccettati;
          widget.istruzioneScelta = filtri.istruzioneAccettata;
          widget.text=keyWord;
          widget.annunci = value;
          widget.lavorando = false;
          widget.filtri=true;
        });
      }
      else setState(() {
        widget.mostraDesiderio=false;
        widget.contrattiScelti = filtri.contrattiAccettati;
        widget.istruzioneScelta = filtri.istruzioneAccettata;
        widget.text=keyWord;
        widget.lavorando = false;
        widget.filtri=true;
        widget.pagina=page==0?0:page-1;
        widget.annunci= [
          Annuncio(emailDatore: 'admin',
              gradoIstruzioneRichiesto: 0,
              titolo: 'Nessun Annuncio Trovato',
              numCandidature: 0)
        ];
      });
    }
    );
  }

  avviaRicercaKeyword(String keyWord,int pagina) {
    if(keyWord==null)
      keyWord=" ";
    setState(() {
      widget.lavorando = true;
    });
    Model.sharedInstance.cercaKeyword(keyWord,pagina).then((value) {
      if (value.isNotEmpty) {
       setState(() {

         widget.mostraDesiderio=false;
         widget.text=keyWord;
         widget.annunci = value;
         widget.lavorando = false;
       });
      }
      else {
        widget.mostraDesiderio=false;
        widget.text=keyWord;
        widget.lavorando = false;
        widget.pagina=pagina==0?0:pagina-1;
        widget.annunci= [
          Annuncio(emailDatore: 'admin',
          gradoIstruzioneRichiesto: 0,
          titolo: 'Nessun Annuncio Trovato',
          numCandidature: 0)
          ];
        setState(() {

        });
      }
    }
    );
  }

  void annuncioDesiderio(int pagina) {
    setState(() {
      widget.lavorando = true;
    });
    Model.sharedInstance.getAnnunciDesiderati(pagina).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          widget.annunci = value;
          widget.lavorando = false;
        });
      }
      else {
        widget.lavorando = false;
        widget.pagina=pagina==0?0:pagina-1;
        setState(() {

        });
      }
    }
    );
  }

  void mostraContratti(BuildContext context){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Contratti selezionati"),
            content: //Text(widget.contrattiScelti.toString()),
            SingleChildScrollView(
              child :Column(
                children: widget.contrattiSelezionati.keys.map((String key) {
                  return new CheckboxListTile(
                    title: new Text(key),
                    value: widget.contrattiSelezionati[key],
                    onChanged: (bool value) {

                      setState(() {
                        widget.contrattiSelezionati[key] = value;
                        Navigator.pop(context);
                        mostraContratti(context);
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            actions: [
              FlatButton(
                child: Text("Reset"),
                onPressed: () {
                  Iterable<String> keys=widget.contrattiSelezionati.keys;
                  for(String k in keys){
                    widget.contrattiSelezionati[k]=false;
                  }
                  widget.contrattiScelti=new List<String>();
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                 Iterable<String> chiavi=widget.contrattiSelezionati.keys;
                  for(String k in chiavi){
                    if(widget.contrattiSelezionati[k] && !widget.contrattiScelti.contains(ContrattoConverter.getString(ConvertiFiltri.contrattoStringToEnum(k))))
                      widget.contrattiScelti.add(ContrattoConverter.getString(ConvertiFiltri.contrattoStringToEnum(k)));
                  }

                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

  }

  void mostraFiltri(BuildContext context){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text("Ricerca con filtri"),
            content: //Text(widget.contrattiScelti.toString()),
            SingleChildScrollView(
              child :Container(
                width: 900,
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children:[
                      Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            "Parola chiave:  ",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: InputField(
                            labelText: "Keyword",
                            onChanged: (value){
                              widget.text=value;
                            },

                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(65, 20, 10, 30),
                                child: Wrap(children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8, 10, 0),
                                    child: Text(
                                      "Tipo di Contratto Desiderato",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),

                                  IconButton(
                                      icon: Icon(
                                        Icons.list,
                                        color: Colors.black,
                                      ),
                                      onPressed: ()async {
                                        mostraContratti(context);
                                      }
                                  ),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 8, 10, 0),
                                    child: Text(
                                      "Per grado di Istruzione",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),

                                  IconButton(
                                      icon: Icon(
                                        Icons.list,
                                        color: Colors.black,
                                      ),
                                      onPressed: ()async {
                                        mostraIstruzione(context);
                                      }
                                  ),

                                  SizedBox(
                                    width: 50,
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete_forever,
                                        color: Colors.black,
                                      ),
                                      onPressed: (){
                                        Iterable<String> keys=widget.contrattiSelezionati.keys;
                                        for(String k in keys){
                                          widget.contrattiSelezionati[k]=false;
                                        }
                                        widget.contrattiScelti=new List<String>();

                                        Iterable<String> chiavi=widget.istruzioneSelezionata.keys;
                                        for(String k in chiavi){
                                          widget.istruzioneSelezionata[k]=false;
                                        }
                                        widget.istruzioneScelta=new List<String>();
                                        setState(() {});
                                      }
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: MaterialButton(
                                      minWidth: 20,
                                      onPressed: () {
                                        Filtri filter=new Filtri(
                                          contrattiAccettati: widget.contrattiScelti,
                                          sceltaContratti: widget.contrattiScelti.isNotEmpty,
                                          istruzioneAccettata: widget.istruzioneScelta,
                                          sceltaIstruzione: widget.istruzioneScelta.isNotEmpty,
                                        );
                                        widget.pagina=0;
                                        avviaRicercaKeywordEFiltri(widget.text, filter,0);
                                        Navigator.pop(context);
                                      },

                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                      color: verdeBarra,
                                      child: Text(
                                        "Cerca",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    ]
                  ),
                ),
              ),
            ),
            actions: [
              FlatButton(
                child: Text("Annulla"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

  }

  void mostraIstruzione(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Istruzioni selezionate"),
          content: //Text(widget.contrattiScelti.toString()),
          SingleChildScrollView(
            child :Column(
              children: widget.istruzioneSelezionata.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(IstruzioneConverter.fromStringHumanFriendly(key)),
                  value: widget.istruzioneSelezionata[key],
                  onChanged: (bool value) {
                    setState(() {
                      widget.istruzioneSelezionata[key] = value;
                      Navigator.pop(context);
                      mostraIstruzione(context);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
          FlatButton(
          child: Text("Reset"),
          onPressed: () {
              Iterable<String> keys=widget.istruzioneSelezionata.keys;
              for(String k in keys){
              widget.istruzioneSelezionata[k]=false;
              }
              widget.istruzioneScelta=new List<String>();
              setState(() {});
              Navigator.pop(context);
          },
        ),
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Iterable<String> chiavi=widget.istruzioneSelezionata.keys;
                for(String k in chiavi){
                  if(widget.istruzioneSelezionata[k] && !widget.istruzioneScelta.contains(k))
                    widget.istruzioneScelta.add(k);
                }

                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
