import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/post/model/post_message_text_model.dart';

/// チャット投稿フォーム
/// 
/// チャットに投稿する内容を書き込むフォーム
class AddPostForm extends StatelessWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      decoration: const InputDecoration(labelText: '投稿メッセージ'),
      // 複数行のテキスト入力
      keyboardType: TextInputType.multiline,
      // 最大3行
      maxLines: 3,
      onChanged: (String value) {
        // 投稿メッセージモデル取得
        final postMessageTextModel = Provider.of<PostMessageTextModel>(context, listen:false);
        // メッセージ登録
        postMessageTextModel.message = value;
      },
    );
  }
}