
import 'package:flutter/material.dart';

import 'package:trova_lavoro_frontend/UI/utility/Contratto.dart';
import 'package:trova_lavoro_frontend/UI/utility/Istruzione.dart';

class Annuncio{
    String id;
    String titolo;
    Istruzione istruzioneRichiesta;
    int gradoIstruzioneRichiesto;
    String nomeDatore;
    String emailDatore;
    Contratto contrattoOfferto;
    int retribuzioneAnnua;
    String requisiti;
    String descrizione;
    int numCandidature;
    String data;

    factory Annuncio.fromJson(Map<String, dynamic> json) {
      Contratto contratto= ContrattoConverter.fromString(json['contrattoOfferto']);
      Istruzione istruzione=IstruzioneConverter.fromString(json['istruzioneRichiesta']);
      return Annuncio(
        id: json['id'],
        titolo: json['titolo'],
        istruzioneRichiesta: istruzione,
        gradoIstruzioneRichiesto: json['gradoIstruzioneRichiesto'],
        nomeDatore: json['nomeDatore'],
        emailDatore: json['emailDatore'],
        contrattoOfferto: contratto,
        retribuzioneAnnua: json['retribuzioneAnnua'],
        requisiti: json['requisiti'],
        descrizione: json['descrizione'],
        numCandidature: json['numCandidature'],
        data: json['data'],
      );
    }
    Map<String, dynamic> toJson() => {
      'id': id,
      'titolo': titolo,
      'istruzioneRichiesta':IstruzioneConverter.getString(istruzioneRichiesta),
      'gradoIstruzioneRichiesto':gradoIstruzioneRichiesto,
      'nomeDatore': nomeDatore,
      'emailDatore': emailDatore,
      'contrattoOfferto': ContrattoConverter.getString(contrattoOfferto),
      'retribuzioneAnnua': retribuzioneAnnua,
      'requisiti': requisiti,
      'descrizione': descrizione,
      'numCandidature': numCandidature,
      'data': data,
    };

String getId(){
  return id;
}

String getRequisiti(){
  return requisiti;
}


String getTitolo(){
  return this.titolo;
}

String getNomeDatore(){
  return this.nomeDatore;
}

int getGradoIstruzioneRichiesto(){
  return gradoIstruzioneRichiesto;
}

String getEmailDatore(){
  return emailDatore;
}
Contratto getContrattoOfferto(){
  return contrattoOfferto;
}

int getRetribuzioneAnnua(){
  return retribuzioneAnnua;
}

String getDescrizione(){
  return descrizione;
}

int getNumCandidature(){
  return numCandidature;
}

String getData(){
  return data;
}

    @override
  String toString() {
    return 'Annuncio{id: $id, titolo: $titolo, istruzioneRichiesta: $istruzioneRichiesta, gradoIstruzioneRichiesto: $gradoIstruzioneRichiesto, nomeDatore: $nomeDatore, emailDatore: $emailDatore, contrattoOfferto: $contrattoOfferto, retribuzioneAnnua: $retribuzioneAnnua, requisiti: $requisiti, descrizione: $descrizione, numCandidature: $numCandidature, data: $data}';
  }

  Annuncio({this.id, @required this.titolo, this.gradoIstruzioneRichiesto, @required this.emailDatore, this.contrattoOfferto,
this.retribuzioneAnnua,this.descrizione,@required this.numCandidature, this.data, this.nomeDatore, this.requisiti, this.istruzioneRichiesta});
    }
