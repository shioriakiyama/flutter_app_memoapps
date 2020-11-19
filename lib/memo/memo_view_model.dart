import 'package:flutter/material.dart';
import 'memo.dart';

class MemoViewModel extends ChangeNotifier {
  String title = '';
  String subtitle = '';
  String description = '';
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

  void postMemo() {
    final Memo memo = Memo(
        title: title,
        subtitle: subtitle,
        description: description,
        date: DateTime.now());
    memoList.add(memo);
    notifyListeners();
    memoList.forEach((Memo memo) {
      print(memo.title);
      print(memo.subtitle);
      print(memo.description);
      print(memo.date);
    });
    print(memoList.length);
  }
}
