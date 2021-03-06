import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/memo/memo_view_model.dart';
import 'package:flutter_app_memoapps/memo_detail_screen.dart';
import 'package:flutter_app_memoapps/memo_post_screen.dart';
import 'package:flutter_app_memoapps/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;

import 'memo/memo.dart';

class MemoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memo = Provider.of<MemoViewModel>(context);
    final user = Provider.of<UserViewModel>(context);
    Auth.User loggedInUser = Auth.FirebaseAuth.instance.currentUser;
    CollectionReference memos = FirebaseFirestore.instance.collection('memos');

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.create_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                memo.resetAllText();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MemoPostScreen(
                        isEdit: false,
                      );
                    },
                  ),
                );
              }),
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                await user.logoutFromFirebase();
                Navigator.pop(context);
              })
        ],
        title: Text(loggedInUser.email),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: memos.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('読込中'),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return ListTile(
                title: Text(document.data()['title']),
                subtitle: Column(children: [
                  Text(document.data()['subTitle']),
                  Text(document.data()['description'])
                ]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MemoDetailScreen(
                          memo: Memo(
                              id: document.id,
                              title: document.data()['title'],
                              subtitle: document.data()['subTitle'],
                              description: document.data()['description'],
                              imageUrl: document.data()['imageUrl']),
                        );
                      },
                    ),
                  );
                },
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        memo.changeTitleText(document.data()['title']);
                        memo.changeSubtitleText(document.data()['subTitle']);
                        memo.changeDescriptionText(
                            document.data()['description']);
                        return MemoPostScreen(
                          isEdit: true,
                          documentId: document.id,
                        );
                      },
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
