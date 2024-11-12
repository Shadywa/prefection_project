import 'package:dio/dio.dart';
import '../../moduls/users_model.dart';

class UserRepositiry {
  final Dio _dio = Dio();

  Future<User> fetchUserById(String id) async {
    try {
      final response = await _dio.get('https://reqres.in/api/users/$id');
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
