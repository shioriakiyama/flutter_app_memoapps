import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/memo/service/memo_service.dart';
import 'memo.dart';

class MemoViewModel extends ChangeNotifier {
  String title = '';
  String subtitle = '';
  String description = '';
  File image;

  final List<Memo> memoList = [];

  void changeTitleText(String inputTitle) {
    title = inputTitle;
    notifyListeners();
  }

  void changeSubtitleText(String inputSubtitle) {
    subtitle = inputSubtitle;
    notifyListeners();
  }

  void changeDescriptionText(String inputDescription) {
    description = inputDescription;
    notifyListeners();
  }

  void changeImage(File inputImage) {
    image = inputImage;
    notifyListeners();
  }

  void resetAllText() {
    title = '';
    subtitle = '';
    description = '';
    notifyListeners();
  }

  void postMemo() async {
    await MemoService().addMemo(
        title: title,
        subTitle: subtitle,
        description: description,
        image: image);
  }

  void updateMemo({@required String documentId}) async {
    await MemoService().updateMemo(
        documentID: documentId,
        title: title,
        subTitle: subtitle,
        description: description);
  }

  void deleteMemo({@required String documentId}) async {
    await MemoService().deleteMemo(documentId: documentId);
  }
}
