import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MemoService {
  Future<void> addMemo(
      {@required String title,
      @required String subTitle,
      @required String description}) {
    CollectionReference memos = FirebaseFirestore.instance.collection('memos');
    return memos.add(
        {'title': title, 'subTitle': subTitle, 'description': description});
  }

  Future<void> updateMemo(
      {@required String documentID,
      @required String title,
      @required String subTitle,
      @required String description}) {
    CollectionReference memos = FirebaseFirestore.instance.collection('memos');
    return memos.doc(documentID).update({
      'title': title,
      'subTitle': subTitle,
      'description': description,
    });
  }

  Future<void> deleteMemo({@required String documentId}) {
    CollectionReference memos = FirebaseFirestore.instance.collection('memos');
    return memos.doc(documentId).delete();
  }
}
