import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/memo_list_screen.dart';
import 'package:flutter_app_memoapps/user/user_view_model.dart';
import 'package:provider/provider.dart';
import '../memo/memo_view_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('メールアドレス'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputMail) {
                  user.changeMailText(inputMail);
                },
              ),
            ),
            Text('パスワード'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputPassword) {
                  user.changePasswordText(inputPassword);
                },
              ),
            ),
            RaisedButton(
              child: Text('ログインする'),
              onPressed: () async {
                await user.loginToFirebase();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MemoListScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
