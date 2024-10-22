import 'package:flutter/material.dart';
// to keep the record of the index page and make sure we cant go back to previous page
class OnBoardNotifier extends ChangeNotifier {
  bool _isLastPage = false;

  bool get isLastPage => _isLastPage;

  set isLastPage(bool newstate){
    _isLastPage =  newstate;
    notifyListeners(); // this is going to be triggered whenever we change in the value
  }


}
