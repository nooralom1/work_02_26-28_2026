// ignore_for_file: constant_identifier_names

const String url = "https://fakestoreapi.com";
const String imageUrl = "$url/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();

  //logIn
  static String logIn() => "/auth/login";

  //getProfile
  static String getProfile() => "/users/1";

  //products
  static String products() => "/products";
}
