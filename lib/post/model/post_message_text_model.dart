import 'package:flutter/foundation.dart';

/// 投稿メッセージテキストモデル
/// 
/// 以下の情報を保持
/// ・チャット投稿メッセージ[_message]
class PostMessageTextModel with ChangeNotifier {
  /// チャット投稿メッセージ
  String _message = "";

  // getter
  String get message => _message;

  // setter
  set message(String message) {
    _message = message;
    notifyListeners(); //通知
  }
}