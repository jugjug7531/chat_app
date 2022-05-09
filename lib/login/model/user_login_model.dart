import 'package:flutter/foundation.dart';

/// ユーザーログイン情報モデル
/// 
/// 以下の情報を保持
/// ・メールアドレス[_email]
/// ・パスワード[_password]
/// ・ログインエラーメッセージ[_errorMsg]
class UserLoginModel with ChangeNotifier {
  /// メールアドレス
  String _email = "";
  /// パスワード
  String _password = "";
  /// ログインエラーメッセージ
  String _errorMsg = "";

  // getter
  String get email => _email;
  String get password => _password;
  String get errorMsg => _errorMsg;

  // setter
  set email(String email) {
    _email = email;
    notifyListeners(); //通知
  }
  set password(String password) {
    _password = password;
    notifyListeners(); //通知
  }
  set errorMsg(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners(); //通知
  }
}