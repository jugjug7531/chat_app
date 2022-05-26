import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';
import 'package:chat_app/login/component/mail_address_form.dart';
import 'package:chat_app/login/component/password_form.dart';
import 'package:chat_app/login/component/login_button.dart';
import 'package:chat_app/login/component/signup_page_transition_button.dart';

/// chatログインページ
/// 
/// チャットへのログインをおこなうためのページ
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  const Text(
                    "チャット",
                    style: TextStyle(
                      fontSize: 48
                    ),),
                  const SizedBox(height: 16),
                  // メールアドレス入力フォーム
                  const MailAddressForm(),
                  // パスワード入力フォーム
                  const PasswordForm(),
                  // エラーメッセージ
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Consumer<UserLoginModel>(
                      builder: (context, userLoginModel, _) => Text(
                      userLoginModel.errorMsg,
                      style: const TextStyle(
                          color: Colors.red
                        ),
                      ),
                    )
                  ),
                  // ログインボタン
                  const SizedBox(
                    width: double.infinity,
                    child: LoginButton()
                  ),
                  const SizedBox(height: 8),
                  // 新規アカウント登録画面遷移ボタン
                  const SizedBox(
                    width: double.infinity,
                    child: SignupPageTransitionButton()
                  ),             
                ],
              ),
            ]
          )
        )
      )
    );
  }
}