import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../network/apiService.dart';

class SaleRecordProvider with ChangeNotifier {
  var data = [];
  var profit = [];
  Future<void> save(Map<String, dynamic> formData) async {
    Response response =
        await ApiService.getApiHandler().post("record", data: formData);
    print(response.data);
  }

  Future<void> getAll() async {
    Response response = await ApiService.getApiHandler().get("record");
    data = response.data["data"];

    notifyListeners();
  }

  Future<void> getProfit() async {
    Response response = await ApiService.getApiHandler().get("profit");
    profit = response.data["data"];
    notifyListeners();
  }

  Future<void> delete(var id) async {
    Response response =
        await ApiService.getApiHandler().delete("record/" + id.toString());
    data.removeWhere((element) => element["id"] == id);
    notifyListeners();
  }
}
