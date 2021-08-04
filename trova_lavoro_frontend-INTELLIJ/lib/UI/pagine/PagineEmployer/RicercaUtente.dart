import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/NavBarEmployer.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/pagine/AnnuncioDisplay.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/AnnuncioDisplayEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/UtenteDisplay.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';

class RicercaUtente extends StatefulWidget{

  String text;
  int pagina=0;
  bool lavorando=false;
  bool daAnnuncio=false;
  String idAnnuncio;
  List<Utente> utenti;
  RicercaUtente({Key key,@required this.utenti, @required this.text, this.daAnnuncio,this.idAnnuncio});
  @override
  _RicercaUtenteState createState() => _RicercaUtenteState();


}
class _RicercaUtenteState extends State<RicercaUtente> {



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
              NavbarEmployer(lavorando: widget.lavorando,),
              Container(
                color: verdeSfondo,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child:SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: widget.utenti.length,
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
                                            UtenteDisplayWidget(
                                                utente: widget.utenti[index]
                                            ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 300,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        '${widget.utenti[index].nome} ${widget.utenti[index].cognome}\n ${widget.utenti[index].maggiorTitoloDiStudio.titolo}',
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
                                    if(widget.daAnnuncio){
                                      widget.pagina=widget.pagina-1;
                                      cercaUtenteIdoneo(widget.idAnnuncio,widget.pagina);
                                    }
                                    else {
                                      widget.pagina = widget.pagina - 1;
                                      caricaUtenti(widget.text, widget.pagina);
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
                                  print("sono qui");
                                  if(widget.daAnnuncio){
                                    widget.pagina=widget.pagina+1;
                                    cercaUtenteIdoneo(widget.idAnnuncio,widget.pagina);
                                  }
                                  else {
                                    widget.pagina = widget.pagina + 1;
                                    caricaUtenti(widget.text, widget.pagina);
                                  }
                                }

                            ),
                          ],
                        ),
                        SizedBox(height: 100,)
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

  void caricaUtenti(String text, int pagina) {
    setState(() {
      widget.lavorando = true;
    });
    Model.sharedInstance.cercaKeywordEmployer(text,pagina).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          widget.utenti = value;
          widget.lavorando = false;
          widget.daAnnuncio=false;
        });
      }
      else {
        widget.lavorando = false;
        widget.pagina=pagina==0?0:pagina-1;
        widget.daAnnuncio=false;
        setState(() {

        });
      }
    }
    );

  }
  cercaUtenteIdoneo(String id,int pagina) {
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.cercaUtenteDaAnnuncio(id, pagina).then((value) async {
      if (value.isNotEmpty) {
        setState(() {
          widget.utenti = value;
          widget.lavorando = false;
          widget.idAnnuncio=id;
          widget.daAnnuncio=true;
        });
      }
      else {
        setState(() {
          widget.lavorando = false;
          widget.pagina=pagina==0?0:pagina-1;
          widget.idAnnuncio=id;
          widget.daAnnuncio=true;
        });
      }
    });
  }


}
