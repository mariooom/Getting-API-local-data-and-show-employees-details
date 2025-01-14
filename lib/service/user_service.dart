import 'package:dio/dio.dart';
import 'package:data_handel/models/user_model.dart';

class EmployeeService {
  final Dio dio = Dio();
  final String endpoint = 'https://dummyjson.com/users';

  Future<UserResponse> fetchUsers() async {
    try {
      final response = await dio.get(endpoint);
      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load users: Status Code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}