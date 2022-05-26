import 'package:flutter/material.dart';
import 'package:chat_app/post/component/add_post_form.dart';
import 'package:chat_app/post/component/add_post_button.dart';

/// 投稿ページ
/// 
/// チャットにメッセージを投稿するページ
class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット投稿'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // 投稿メッセージ入力フォーム
              AddPostForm(),
              SizedBox(height: 8),
              // 投稿ボタン
              SizedBox(
                width: double.infinity,
                child: AddPostButton()
              )
            ]
          )
        )
      ),
    );
  }
}