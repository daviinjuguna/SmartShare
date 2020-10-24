import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {

  //injecting third party libraries

  @lazySingleton
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
  
}