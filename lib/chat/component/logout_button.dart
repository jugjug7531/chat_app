import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/login/ui/login_page.dart';

/// ログアウトボタン
/// 
/// ログアウトするときに押すボタンWidget
/// 内部で保持しているユーザー情報が初期化される
class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () async {
        // ログアウト処理
        await FirebaseAuth.instance.signOut();

        // ログイン画面に遷移 + チャット画面を破棄
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return const LoginPage();
          })
        );
      },
    );
  }
}