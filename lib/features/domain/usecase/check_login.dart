import 'package:SmartShare/core/utils/check_app_state.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckLogin {
  final CheckAppState appState;

  CheckLogin({@required this.appState});

  Future<bool> call() {
    return appState.userLoggedIn();
  }
}