
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';




class AnnuncioDisplayWidget extends StatefulWidget {
  

  Annuncio annuncio;

  bool visible=false;
  bool lavorando=false;
AnnuncioDisplayWidget({Key key,  @required this.annuncio});



  @override
  _AnnuncioDisplayWidgetState createState() => _AnnuncioDisplayWidgetState();
}

class _AnnuncioDisplayWidgetState extends State<AnnuncioDisplayWidget> {
  
  
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
     
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Navbar(lavorando: widget.lavorando),
            Container(
              height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: verdeSfondo,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width ,
                          child: Center(
                           child: Padding(
                             padding: EdgeInsets.fromLTRB(0, 50,0, 0),
                              child: MaterialButton(
                                minWidth: 20,
                                onPressed: () {
                                  if (widget.visible == true) {

                                  }
                                  else {
                                    widget.visible = true;
                                    candidati(widget.annuncio);
                                  }

                                },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                  color: verdeBarra,
                                  child: Text(
                                    "Candidati",
                                    style: TextStyle(
                                      color: Colors.white
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                  Row(
                    
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                      width:MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Visibility(
                              child: Text(
                              'Scrivere email a: ${widget.annuncio.getEmailDatore()}',
                              textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                            visible:  widget.visible,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width,
                        child:Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text(
                              '${widget.annuncio.getNumCandidature()} persone si sono candidate per questo ruolo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
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

  void candidati(Annuncio annuncio){

    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.candidati(annuncio).then((value) {
      setState(() {
        widget.lavorando=false;
        widget.annuncio=value;
      });
    });
  }
}
