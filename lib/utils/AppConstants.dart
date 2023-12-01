class AppConstants {
  static const DialogIdentifier dialogIdentifier = DialogIdentifier();
  static const SharedPreferenceKey sharedPreferenceKey = SharedPreferenceKey();
}
class DialogIdentifier {
  const DialogIdentifier(); // <---
  final String logout = 'logout';
}
class SharedPreferenceKey {
  const SharedPreferenceKey(); // <---
  final String keyLoginData = "keyLoginData";
  final String keyAccessToken = "keyAccessToken";
}
