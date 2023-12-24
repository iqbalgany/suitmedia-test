import 'package:dio/dio.dart';
import 'package:suitmedia_test_project/models/user_model.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<UserModel>> getUserData() async {
    try {
      Response response =
          await _dio.get('https://reqres.in/api/users?page=1&per_page=10');

      if (response.data['data'] != null &&
          response.data['data'] is List<dynamic>) {
        List<dynamic> userData = response.data['data'];
        List<UserModel> users = userData.map<UserModel>((data) {
          return UserModel.fromJson(data);
        }).toList();

        return users;
      } else {
        throw Exception('Unexpected data structure in the API response');
      }
    } catch (error) {
      throw Exception('Failed to fetch orders: $error');
    }
  }
}
