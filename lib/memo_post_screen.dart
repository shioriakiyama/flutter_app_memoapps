import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo/memo_view_model.dart';

class MemoPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memo = Provider.of<MemoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('メモ投稿ページ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('title'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputTitle) {
                  memo.changeTitleText(inputTitle);
                },
              ),
            ),
            Text('subtitle'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputSubtitle) {
                  memo.changeSubtitleText(inputSubtitle);
                },
              ),
            ),
            Text('description'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputDescription) {
                  memo.changeDescriptionText(inputDescription);
                },
              ),
            ),
            RaisedButton(
              child: Text('メモ投稿'),
              onPressed: () {
                memo.postMemo();
              },
            )
          ],
        ),
      ),
    );
  }
}
