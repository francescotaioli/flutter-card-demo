import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class MyHttpCall {

  ///
  /// download data
  /// if there is error return message : 'error'
  ///
  static Future<Map> getData() async {
    String url = "https://api.github.com/search/repositories?q=created:>2018-01-15&sort=stars&order=desc";
    try{
    http.Response res = await http.get("https://api.github.com/search/repositories?q=created:>2018-01-15&sort=stars&order=desc"); // get api call
    Map data = JSON.decode(res.body);
    print(res.body);
    return data;
    }
    catch(exception){
      //todo
      return JSON.decode(exception);
    }

  }
}