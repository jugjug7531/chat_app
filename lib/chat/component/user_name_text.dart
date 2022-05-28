import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';

/// ユーザー名表示テキスト
/// 
/// 登録しているユーザー名を表示する
class UserNameText extends StatelessWidget {
  const UserNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    // ユーザーログイン情報モデル取得
    final userLoginModel = Provider.of<UserLoginModel>(context, listen:false);

    // 表示するユーザー名を取得する
    return Text("ログイン情報：${userLoginModel.name}");
  }
}