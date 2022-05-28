import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat/component/logout_button.dart';
import 'package:chat_app/chat/component/add_post_page_transition_button.dart';
import 'package:chat_app/chat/component/add_post_list.dart';
import 'package:chat_app/chat/component/user_name_text.dart';
import 'package:chat_app/login/model/user_login_model.dart';
import 'package:chat_app/post/model/post_message_text_model.dart';

/// チャット一覧ページ
/// 
/// 投稿されたメッセージを一覧表示するページ
class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          // ユーザー情報を表示
          Container(
            padding: const EdgeInsets.all(8),
            child: Consumer<UserLoginModel>(
              builder: (context, userLoginModel, _) =>  const UserNameText()
            )
          ),
          // 投稿メッセージ一覧
          Expanded(
            child: Consumer<PostMessageTextModel>(
              builder: (context, postMessageTextModel, _) => const AddPostList()
            )
          )
        ],
      ),
      floatingActionButton: const AddPostPageTransitionButton(),
    );
  }
}