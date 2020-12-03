import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
            memo.image == null
                ? Text('画像が選択されていません')
                : Image.file(
                    memo.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            RaisedButton(
              child: Text('画像を選択する'),
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                memo.changeImage(File(pickedFile.path));
              },
            ),
            Text('title'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                initialValue: memo.title,
                onChanged: (String inputTitle) {
                  memo.changeTitleText(inputTitle);
                },
              ),
            ),
            Text('subtitle'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                initialValue: memo.subtitle,
                onChanged: (String inputSubtitle) {
                  memo.changeSubtitleText(inputSubtitle);
                },
              ),
            ),
            Text('description'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                initialValue: memo.description,
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
