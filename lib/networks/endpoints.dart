// ignore_for_file: constant_identifier_names

const String url = "https://eduporibar.com";
// const String url = "http://192.168.0.125:8000";
const String imageUrl = "$url/storage/";
const String baseUrl = "$url/";

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
  static String logIn() => "/api/v1/login";

  //manuallyPayment
  static String manuallyPayment(int id) => "/api/v1/mobile/common-order/$id";

  //allCourse
  static String allCourse(String pageNo) => "/api/v1/app-all-courses$pageNo";
}
