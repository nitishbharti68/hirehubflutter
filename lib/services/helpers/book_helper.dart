import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:hirehub/models/request/bookmarks/bookmarks_model.dart';
import 'package:hirehub/models/response/bookmarks/all_bookmarks.dart';
import 'package:hirehub/models/response/bookmarks/bookmark.dart';
import 'package:hirehub/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkHelper {
  static var client = https.Client();


}
