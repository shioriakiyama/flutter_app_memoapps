import 'package:flutter/material.dart';
import 'package:flutter_app_memoapps/memo/memo_view_model.dart';
import 'package:flutter_app_memoapps/memo_detail_screen.dart';
import 'package:flutter_app_memoapps/memo_post_screen.dart';
import 'package:provider/provider.dart';

class MemoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memo = Provider.of<MemoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('メモ一覧'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.create_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MemoPostScreen();
                    },
                  ),
                );
              })
        ],
      ),
      body: ListView.builder(
          itemCount: memo.memoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(memo.memoList[index].title),
              subtitle: Text(memo.memoList[index].subtitle),
              trailing: Text(memo.memoList[index].date.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MemoDetailScreen(
                        memo: memo.memoList[index],
                      );
                    },
                  ),
                );
              },
              onLongPress: () {
                memo.deleteMemo(index: index);
              },
            );
          }),
    );
  }
}
