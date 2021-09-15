import 'package:e_commerceapp/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../constants.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel userModel = await getUserData();
      if (userModel == null) {
        return null;
      } else {
        return userModel;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
    update();
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value));
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();
    update();
  }
}
