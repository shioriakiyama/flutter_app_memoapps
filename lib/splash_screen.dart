import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter_app_memoapps/user/login_screen.dart';
import 'memo_list_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('image/loading-01.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('読込中...'),
          ),
        ],
      ),
    ));
  }

  void navigateToScreen() async {
    final bool isLoggedIn = Auth.FirebaseAuth.instance.currentUser != null;
    await Future<void>.delayed(const Duration(seconds: 2)); //処理を少し待つ

    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MemoListScreen();
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    }
  }
}
