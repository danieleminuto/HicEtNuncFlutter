import 'package:flutter/cupertino.dart';
import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'constants.dart';

import 'Istruzione.dart';
import '../../Model/objects/Utente.dart';

final Color verdeBarra= Color.fromRGBO(40, 170, 37, 100);
final Color verdeSfondo=Color.fromARGB(255, 255, 255, 255);
//final Color verdeSfondo=Color.fromRGBO(133, 205, 131, 100);
final  RegExp regexEmail= new RegExp("[A-z0-9\.\+_-]+@[A-z0-9\._-]+\.[A-z]{2,6}");


const List<String> listaContratti = <String>[
    'apprendistato',
    'apprendistato professionalizzante',
    'part time',
    "indeterminato",
    "determinato",
    "autonomo",
    "inserimento",
    "collaborazione occasionale",
    "collaborazione a progetto",
    "aprendistato qualifica post diploma",
    "apprendistato alta formazione e ricerca",
     "stage e Tirocini",
    "ns"
  ];


const List<String> listaIstruzioni=<String>[
    "licenza Elementare",
    "licenza Media",
    "diploma",
    "laurea Triennale",
    "laurea Magistrale",
    "master II Livello",
    "dottorato"
];
