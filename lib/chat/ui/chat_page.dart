import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/chat/ui/add_post_page.dart';
import 'package:chat_app/chat/component/logout_button.dart';

/// チャット画面用Widget
class ChatPage extends StatelessWidget {
  const ChatPage({Key? key, required this.user}) : super(key: key);

  // ユーザー情報
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット'),
        actions: const <Widget>[
          // ログアウトボタン
          LogoutButton()
        ],
      ),
      body: Center(
        // ユーザー情報を表示
        child: Text('ログイン情報：${user.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // 投稿画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const AddPostPage();
            }),
          );
        },
      ),
    );
  }
}