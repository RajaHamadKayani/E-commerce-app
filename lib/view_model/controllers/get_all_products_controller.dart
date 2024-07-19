import 'dart:convert';

import 'package:e_commerce/utils/apis_endpoint.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetAllProductsController extends GetxController {
  var allProducts = [].obs;
  var isLoading = false.obs;
  bool get loading => isLoading.value;
  String allProductsEndPoint = ApisEndpoint.allProducts;
  onInit() {
    super.onInit();
    getAllProductsMethod();
  }

  Future<void> getAllProductsMethod() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(allProductsEndPoint));
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        var data = jsonDecode(response.body);
        allProducts.assignAll(data);
        if (kDebugMode) {
          print("All products data coming from api is $data");
        } else {
          isLoading.value = false;
          if (kDebugMode) {
            print(response.statusCode);
          }
        }
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Exception thrown during fetching all data is $e");
      }
    }
  }
}
