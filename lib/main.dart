import 'package:SmartShare/core/utils/simple_bloc_observer.dart';
import 'package:SmartShare/features/presentation/pages/core/smart_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import 'injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   _setUpLogging();
   await configureInjection(Environment.prod);
  runApp(SmartShare());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}:${event.time}:${event.message}');
  });
}