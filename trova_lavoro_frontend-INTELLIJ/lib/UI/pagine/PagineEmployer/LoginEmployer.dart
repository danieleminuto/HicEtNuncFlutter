import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/Model/support/LoginResult.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomeUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/RegistrationEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/RegistrationUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';

import '../HomePageWidget.dart';
import 'HomeEmployer.dart';

class LoginEmployer extends StatefulWidget {
  bool lavorando=false;

  LoginEmployer({Key key}) : super(key: key);

  @override
  _LoginEmployerState createState() => _LoginEmployerState();
}

class _LoginEmployerState extends State<LoginEmployer> {
  String username;

  String password;


  @override
  Widget build(BuildContext context) {
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            color:verdeSfondo,
            child: Wrap(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2-5,
                    child: Column(
                        children: [
                          SizedBox(height: 50,),
                          Text(
                            "Il dipendente su misura per te è qui, trovalo ora!",
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0,0,0),
                            child: Icon(
                              Icons.account_balance_sharp,
                              color: verdeBarra,
                              size: 100,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            child: InputField(
                              isUsername: true,
                              labelText: "Email",
                              onChanged: (value){
                                username=value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            child: InputField(
                              isPassword: true,
                              labelText: "Password",
                              onChanged: (value){
                                password=value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            minWidth: 20,
                            onPressed: ()  {
                              login(username, password, context);
                            },

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            color: verdeBarra,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Visibility(
                              visible: widget.lavorando,
                              child: CircularProgressIndicator(strokeWidth: 2,)),
                          SizedBox(height: 100,)

                        ]
                    ),
                  ),
                  Container(
                    width: 10,
                    height: MediaQuery.of(context).size.height,
                    child: VerticalDivider(
                      color: verdeBarra,
                      thickness: 5,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2-5,
                    child: Column(
                      children:[
                        SizedBox(
                          height: 130,
                        ),
                        Icon(
                          Icons.work,
                          color: verdeBarra,
                          size: 100,
                        ),
                        SizedBox(height: 30,),
                        Text(
                          "Non sei registrato?",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 30,),
                        MaterialButton(
                          minWidth: 20,
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RegistrationEmployer(),
                              ),
                            );
                          },

                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          color: verdeBarra,
                          child: Text(
                            "Registrati",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      ),

    );
  }

  String login(String email, String password,BuildContext context) {
    setState(() {
      widget.lavorando=true;
    });
    Model.sharedInstance.logIn(email, password).then((value) async {

      setState(() {
        widget.lavorando=false;
      });
      if (value == LogInResult.logged) {
        try{

          Model.sharedInstance.sonoEmployer().then((value) {

            if(value){
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
            else{
              Model.sharedInstance.logOut().then((value) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Non si possiedono i permessi necessari\nper accedere alla risorsa richiesta"),
                      actions: [
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePageWidget()
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              });
            }
          });
        }
        catch( e){
          print(e);
        }

      }
      else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(value.toString()),
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
    }
    );
  }
}
