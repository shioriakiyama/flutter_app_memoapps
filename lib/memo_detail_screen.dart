import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global.dart';
import 'memo/memo.dart';
import "package:intl/intl.dart";

import 'memo/memo_view_model.dart';

class MemoDetailScreen extends StatelessWidget {
  const MemoDetailScreen({Key key, @required this.memo}) : super(key: key);
  final Memo memo;
  @override
  Widget build(BuildContext context) {
    final memoModel = Provider.of<MemoViewModel>(context);

    DateFormat formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');
    return Scaffold(
      appBar: AppBar(
        title: Text('メモ詳細'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text('削除'),
                        content: Text('メモを削除しますか？'),
                        actions: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('いいえ')),
                          FlatButton(
                              onPressed: () {
                                memoModel.deleteMemo(documentId: memo.id);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('はい')),
                        ],
                      );
                    });
              })
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            memo.imageUrl == ''
                ? Text('画像がありません')
                : Image.network(
                    memo.imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            // Image(
            //   image: FirebaseImage('${firebaseStorageEndpoint}denchan.jpg'),
            // // ),
            // Image.network(),
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
            Text(memo.description),
          ],
        ),
      ),
    );
  }
}
