import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat/ui/chat_page.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// ログインボタン
/// 
/// ログイン画面で登録済みユーザーでログインするときに押すボタンWidget
class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return OutlinedButton(
      child: const Text('ログイン'),
      onPressed: () async {
        // ユーザーログイン情報モデル取得
        final userlLoginModel = Provider.of<UserLoginModel>(context, listen:false);

        try {
          // メール/パスワードでログイン
          final FirebaseAuth auth = FirebaseAuth.instance;
          await auth.signInWithEmailAndPassword(
            email: userlLoginModel.email,
            password: userlLoginModel.password,
          );
          // ログインに成功した場合
          // チャット画面に遷移＋ログイン画面を破棄
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const ChatPage();
            }),
          );
        } catch (e) {
          // ログインに失敗した場合
          userlLoginModel.errorMsg = "ログインに失敗しました：${e.toString()}";
        }
      },
    );
  }
}