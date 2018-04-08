import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class MyHttpCall {

  ///
  /// download data
  /// if there is error return message : 'error'
  ///
  static Future<Map> getData() async {
    //get today date
    DateTime today = new DateTime.now();
    //github api returns data from the day before, so we substract one day
    today = today.subtract(new Duration(days: 1));
    String formatDate ="${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";

    //create url
    String url = "https://api.github.com/search/repositories?q=created:>$formatDate&sort=stars&order=desc";

    try{
    http.Response res = await http.get(url); // get api call
    Map data = JSON.decode(res.body);
    print(res.body);
    return data;
    }
    catch(exception){
      //todo : handle exception
      return JSON.decode(exception);
    }

  }
}