import 'package:currency/model/home_model/home_model.dart';
import 'package:currency/model/search_model/search_model.dart';
import 'package:currency/utilities/const.dart';
import 'package:dio/dio.dart';

import '../../../model/details_model/details_model.dart';

class CoinApi {
 static Dio dio = Dio();

  static Future getAllCoins() async {
    try {
      var response = await dio.get(baseUrl + allCoinEndPoint);

      return response.data.map((element) => HomeModel.fromMap (element));
      // return List<HomeModel>.from(
      //     response.data.map((element) => HomeModel.fromMap(element)));
    } catch (e) {
      rethrow;
    }
  }

  Future searchAllCoins(searchValue) async {
    try {
      var response = await dio.get(baseUrl + searchCoinEndPoint + searchValue);

      return response;
    } catch (e) {
      rethrow;
    }
  }


 static Future getAllDetails(String detailsValue) async {
    try {
      var response = await dio.get(baseUrl + coinsDetailsEndPoint + detailsValue);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
