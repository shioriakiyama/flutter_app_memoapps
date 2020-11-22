import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/user/user.dart';
import 'login_screen.dart';

class UserViewModel extends ChangeNotifier {
  String mail = '';
  String password = '';
  final List<User> userList = [];

  void changeMailText(String inputMail) {
    mail = inputMail;
    notifyListeners();
  }

  void changePasswordText(String inputPassword) {
    password = inputPassword;
    notifyListeners();
  }

  void postUser() {
    final User user = User(
      mail: mail,
      password: password,
    );
    userList.add(user);
    notifyListeners();
    userList.forEach((User user) {
      print(user.mail);
      print(user.password);
    });
    print(userList.length);
  }
}
