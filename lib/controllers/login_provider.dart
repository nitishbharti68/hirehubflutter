import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/controllers/zoom_provider.dart';
import 'package:hirehub/models/request/auth/login_model.dart';
import 'package:hirehub/models/request/auth/profile_update_model.dart';
import 'package:hirehub/services/helpers/auth_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState){
    _obscureText = newState;
    notifyListeners();
  }
}
