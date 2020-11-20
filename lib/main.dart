import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/memo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_memoapps/memo/memo_view_model.dart';
import 'package:flutter_app_memoapps/memo_post_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MemoViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MemoListScreen(),
      ),
    );
  }
}
