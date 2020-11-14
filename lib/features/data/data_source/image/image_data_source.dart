import 'dart:io';

import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

abstract class ImageDataSource {
  Future<String> selectFromCamera();
  Future<String> selectFromGallery();
}

@LazySingleton(as: ImageDataSource)
class ImageDataSourceImpl extends ImageDataSource {
  final ImagePicker imagePicker;

  ImageDataSourceImpl({@required this.imagePicker});

  @override
  Future<String> selectFromCamera() async {
    try {
      final image = await imagePicker.getImage(source: ImageSource.camera);
      if (image != null) {
        // return image.path;
        File compressedFile = await FlutterNativeImage.compressImage(
          image.path,
          quality: 25,
        );
        return compressedFile.path;
      } else {
        throw SelectImageException();
      }
    } catch (e) {
      throw SelectImageFromCameraException();
    }
  }

  @override
  Future<String> selectFromGallery() async {
    try {
      final image = await imagePicker.getImage(source: ImageSource.gallery);
      if (image != null) {
        //return image.path;
        File compressedFile = await FlutterNativeImage.compressImage(
          image.path,
          quality: 25,
        );
        return compressedFile.path;
      } else {
        throw SelectImageException();
      }
    } catch (e) {
      throw SelectImageFromGalleryException();
    }
  }
}
