import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:trova_lavoro_frontend/Model/objects/Annuncio.dart';
import 'package:trova_lavoro_frontend/Model/objects/Employer.dart';
import 'package:trova_lavoro_frontend/Model/objects/Filtri.dart';
import 'package:trova_lavoro_frontend/Model/objects/Titolo%20di%20Studio.dart';
import 'package:trova_lavoro_frontend/Model/support/Constans.dart';
import 'package:trova_lavoro_frontend/Model/support/LoginResult.dart';
import 'package:jwt_decode/jwt_decode.dart';


import 'managers/RestManager.dart';
import 'objects/AuthenticationData.dart';
import 'objects/Utente.dart';
import 'package:http/http.dart';

class Model {
  static Model sharedInstance = Model();

  RestManager _restManager = RestManager();
  AuthenticationData _authenticationData;


  Future<LogInResult> logIn(String email, String password) async {
    try{
      Map<String, String> params = Map();
      params["grant_type"] = "password";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["username"] = email;
      params["password"] = password;

      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if ( _authenticationData.hasError() ) {
        if ( _authenticationData.error == "Invalid user credentials" ) {
          return LogInResult.error_wrong_credentials;
        }
        else if ( _authenticationData.error == "Account is not fully set up" ) {
          return LogInResult.error_not_fully_setupped;
        }
        else {
          return LogInResult.error_unknown;
        }
      }
      _restManager.token = _authenticationData.accessToken;
      Timer.periodic(Duration(seconds: (_authenticationData.expiresIn - 50)), (Timer t) {
        _refreshToken();
      });
      return LogInResult.logged;
    }
    catch (e) {
      return LogInResult.error_unknown;
    }
  }

  Future<bool> _refreshToken() async {
    try {
      Map<String, String> params = Map();
      params["grant_type"] = "refresh_token";
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData.refreshToken;
      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded);
      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      if ( _authenticationData.hasError() ) {
        return false;
      }
      _restManager.token = _authenticationData.accessToken;
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<Employer> addAnnuncio(Annuncio annuncio) async {
  try{
   return Employer.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_ADD_JOB,annuncio)));
  }
  catch(e){
    return null;
  }
}

Future<Employer> updateAnnuncio(Annuncio annuncio, String idAnnuncio) async {
    try{
      return Employer.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_UPDATE_JOB}$idAnnuncio",annuncio)));
    }
    catch(e){
      return null;
    }
  }

  Future<Utente> getUtente() async{
    try{
      return Utente.fromJson(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_GET_USER)));
    }
    catch(e){
      return null;
    }
  }

  Future<Employer> getEmployer() async{
    try{
      return Employer.fromJson(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_GET_EMPLOYER)));
    }
    catch(e){
      return null;
    }
  }

  Future<List<Annuncio>> getAnnunciDesiderati(int page) async{
    try {
      return List<Annuncio>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_ANNUNCIO_DESIDERIO}/$page")).map((i) => Annuncio.fromJson(i)).toList());
    }
    catch (e) {
      return null; // not the best solution
    }
  }

  Future<Utente> addTitoloDiStudio(TitoloDiStudio titoloDiStudio) async {
    try {
      return Utente.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_ADD_TITOLO_DI_STUDIO, titoloDiStudio)));
    }
    catch (e) {
      return null;
    }
  }

  Future<Utente> updateAnagrafica(Utente utente) async {
    try {
      return Utente.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_UPDATE_ANAGRAFICA, utente)));
    }
    catch (e) {
      print(e);
    }
  }

  Future<Utente> removeTitoloDiStudio(TitoloDiStudio titoloDiStudio) async {
    try {
      return Utente.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_REMOVE_TITOLO_DI_STUDIO, titoloDiStudio)));
    }
    catch (e) {
      print (e);
    }
  }

  Future<List<Annuncio>> cercaKeyword(String keyword,int page) async {
    try {
      return List<Annuncio>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_SEARCH_KEYWORD}$keyword/$page")).map((i) => Annuncio.fromJson(i)).toList());
    }
    catch (e) {
      print (e);
    }
  }

  Future<List<Utente>> cercaKeywordEmployer(String keyword, int pagina) async {
    try {
      return List<Utente>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_SEARCH_USER}$keyword/$pagina")).map((i) => Utente.fromJson(i)).toList());
    }
    catch (e) {
      print (e);
    }
  }

  Future<List<Utente>> cercaUtenteDaAnnuncio(String idAnnuncio, int pagina) async {

    try {
      return List<Utente>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_SEARCH_USER_FOR_JOB}$idAnnuncio/$pagina")).map((i) => Utente.fromJson(i)).toList());
    }
    catch (e) {
      print (e);
    }
  }

  Future<List<Annuncio>> caricaAnnunci(int pagina) async {
    try {
      return List<Annuncio>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_GET_EMPLOYER_JOBS}/$pagina")).map((i) => Annuncio.fromJson(i)).toList());
    }
    catch (e) {
      print (e);
    }
  }

  Future<bool> removeAnnuncio(String idAnnuncio) async {
    try {
      return json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_REMOVE_JOB}$idAnnuncio"));
    }
    catch (e) {
      print (e);
    }
  }

  Future<List<Annuncio>> ricercaFiltri(String keyword, Filtri filtri, int page) async {
    try {
      return List<Annuncio>.from(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, "${Constants.REQUEST_FILTER_KEYWORD}$keyword/$page",filtri)).map((i) => Annuncio.fromJson(i)).toList());
    }
    catch (e) {
      print (e);
    }
  }

  Future<Annuncio> candidati(Annuncio annuncio) async {
    try {
      return Annuncio.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_ANNUNCIO_CANDIDATI,annuncio)));
    }
    catch (e) {
      print (e);
    }
  }

  Future<bool> logOut() async {
    try{
      Map<String, String> params = Map();
      _restManager.token = null;
      params["client_id"] = Constants.CLIENT_ID;
      params["client_secret"] = Constants.CLIENT_SECRET;
      params["refresh_token"] = _authenticationData.refreshToken;
      await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.REQUEST_LOGOUT, params, type: TypeHeader.urlencoded);
      return true;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> registraUser(Utente utente, String email, String password) async {
    return getTokenAdmin().then((tokenFound) {
        if(!tokenFound){return false;}
        return creaUtente(email, password).then((value) {
          if(!value){ return false;}
          return getIdUtente(email, password).then((idUtente) async {
            if(idUtente==null){return false;}
            return getTokenAdmin().then((value) async {
              try {
                Map uno=json.decode('{"id": "7616e0bf-cc3b-44c4-8110-4b28d7f888c3", "name": "User" }');
                List<Map> param=[uno];
                await _restManager.makePostRequest(
                    Constants.ADDRESS_AUTHENTICATION_SERVER,
                    "${Constants.SET_ROLE1}$idUtente${Constants.SET_ROLE2}",param);
                return  logIn(email, password).then((value) async {
                  addUtente(utente).then((val) {
                    return val != null ? true : false;
                  });
                return true;
                });


              }catch(e){
                print(e);
                return false;}
            });

          });
        });
    });
  }

  Future<bool> registraEmployer(Employer employer, String email, String password) async {
    return getTokenAdmin().then((tokenFound) {
      if(!tokenFound){return false;}
      return creaUtente(email, password).then((value) {
        if(!value){ return false;}
        return getIdUtente(email, password).then((idUtente) async {
          if(idUtente==null){return false;}
          return getTokenAdmin().then((value) async {
            try {
              Map uno=json.decode('{"id": "1d7f95ea-b72d-4d55-a397-78d79a951b84", "name": "Employer" }');
              List<Map> param=[uno];
              await _restManager.makePostRequest(
                  Constants.ADDRESS_AUTHENTICATION_SERVER,
                  "${Constants.SET_ROLE1}$idUtente${Constants.SET_ROLE2}",param);
              return  logIn(email, password).then((value) async {
                addEmployer(employer).then((val) {
                  return val != null ? true : false;
                });
                return true;
              });


            }catch(e){
              print(e);
              return false;}
          });

        });
      });
    });
  }

  Future<Utente> addUtente(Utente utente) async {
    try {
      return Utente.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_ADD_USER,utente)));
    }
    catch (e) {
      return null;
    }
  }

  Future<bool> sonoUser() async {
      try {
        return json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.VERIFICA_RUOLO_USER));
      }
      catch (e) {
        return false;
      }
  }

  Future<bool> sonoEmployer() async {
    try {
      return json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.VERIFICA_RUOLO_EMPLOYER));
    }
    catch (e) {
      return false;
    }
  }

  Future<String> getIdUtente(String email,String password) async {
   return logIn(email, password).then((value) async {
      print(_restManager.token);
      Map<String, dynamic> payload = Jwt.parseJwt(_restManager.token);
      String idUtente= payload["sub"];
      return(idUtente);
    });

  }

  Future<bool> creaUtente(String email, String password) async {
    try{
      var values= '''{     
     "email" :  "$email",
     "credentials" : [{
        "type" : "password",
        "value": "$password",
        "temporary": false
     }],
     "enabled": true
    }''';

     Map params=json.decode(values);
     String result= await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.CREA_UTENTE, params);
      return true;
    }
    catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getTokenAdmin() async{
    try{

      Map<String, String> params = Map();
      params["client_id"] = Constants.CLIENT_ID_ADMIN;
      params["grant_type"] = "password";
      params["username"] = Constants.USERNAME_ADMIN;
      params["password"] = Constants.PASSWORD_ADMIN;

      String result = await _restManager.makePostRequest(Constants.ADDRESS_AUTHENTICATION_SERVER, Constants.TOCKEN_ADMIN, params, type: TypeHeader.urlencoded);

      _authenticationData = AuthenticationData.fromJson(jsonDecode(result));
      _restManager.token = _authenticationData.accessToken;
      return true;
    }
    catch (e) {
      print(e);
      return false;
    }
  }

  Future<Employer> addEmployer(Employer employer) async{
    try {
      return Employer.fromJson(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_RESOURCE_SERVER, Constants.REQUEST_ADD_EMPLOYER,employer)));
    }
    catch (e) {
      return null;
    }
  }
}






