import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';
import 'package:chat_app/login/component/mail_address_form.dart';
import 'package:chat_app/login/component/password_form.dart';
import 'package:chat_app/login/component/add_user_button.dart';
import 'package:chat_app/login/component/login_button.dart';

/// chatログインページ
/// 
/// 以下の機能をおこなうためのページ
/// ・新規ユーザ登録
/// ・ログイン
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("チャット ログイン"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChangeNotifierProvider(
                create: (BuildContext context) => UserLoginModel(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
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
                    // 新規ユーザ登録ボタン
                    const SizedBox(
                      width: double.infinity,
                      child: AddUserButton()
                    ),
                    const SizedBox(height: 8),
                    // ログインボタン
                    const SizedBox(
                      width: double.infinity,
                      child: LoginButton()
                    ),                    
                  ],
                ),
              )
            ]
          )
        )
      )
    );
  }
}