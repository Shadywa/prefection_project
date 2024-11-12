// ignore_for_file: unrelated_type_equality_checks

import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:perfection/moduls/users_model.dart';

class UsersRepository {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك.');
    }

    try {
      final response = await _dio.get('https://reqres.in/api/users?page=1');
      if (response.statusCode == 200) {
        final List usersJson = response.data['data'];
        return usersJson.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('فشل في تحميل البيانات');
      }
    } catch (e) {
      throw Exception('حاول في وقت');
    }
  }
}
