import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// メールアドレス入力フォーム
/// 
/// ログイン時にメールアドレスを入力するためのフォームWidget
class MailAddressForm extends StatelessWidget {
  const MailAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      decoration: const InputDecoration(labelText: 'メールアドレス'),
      onChanged: (String value) {
        // ユーザーログイン情報モデル取得
        final userlLoginModel = Provider.of<UserLoginModel>(context, listen: false);
        userlLoginModel.email = value;
        debugPrint("[email]" +userlLoginModel.email);
      }
    );
  }
}