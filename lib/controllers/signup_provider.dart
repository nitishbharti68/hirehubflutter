import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/services/helpers/auth_helper.dart';
import 'package:hirehub/views/screens/auth/login_page.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool _loader = false;

  bool get loader => _loader;

  set loader(bool newState) {
    _loader = newState;
    notifyListeners();
  }

  final signupFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  signUp(String model) {
    AuthHelper.signup(model).then((response) {
      if (response == true) {
        loader = false;
        Get.offAll(() => const LoginPage());
      } else {
        loader = false;
        Get.snackbar(
          'Failed to Sign up',
          'Please check your credentials',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }
}
