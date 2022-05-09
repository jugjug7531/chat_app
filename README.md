# chat_app

Webアプリ制作第一弾としてサイトを参考にChatアプリを作る。

## Firebaseの設定

事前にFirebaseでプロジェクトを作成しておく必要がある。  
`lib/my_firebase_option.dart`を作成して以下の内容を記述すること。  
```dart
/// firebaseオプション
/// 
/// Firebase.initializeApp()の引数に必要な情報を保持する。
/// 
/// アプリ動作前に各メンバに必要情報を設定する必要あり。
class MyFirebaseOption {
  /// ウェブAPIキー
  static const String apiKey = "【 your apiKey 】";
  /// プロジェクトID
  static const String projectId = "【 your projectId 】";
  /// プロジェクト番号
  static const String messagingSenderId = "【 your messagingSenderId 】";
  /// アプリID
  static const String appId = "【 your appId 】";
}
```

## 参考サイト
https://www.flutter-study.dev/firebase-app/about-firebase-app
