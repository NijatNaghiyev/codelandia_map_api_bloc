import '../model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  List<User> users = [];
  Future<List<User>?> fetchData() async {
    var url = 'https://dummyjson.com/users';
    Response response = await Dio().get(url);
    try {
      if (response.statusCode == 200) {
        var jsonData = response.data['users'] as List;
        return jsonData.map((e) => User.fromJson(e)).toList();
      } else {
        throw ('******************Else: ${response.statusCode}');
      }
    } catch (e) {
      throw ("***************$e: Status code: ${response.statusCode}");
    }
  }
}
