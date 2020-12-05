import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MemoService {
  Future<void> addMemo({
    @required String title,
    @required String subTitle,
    @required String description,
    File image,
  }) async {
    String imageUrl = '';
    if (image != null) {
      final int timestamp = DateTime.now().microsecondsSinceEpoch;
      final String fileName = '$timestamp.png';
      final firebase_storage.Reference ref = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('images')
          .child(fileName);
      await ref.putFile(image);
      imageUrl = await ref.getDownloadURL();
    }

    //画像をクラウドにアップロードする
    CollectionReference memos = FirebaseFirestore.instance.collection('memos');
    return memos.add({
      'title': title,
      'subTitle': subTitle,
      'description': description,
      'imageUrl': imageUrl,
    });
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
