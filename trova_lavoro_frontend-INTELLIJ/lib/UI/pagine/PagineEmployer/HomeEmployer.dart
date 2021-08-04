import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/NavBarEmployer.dart';
import 'package:trova_lavoro_frontend/UI/Navbar/Navbar.dart';
import 'package:trova_lavoro_frontend/UI/pagine/AnnuncioDisplay.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/AnnuncioDisplayEmployer.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';

class HomeEmployerWidget extends StatefulWidget{


  bool lavorando=false;
  int pagina=0;
  List<Annuncio> annunci;
  HomeEmployerWidget({Key key,@required this.annunci});
  @override
  _HomeEmployerWidgetState createState() => _HomeEmployerWidgetState();


}
class _HomeEmployerWidgetState extends State<HomeEmployerWidget> {



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
                        Center(
                          child: Text(
                            "I tuoi annunci:",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
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
                                            AnnuncioDisplayEmployerWidget(
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
                                        '${widget.annunci[index].getTitolo()}',
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
                                      widget.pagina=widget.pagina-1;
                                      annuncioDesiderio(widget.pagina);
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
                                    widget.pagina=widget.pagina+1;
                                    annuncioDesiderio(widget.pagina);
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

  void annuncioDesiderio(int pagina) {
    setState(() {
      widget.lavorando = true;
    });
    Model.sharedInstance.caricaAnnunci(pagina).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          widget.annunci = value;
          widget.lavorando = false;
        });
      }
      else {
        setState(() {
        widget.lavorando = false;
        widget.pagina=pagina==0?0:pagina-1;
        });
      }
    }
    );
  }

}
