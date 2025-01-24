import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/controllers/zoom_provider.dart';
import 'package:hirehub/models/request/auth/login_model.dart';
import 'package:hirehub/models/request/auth/profile_update_model.dart';
import 'package:hirehub/services/helpers/auth_helper.dart';
import 'package:hirehub/views/screens/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
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

  bool? _entrypoint;

  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  login(String model, ZoomNotifier zoomNotifier) {
    AuthHelper.login(model).then((response) {
      if (response == true) {
        loader = false;
        zoomNotifier.currentIndex = 0;
        Get.to(() => const MainScreen());
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

  // to check user is first login or not.
  getPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedIn = prefs.getBool('loggedIn') ?? false;
    username = prefs.getString('username') ?? '';
    userUid = prefs.getString('uid') ?? '';
    profile = prefs.getString('profile') ?? '';
  }
}
