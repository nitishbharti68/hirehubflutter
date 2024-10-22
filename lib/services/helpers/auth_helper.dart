import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:hirehub/models/request/auth/login_model.dart';
import 'package:hirehub/models/request/auth/profile_update_model.dart';
import 'package:hirehub/models/request/auth/signup_model.dart';
import 'package:hirehub/models/response/auth/login_res_model.dart';
import 'package:hirehub/models/response/auth/profile_model.dart';
import 'package:hirehub/services/config.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

}
