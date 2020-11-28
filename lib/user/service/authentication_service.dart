import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';

class AuthenticationService {
  Future<void> signUpWithEmail(
      {@required String email, @required String password}) async {
    try {
      await Auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await loginWithEmail(inputMail: email, inputPassword: password);
    } on Auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('既に使用されているメールアドレスです');
      } else if (e.code == 'operation-not-allowed') {
        print('メールアドレス/パスワード方式が有効化されていません');
      } else if (e.code == 'invalid-email') {
        print('メールアドレスの形式が正しくありません');
      } else {
        print('エラーが発生しました。');
      }
    }
  }

  Future<void> loginWithEmail(
      {@required String inputMail, @required String inputPassword}) async {
    try {
      await Auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: inputMail, password: inputPassword);
      print('ログインが成功しました。');
    } on Auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('登録されていないメールアドレスです');
      } else if (e.code == 'wrong-password') {
        print('パスワードが間違っています。');
      } else if (e.code == 'invalid-email') {
        print('メールアドレスの形式が正しくありません');
      } else {
        print('エラーが発生しました。');
      }
    }
  }

  Future<void> logout() async {
    await Auth.FirebaseAuth.instance.signOut();
  }
}
