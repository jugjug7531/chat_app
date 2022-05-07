import 'package:flutter/material.dart';

/// 投稿画面用Widget
class AddPostPage extends StatelessWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット投稿'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('戻る'),
          onPressed: () {
            // 1つ前の画面に戻る
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}