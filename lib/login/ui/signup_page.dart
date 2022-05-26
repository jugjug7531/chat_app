import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';
import 'package:chat_app/login/component/mail_address_form.dart';
import 'package:chat_app/login/component/password_form.dart';
import 'package:chat_app/login/component/add_user_button.dart';
import 'package:chat_app/login/component/name_form.dart';

/// 新規アカウント追加ページ
/// 
/// 新規アカウント登録をおこなうページ
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 画面を閉じるとき(戻るボタンを押したとき)のイベント
      onWillPop: () async{
        // ページ遷移時にエラーメッセージを初期化する
        final userLoginModel = Provider.of<UserLoginModel>(context, listen: false);
        userLoginModel.errorMsg = "";
        // 戻り値にtrueを指定すると画面がpopされる
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("新規アカウント作成"),
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
                    // 名前入力フォーム
                    const NameForm(),
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
                  ],
                ),
              ]
            )
          )
        )
      )
    );
  }
}