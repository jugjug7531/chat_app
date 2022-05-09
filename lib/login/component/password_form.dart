import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// パスワード入力フォーム
/// 
/// ログイン時にパスワードを入力するためのフォームWidget
class PasswordForm extends StatelessWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      decoration: const InputDecoration(labelText: 'パスワード'),
      obscureText: true,
      onChanged: (String value) {
        // ユーザーログイン情報モデル取得
        final userlLoginModel = Provider.of<UserLoginModel>(context, listen: false);
        userlLoginModel.password = value;
        debugPrint("[password]" +userlLoginModel.password);
      }
    );
  }
}