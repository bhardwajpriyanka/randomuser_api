import 'dart:convert';

import 'package:http/http.dart' as http;

import '../home/model/home_model.dart';
class ApiHelper
{
  Future<RandomUser> callApi()
  async{
    String link = "https://randomuser.me/api/";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return RandomUser.fromJson(json);
  }

}
