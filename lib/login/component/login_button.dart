import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return ElevatedButton(
      child: const Text('ログイン'),
      onPressed: () async {
        // ユーザーログイン情報モデル取得
        final userLoginModel = Provider.of<UserLoginModel>(context, listen:false);

        try {
          // メール/パスワードでログイン
          final FirebaseAuth auth = FirebaseAuth.instance;
          await auth.signInWithEmailAndPassword(
            email: userLoginModel.email,
            password: userLoginModel.password,
          );
          // ログインに成功した場合
          // ログイン時のemailと合致するDBユーザー情報から名前を取得
          await FirebaseFirestore.instance
            .collection("users")
            .where("email", isEqualTo: userLoginModel.email)
            .get()
            .then((querySnapshot) {
              // ユーザーログイン情報モデルにユーザー名を追加
              // 前提条件：1つのemailで登録できるアカウントは１つまで
              if(querySnapshot.docs[0].exists){
                userLoginModel.name = querySnapshot.docs[0]['name'];
              }else{
                userLoginModel.name = "no name";
              }
            }
          );
          // チャット画面に遷移＋ログイン画面を破棄
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const ChatPage();
            }),
          );
        } catch (e) {
          // ログインに失敗した場合
          userLoginModel.errorMsg = "ログインに失敗しました：${e.toString()}";
        }
      },
    );
  }
}