import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// 投稿メッセージ一覧リスト
/// 
/// 投稿されたメッセージを一覧で表示する
class AddPostList extends StatelessWidget {
  const AddPostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    // 投稿メッセージモデル取得
    final userLoginModel = Provider.of<UserLoginModel>(context, listen:false);

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
                  // 自分の投稿メッセージの場合は削除ボタンを表示
                  trailing: document['email'] == userLoginModel.email
                      ? IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            // 投稿メッセージのドキュメントを削除
                            await FirebaseFirestore.instance
                                .collection('posts')
                                .doc(document.id)
                                .delete();
                          },
                        )
                      : null,
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