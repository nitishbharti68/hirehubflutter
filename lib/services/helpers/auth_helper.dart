
import 'package:http/http.dart' as https;
import 'package:hirehub/models/response/auth/login_res_model.dart';
import 'package:hirehub/services/config.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> signup(String model) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.https(Config.apiUrl, Config.signupUrl);

      var response =
          await client.post(url, headers: requestHeaders, body: model);

      if (response.statusCode == 201) {
        print('Signup Success');
        return true;
      } else {
        print('Signup failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Signup error: $e');                                 
      return false;
    }
  }

  static Future<bool> login(String model) async {

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.https(Config.apiUrl, Config.loginUrl);

      var response =
          await client.post(url, headers: requestHeaders, body: model);

      if (response.statusCode == 200) {
        print('Success');
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        var user = loginResponseModelFromJson(response.body);

        await prefs.setString('token', user.userToken);
        await prefs.setString('userId', user.id);
        await prefs.setString('uid', user.uid);
        await prefs.setString('profile', user.profile);
        await prefs.setString('username', user.username);
        await prefs.setBool('loggedIn', true);

        return true;
      } else {
        return false;
      }
    }
  }

