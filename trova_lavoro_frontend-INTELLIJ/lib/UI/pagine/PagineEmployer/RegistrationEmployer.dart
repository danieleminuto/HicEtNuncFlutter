

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/Model.dart';
import 'package:trova_lavoro_frontend/Model/objects/Employer.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/pagine/LoginUtente.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/LoginEmployer.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'package:trova_lavoro_frontend/UI/utility/inputField.dart';
import 'package:trova_lavoro_frontend/UI/utility/popUpVeloce.dart';


class RegistrationEmployer extends StatefulWidget {
  Employer employer=new Employer(email: null, nome: null, cognome: null, annunciPubblicati: [], azienda: null);
  bool lavorando=false;
  String username;
  String password;


  RegistrationEmployer({Key key}) : super(key: key);

  @override
  _RegistrationEmployerState createState() => _RegistrationEmployerState();
}

class _RegistrationEmployerState extends State<RegistrationEmployer> {
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
          child: Column(
            children: [

              Container(

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
                                        widget.employer.email = value;
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
                                        widget.employer.nome = value;
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
                                        widget.employer.cognome = value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
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
                                      "Azienda:  ",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    child: InputField(
                                      labelText: "Azienda",
                                      onChanged: (value) {
                                        widget.employer.azienda = value;
                                      },

                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: 30,),


                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        if (widget.username == null ||
                            !regexEmail.hasMatch(widget.username) ||
                            widget.password == null || widget.employer.nome == null ||
                            widget.employer.cognome == null ) {
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

                          registrami(widget.employer, widget.username, widget
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
                    SizedBox(height: 20,),
                    Visibility(
                      child: CircularProgressIndicator(strokeWidth: 2,),
                      visible: widget.lavorando,),
                    SizedBox(height: 200,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registrami(Employer employer, String email, String password,
      BuildContext context) async {
    setState(() {
      widget.lavorando = true;
    });
    await Model.sharedInstance.registraEmployer(employer, email, password).then((
        value) async {
      if (value) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginEmployer(),
          ),
        );
      }
    });
  }

}
