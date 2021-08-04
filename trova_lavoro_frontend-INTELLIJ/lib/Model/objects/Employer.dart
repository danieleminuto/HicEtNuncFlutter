import 'package:flutter/cupertino.dart';

import 'Annuncio.dart';

class Employer{

  String email;       //non deve essere modificata
  String nome;
  String cognome;
  String azienda;
  List<Annuncio> annunciPubblicati;

  Employer({@required this.email,@required this.nome,@required this.cognome,@required this.annunciPubblicati, this.azienda});

  factory Employer.fromJson(Map<String, dynamic> json) {
    List<Annuncio> annunci= List<Annuncio>.from(json['annunciPubblicati'].map((i) => Annuncio.fromJson(i)).toList());
    return Employer(
      email: json['email'],
      nome: json['nome'],
      cognome: json['cognome'],
      azienda: json['azienda'],
      annunciPubblicati: annunci
    );
  }
  Map<String, dynamic> toJson() => {
    'email': email,
    'nome': nome,
    'cognome': cognome,
    'azienda': azienda,
    'annunciPubblicati': annunciPubblicati
  };
}
