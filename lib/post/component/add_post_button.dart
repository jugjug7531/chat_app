import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/post/model/post_message_text_model.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// メッセージ投稿ボタン
/// 
/// 入力したメッセージをチャットに投稿するボタン
class AddPostButton extends StatelessWidget {
  const AddPostButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      child: const Text('投稿'),
      onPressed: () async {
        // 投稿メッセージモデル取得
        final userLoginModel = Provider.of<UserLoginModel>(context, listen:false);

        // 投稿メッセージモデル取得
        final postMessageTextModel = Provider.of<PostMessageTextModel>(context, listen:false);

        // 現在の日時取得
        final date =
            DateTime.now().toLocal().toIso8601String(); 
        // 投稿メッセージ用ドキュメント作成
        await FirebaseFirestore.instance
            .collection('posts') // コレクションID指定
            .doc() // ドキュメントID自動生成
            .set({
          'text': postMessageTextModel.message,
          'email': userLoginModel.email,
          'date': date
        });
        // 1つ前の画面に戻る
        Navigator.of(context).pop();
      }
    );
  }
}