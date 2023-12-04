class AppConstants {
  static const DialogIdentifier dialogIdentifier = DialogIdentifier();
  static const SharedPreferenceKey sharedPreferenceKey = SharedPreferenceKey();
  static const Action action = Action();
}
class DialogIdentifier {
  const DialogIdentifier(); // <---
  final String logout = 'logout';
}
class SharedPreferenceKey {
  const SharedPreferenceKey(); // <---
  final String keyLoginData = "KeyLoginData";
  final String keyAccessToken = "KeyAccessToken";
}
class Action {
  const Action(); //
  final String clockIn = "ClockIn";
  final String quickTask = "QuickTask";
  final String map = "Map";
  final String teams = "Teams";
  final String users = "Users";
  final String timeSheet = "TimeSheet";
}
