import 'package:flutter/material.dart';
import 'memo/memo.dart';
import "package:intl/intl.dart";

class MemoDetailScreen extends StatelessWidget {
  const MemoDetailScreen({Key key, @required this.memo}) : super(key: key);
  final Memo memo;
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');
    return Scaffold(
      appBar: AppBar(
        title: Text('メモ詳細'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              memo.title,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              memo.subtitle,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              formatter.format(memo.date),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          Text(memo.description),
        ],
      ),
    );
  }
}
