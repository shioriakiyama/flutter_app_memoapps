import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/memo/service/memo_service.dart';
import 'memo.dart';

class MemoViewModel extends ChangeNotifier {
  String title = '';
  String subtitle = '';
  String description = '';
  TextEditingController titleEditingController;
  TextEditingController subtitleEditingController;
  TextEditingController descriptionEditingController;
  final List<Memo> memoList = [];

  void changeTitleText(String inputTitle) {
    title = inputTitle;
    titleEditingController = TextEditingController(text: title);
    notifyListeners();
  }

  void changeSubtitleText(String inputSubtitle) {
    subtitle = inputSubtitle;
    subtitleEditingController = TextEditingController(text: subtitle);
    notifyListeners();
  }

  void changeDescriptionText(String inputDescription) {
    description = inputDescription;
    descriptionEditingController = TextEditingController(text: description);
    notifyListeners();
  }

  void resetAllText() {
    title = '';
    titleEditingController = TextEditingController(text: title);
    subtitle = '';
    subtitleEditingController = TextEditingController(text: subtitle);
    description = '';
    descriptionEditingController = TextEditingController(text: description);
    notifyListeners();
  }

  void deleteMemo({@required int index}) {
    memoList.removeAt(index);
    notifyListeners();
  }

  void postMemo() async {
    await MemoService()
        .addMemo(title: title, subTitle: subtitle, description: description);
  }

  void updateMemo({@required String documentId}) async {
    await MemoService().updateMemo(
        documentID: documentId,
        title: title,
        subTitle: subtitle,
        description: description);
  }
}
