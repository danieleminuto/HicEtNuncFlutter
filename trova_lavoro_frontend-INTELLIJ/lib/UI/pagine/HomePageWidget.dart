
import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/UI/pagine/PagineEmployer/RegistrationEmployer.dart';
import 'package:trova_lavoro_frontend/UI/pagine/RegistrationUtente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';

import 'package:trova_lavoro_frontend/UI/utility/constants.dart';
import 'LoginUtente.dart';
import 'PagineEmployer/LoginEmployer.dart';


class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          color: verdeSfondo,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Column(
                          //EMPLOYER
                          children: [
                            IconButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginEmployer(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.account_balance_sharp,
                                color: Color(0xFF1A6E18),
                                size: 60,
                              ),
                              iconSize: 60,
                            ),

                            Text(
                              'Login Employer',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),

                          ],

                          //FINE LOGIN EMPLOYER
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          LoginUser(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.person,
                                  color: Color(0xFF1A6E18),
                                  size: 60,
                                ),
                                iconSize: 60,
                              ),

                              Text(
                                'Login User',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              //FINE LOGIN USER
                            ],
                          ),
                        ),
                      ],
                    ), //RIGA 1
                    SizedBox(
                      height: 80,
                    ),
                    Wrap(
                      children:[
                        Column(
                          children: [
                            IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationEmployer(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.work_outline,
                              color: Color(0xFF1A6E18),
                              size: 60,
                            ),
                            iconSize: 60,
                            ),
                            Text(
                              'Registration Employer',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ]
                          //FINE REGISTRATION EMPLOYER
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationUtente(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.person_add_alt,
                                color: Color(0xFF1A6E18),
                                size: 60,
                              ),
                              iconSize: 60,
                            ),
                            Text(
                              'Registration User',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ]
                    )// RIGA 2
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
