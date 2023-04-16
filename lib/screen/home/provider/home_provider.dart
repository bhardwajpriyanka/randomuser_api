import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../utils/api_helper.dart';
import '../model/home_model.dart';

class HomeProvider extends ChangeNotifier
{
  RandomUser? data;
  ApiHelper apiHelper = ApiHelper();

  Future<RandomUser> find()
  async {
    RandomUser randomUser = await apiHelper.callApi();
    RandomUser data = randomUser;
    return data;
  }


  void change(Data)
  {
    data = Data;
    notifyListeners();
  }

}