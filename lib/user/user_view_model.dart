import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/user/service/authentication_service.dart';
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

  Future<void> signUpToFirebase() async {
    await AuthenticationService()
        .signUpWithEmail(email: mail, password: password);
  }

  Future<void> loginToFirebase() async {
    await AuthenticationService()
        .loginWithEmail(inputMail: mail, inputPassword: password);
  }

  Future<void> logoutFromFirebase() async {
    await AuthenticationService().logout();
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
