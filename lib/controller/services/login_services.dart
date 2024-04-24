import 'dart:developer';

import 'package:axnol_project/core/utils/api_utils.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static final dio = Dio();

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      final response = await dio.post(ApiUtils.baseUrl, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final user = response.data['user'];
        return user;
      } else {
        throw Exception('Cannot login. Try again');
      }
    } catch (e) {
      log('Error occurred: $e');
      throw Exception(e.toString());
    }
  }
}
