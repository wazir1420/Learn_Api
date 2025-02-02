import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learnapi/models/user_model.dart';

class ApiService {
  String baseUrl = 'https://jsonplaceholder.typicode.com/users';
  Future getUsersData() async {
    List<UsersModel> userList = [];
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    var users = jsonDecode(response.body);
    print(users);

    for (var userData in users) {
      userList.add(UsersModel.fromJson(userData));
    }
    return userList;
  }

  Future getUserById(id) async {
    var url = Uri.parse('${baseUrl}/${id}');
    var response = await http.get(url);
    var user = jsonDecode(response.body);
    print(user);
    return user;
  }
}
