import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:data_handel/models/user_model.dart';

class EmployeeService {
  final String endpoint = 'https://dummyjson.com/users';

  Future<UserResponse> fetchUsers() async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      //to parse JSON response into UserResponse model
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to load users: Status Code ${response.statusCode}'); //error message
    }
  }
}
