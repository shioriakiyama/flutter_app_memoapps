import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo/memo_view_model.dart';

class MemoPostScreen extends StatelessWidget {
  const MemoPostScreen({Key key, @required this.isEdit, this.documentId})
      : super(key: key);
  final bool isEdit;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    final memo = Provider.of<MemoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: isEdit ? Text('メモ編集画面') : Text('メモ投稿ページ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('title'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: memo.titleEditingController,
                onChanged: (String inputTitle) {
                  memo.changeTitleText(inputTitle);
                },
              ),
            ),
            Text('subtitle'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: memo.subtitleEditingController,
                onChanged: (String inputSubtitle) {
                  memo.changeSubtitleText(inputSubtitle);
                },
              ),
            ),
            Text('description'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: memo.descriptionEditingController,
                onChanged: (String inputDescription) {
                  memo.changeDescriptionText(inputDescription);
                },
              ),
            ),
            RaisedButton(
              child: isEdit ? Text('編集する') : Text('投稿する'),
              onPressed: () {
                if (isEdit) {
                  memo.updateMemo(documentId: documentId);
                } else {
                  memo.postMemo();
                }
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
