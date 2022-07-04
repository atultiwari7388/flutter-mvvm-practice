import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_practice_app/repository/auth/auth.repository.dart';
import 'package:mvvm_practice_app/utils/app.utils.dart';
import 'package:mvvm_practice_app/utils/routes/routes_name.routes.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  //loading state
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //register
  Future<void> registerUser(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.registerUser(data).then((value) {
      //success
      AppUtils.flushSuccessMessage("Yay! successful", context);
      setLoading(false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.home,
        (route) => false,
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      //error
      AppUtils.flushErrorMessage("user not found", context);
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);
    });
  }

  //handle api data
  //login
  Future<void> loginUser(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginUser(data).then((value) {
      //success
      AppUtils.flushSuccessMessage("Yay! successful", context);
      setLoading(false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.home,
        (route) => false,
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      //error
      AppUtils.flushErrorMessage("user not found", context);
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);
    });
  }
}
