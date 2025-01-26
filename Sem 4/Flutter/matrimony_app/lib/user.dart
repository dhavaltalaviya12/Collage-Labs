import 'dart:js_interop_unsafe';

import 'package:matrimony_app/string_const.dart';


class User {
  List<Map<String, dynamic>> userList = [];

  void addUserInList({required name, required address, required email, required phone, required city, required password, required conpassword}) {
    Map<String, dynamic> map = {};
    map[NAME] = name;
    map[ADDRESS] = address;
    map[EMAIL] = email;
    map[PHONE] = phone;
    map[CITY] = city;
    map[PASSWORD] = password;
    map[CONFIRMPASSWORD] = conpassword;
    userList.add(map);
  }

  List<Map<String, dynamic>> getUserList() {
    return userList;
  }

  void updateUser(
      {required name, required city,required phone, required email, required id, required address, required password, required conpassword}) {
    Map<String, dynamic> map = {};
    map[NAME] = name;
    map[ADDRESS] = address;
    map[EMAIL] = email;
    map[PHONE] = phone;
    map[CITY] = city;
    map[PASSWORD] = password;
    map[CONFIRMPASSWORD] = conpassword;
    userList[id] = map;

  }

  void deleteUser(id) {
    userList.removeAt(id);
  }

  void searchDeatil({required searchData}) {
    for (var element in userList) {
      if (element[NAME]
          .toString()
          .toLowerCase()
          .contains(searchData.toString().toLowerCase()) ||
          element[CITY]
              .toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ||
          element[EMAIL]
              .toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase())) {
      }
    }
  }
}
