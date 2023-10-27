//api//

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zartek_work/models/foodmodel.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<FoodApiModel>?> getdata() async {
    try {
      var response = await dio
          .get("https://run.mocky.io/v3/4d116e3e-808c-43ab-93ed-6c70540d4e18");
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return foodApiModelFromJson(jsonResponse);
      }
    } on DioException catch (e) {
      log("dio error: ${e.message}");
    }
    return null;
  }
}

//apiservice provider//


