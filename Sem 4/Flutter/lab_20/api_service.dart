import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled2/lab_20/user_data.dart';

String baseURL = "https://67b56440a9acbdb38ed2155f.mockapi.io/users";

Future<List<User>> getAllUsers() async {
  var res = await http.get(Uri.parse(baseURL));
  List<dynamic> data = jsonDecode(res.body);
  List<User> users = [];
  data.forEach((element) {
    users.add(User.toUser(element));
  },);
  return users;
}

Future<User> getUserById(String id) async{
  var res = await http.get(Uri.parse("$baseURL/$id"));
  dynamic data = jsonDecode(res.body);
  User user = User.toUser(data);
  return user;
}

Future<void> addUSer(User user) async{
  var res = await http.post(Uri.parse(baseURL),
      body: user.toMap()
  );
}

Future<void> deleteUser(String id) async{
  var res = await http.delete(Uri.parse("$baseURL/$id"));
}

