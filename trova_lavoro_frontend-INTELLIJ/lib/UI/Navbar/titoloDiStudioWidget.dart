import 'dart:core';

import 'package:flutter/material.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/UI/utility/ConvertiFiltri.dart';
import 'package:trova_lavoro_frontend/Model/objects/Utente.dart';
import 'package:trova_lavoro_frontend/UI/utility/constants.dart';

class titoloDiStudioWidget extends StatelessWidget {
  TitoloDiStudio titolo;
   titoloDiStudioWidget({Key key, @required this.titolo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
                color: verdeBarra,
                width: 4.0
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Wrap(
                children: [
                  Text(
                    ConvertiFiltri.istruzioneEnumToString(titolo.istruzione),
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "  -  ${titolo.titolo}",
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Wrap(
                children: [

                  Text(
                    "presso: ${titolo.istituto}   ",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Text(
                    "voto: ${titolo.voto}",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Wrap(
                children: [
                  Text(
                    "da: ${titolo.annoInizio}    ",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Text(
                    "a: ${titolo.annoFine}   ",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  Text(
                    "in corso: ${titolo.inCorso}   ",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  )

                ],
              )
            ],

          ),
        ),
      )
    );
  }
}
