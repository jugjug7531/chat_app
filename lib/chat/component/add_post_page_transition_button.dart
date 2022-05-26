import 'package:flutter/material.dart';
import 'package:chat_app/post/ui/add_post_page.dart';

/// チャット投稿ページ遷移ボタン
/// 
/// チャット投稿ページに遷移するボタンWidget
class AddPostPageTransitionButton extends StatelessWidget {
  const AddPostPageTransitionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        // 投稿画面に遷移
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            // ユーザ情報を渡す
            return const AddPostPage();
          }),
        );
      },
    );
  }
}