
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/ui/signup_page.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// 新規アカウント登録ページ遷移ボタン
/// 
/// 新規アカウント登録ページに遷移するボタンWidget
class SignupPageTransitionButton extends StatelessWidget {
  const SignupPageTransitionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return OutlinedButton(
      child: const Text('サインアップ'),
      onPressed: () async {
        // ページ遷移時にエラーメッセージを初期化する
        final userLoginModel = Provider.of<UserLoginModel>(context, listen: false);
        userLoginModel.errorMsg = "";

        // 新規アカウント登録画面に遷移
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            // ユーザ情報を渡す
            return const SignupPage();
          }),
        );
      },
    );
  }
}