import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/material.dart';

class AuthenticationService {
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
