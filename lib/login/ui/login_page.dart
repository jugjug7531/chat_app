import 'package:flutter/material.dart';
import 'package:chat_app/chat/ui/chat_page.dart';

/// ログイン画面用Widget
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('ログイン'),
              onPressed: () async {
                // チャット画面に遷移＋ログイン画面を破棄
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const ChatPage();
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}