import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/login/model/user_login_model.dart';
import 'package:chat_app/my_firebase_option.dart';
import 'package:chat_app/login/ui/login_page.dart';
import 'package:chat_app/post/model/post_message_text_model.dart';

void main() async {

  // 初期化処理を追加
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: MyFirebaseOption.apiKey,
      projectId: MyFirebaseOption.projectId,
      messagingSenderId: MyFirebaseOption.messagingSenderId,
      appId: MyFirebaseOption.appId,
      ),
    );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserLoginModel>(
          create: (context) => UserLoginModel(),
        ),
        ChangeNotifierProvider<PostMessageTextModel>(
          create: (context) => PostMessageTextModel(),
        ),
      ],
      child: const MaterialApp(
        home: ChatApp(),
      ),
    ),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'ChatApp',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      home: const LoginPage(),
    );
  }
}
