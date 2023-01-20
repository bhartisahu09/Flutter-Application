import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/login/authenticate.dart';


class AuthenticationServiceController extends GetxController {
  AuthenticationService authService =
      AuthenticationService(FirebaseAuth.instance);

  Future<String> registerUser(String email, String password) async {
    var result = await authService.signUp(email: email, password: password);
    return result;
  }

  Future<String> validateUser(String email, String password) async {
    var result = await authService.signIn(email: email, password: password);
    return result;
  }


}
