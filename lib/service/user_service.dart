import 'package:dio/dio.dart';
import 'package:data_handel/models/user_model.dart';

class EmployeeService {
  final Dio _dio = Dio(); //dio instance for HTTP requests
  final String _endpoint = 'https://dummyjson.com/users'; 

  Future<UserResponse> fetchUsers() async {
    try {
      final response = await _dio.get(_endpoint);     
      if (response.statusCode == 200) {      //to check if the response is successful (status code 200)
        return UserResponse.fromJson(response.data);    
      } else {
        //throw an exception if the response is not successful
        throw Exception(
            'Failed to load users: Status Code ${response.statusCode}');
      }
      //to handle errors and exceptions
    } on DioException catch (e) {
      throw Exception('Failed to load users: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
