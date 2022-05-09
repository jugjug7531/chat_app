import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat/ui/chat_page.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// ユーザー登録ボタン
/// 
/// ログイン画面で新規ユーザ登録するときに押すボタンWidget
class AddUserButton extends StatelessWidget {
  const AddUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      child: const Text('ユーザー登録'),
      onPressed: () async {
        // ユーザーログイン情報モデル取得
        final userlLoginModel = Provider.of<UserLoginModel>(context, listen:false);

        try {
          // メール&パスワードでユーザー登録
          final FirebaseAuth auth = FirebaseAuth.instance;
          await auth.createUserWithEmailAndPassword(
            email: userlLoginModel.email,
            password: userlLoginModel.password,
          );
          // ユーザー登録に成功した場合
          // チャット画面に遷移＋ログイン画面を破棄
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const ChatPage();
            }),
          );
        } catch (e) {
          // ユーザー登録に失敗した場合
          userlLoginModel.errorMsg = "登録に失敗しました：${e.toString()}";
        }
      },
    );
  }
}