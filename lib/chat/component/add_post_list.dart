import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// 投稿メッセージ一覧リスト
/// 
/// 投稿されたメッセージを一覧で表示する
class AddPostList extends StatelessWidget {
  const AddPostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  FutureBuilder<QuerySnapshot>(
      // 投稿メッセージ一覧を取得（非同期処理）
      // 投稿日時でソート
      future: FirebaseFirestore.instance
          .collection('posts')
          .orderBy('date')
          .get(),
      builder: (context, snapshot) {
        // データが取得できた場合
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          // 取得した投稿メッセージ一覧を元にリスト表示
          return ListView(
            children: documents.map((document) {
              return Card(
                child: ListTile(
                  title: Text(document['text']),
                  subtitle: Text(document['email']),
                ),
              );
            }).toList(),
          );
        }
        // データが読込中の場合
        return const Center(
          child: Text('読込中...'),
        );
      },
    );
  }
}