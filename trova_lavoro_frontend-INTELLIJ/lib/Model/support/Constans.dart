class Constants {

  // addresses
  static final String ADDRESS_RESOURCE_SERVER = "localhost:8081";
  static final String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";

  // authentication
  static final String REALM = "WebAppMongo";
  static final String CLIENT_ID = "progettoPSW";
  static final String CLIENT_SECRET = "admin";
  static final String REQUEST_LOGIN = "/auth/realms/" + REALM + "/protocol/openid-connect/token";
  static final String REQUEST_LOGOUT = "/auth/realms/" + REALM + "/protocol/openid-connect/logout";

  static final String CREA_UTENTE= "/auth/admin/realms/"+REALM+"/users";

  static final String SET_ROLE1= "/auth/admin/realms/"+REALM+"/users/"; //va aggiunto il client Id.
  static final String SET_ROLE2= "/role-mappings/clients/d095b58b-632c-4824-90d0-b390e2ee214d"; //nel body [{"id": "7616e0bf-cc3b-44c4-8110-4b28d7f888c3", "name": "User"}] o
                                                                                                          //[{"id": "1d7f95ea-b72d-4d55-a397-78d79a951b84", "name": "Employer"}]
  //registration
  static final String REQUEST_USER_ID="/user/getId";
  static final String TOCKEN_ADMIN= "/auth/realms/master/protocol/openid-connect/token";
  static final String CLIENT_ID_ADMIN= "admin-cli";
  static final String USERNAME_ADMIN= "admin";
  static final String PASSWORD_ADMIN= "admin";



  // requests
  static final String REQUEST_GET_USER = "/user/get";
  static final String REQUEST_ADD_USER = "/user/add";
  static final String REQUEST_ADD_TITOLO_DI_STUDIO = "/user/update/addTitolo";
  static final String REQUEST_REMOVE_TITOLO_DI_STUDIO = "/user/removeTitolo";
  static final String REQUEST_UPDATE_ANAGRAFICA="/user/update";
  static final String VERIFICA_RUOLO_USER="/user/myRole";

  static final String REQUEST_SEARCH_KEYWORD="/cercaAnnuncio/";
  static final String REQUEST_FILTER_KEYWORD="/cercaAnnuncio/filtered/";
  static final String REQUEST_ANNUNCIO_DESIDERIO = "/cercaAnnuncio/desire";

  static final String REQUEST_ANNUNCIO_CANDIDATI = "/job/candidatura";

  //employer
  static final String VERIFICA_RUOLO_EMPLOYER="/employer/myRole";
  static final String REQUEST_GET_EMPLOYER = "/employer/get";
  static final String REQUEST_ADD_EMPLOYER = "/employer/add";
  static final String REQUEST_ADD_JOB = "/employer/addAnnuncio";
  static final String REQUEST_UPDATE_JOB = "/employer/updateAnnuncio/"; //+{idOld}
  static final String REQUEST_REMOVE_JOB = "/employer/deleteAnnuncio/";
  static final String REQUEST_GET_EMPLOYER_JOBS = "/employer/getAnnunci";
  static final String REQUEST_SEARCH_USER = "/cercaUtente/";//+keyword
  static final String REQUEST_SEARCH_USER_FOR_JOB = "/cercaUtente/idoneo/"; //+id job



  // responses
  static final String RESPONSE_ERROR_MAIL_USER_ALREADY_EXISTS = "ERROR_MAIL_USER_ALREADY_EXISTS";

  // messages
  static final String MESSAGE_CONNECTION_ERROR = "connection_error";


}
