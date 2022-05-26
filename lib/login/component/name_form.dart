import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// 名前入力フォーム
/// 
/// チャットで使用する名前を入力するためのフォームWidget
class NameForm extends StatelessWidget {
  const NameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      decoration: const InputDecoration(labelText: '名前'),
      onChanged: (String value) {
        // ユーザーログイン情報モデル取得
        final userLoginModel = Provider.of<UserLoginModel>(context, listen: false);
        userLoginModel.name = value;
      }
    );
  }
}