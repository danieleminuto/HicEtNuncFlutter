import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/Model/objects/Employer.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/Model/support/LoginResult.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomePageWidget.dart';
import 'package:trova_lavoro_frontend/UI/pagine/HomeUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/RegistrationUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';

class LoginUser extends StatefulWidget {
  bool lavorando=false;
  LoginUser({Key key}) : super(key: key);

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
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
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: verdeSfondo,
            child: Wrap(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2 - 5,
                    child: Column(
                        children: [
                          SizedBox(height: 50,),
                          Text(
                            "Il lavoro su misura per te è qui, trovalo ora!",
                            style: TextStyle(
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.person_pin,
                            color: verdeBarra,
                            size: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            child: InputField(
                              isUsername: true,
                              labelText: "Email",
                              onChanged: (value) {
                                username = value;
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
                              onChanged: (value) {
                                password = value;
                              },
                              onSubmit: (value) async {
                                password=value;
                                login(username, password,context);
                              },

                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            minWidth: 20,
                            onPressed: () async {
                              login(username, password,context);

                            },

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    20.0))),
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: VerticalDivider(
                      color: verdeBarra,
                      thickness: 5,
                    ),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2 - 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Icon(
                            Icons.person_add_alt_1_outlined,
                            color: verdeBarra,
                            size: 100,
                          ),
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
                                    RegistrationUtente(),
                              ),
                            );
                          },

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  20.0))),
                          color: verdeBarra,
                          child: Text(
                            "Registrati",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),

                        SizedBox(height: 100,)

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

            Model.sharedInstance.sonoUser().then((value) {

              if(value){
                Model.sharedInstance.getAnnunciDesiderati(0).then((annunci) async {
                  if (annunci.isEmpty) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeUtenteWidget(
                              mostraDesiderio: true,
                              annunci: [
                                Annuncio(emailDatore: 'admin',
                                    gradoIstruzioneRichiesto: 0,
                                    titolo: 'Nessun Annuncio Trovato',
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
                          HomeUtenteWidget(
                            mostraDesiderio: true,
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
