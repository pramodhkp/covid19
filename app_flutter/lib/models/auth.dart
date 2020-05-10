import 'package:app_flutter/api.dart';
import 'package:flutter/foundation.dart';

enum AuthStatus {
  LOGGED_IN,
  LOGGING_IN,
  NOT_LOGGED_IN
}

class AuthService extends ChangeNotifier {
  var userInfo;
  var state = AuthStatus.NOT_LOGGED_IN;
  var baseURL = "http://10.0.2.2:3000/api";
  get loginState => this.state;
  get user => this.userInfo;


  login(username, password) async {
    var apiClient = API(baseURL);

    state = AuthStatus.LOGGING_IN;
    notifyListeners();
    userInfo = await apiClient.login(username, password);
    if (userInfo != null) {
      state = AuthStatus.LOGGED_IN;
    } else {
      state = AuthStatus.NOT_LOGGED_IN;
    }
    notifyListeners();
  }
}