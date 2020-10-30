import 'package:SmartShare/core/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

const String BASE_URL = "https://1e4ea1cdd521.ngrok.io";
const String IMAGE_URL = BASE_URL + "/";

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String CACHE_FAILURE_MESSAGE = "Cache Failure";
const String INPUT_FAILURE_MESSAGE = "Input Failure";
const String SELECT_FROM_CAMERA_FAILURE_MESSAGE =
    "Something went wrong with the camera";
const String SELECT_FROM_GALLERY_FAILURE_MESSAGE =
    "Couldnt pick image from gallery";
const String SELECT_IMAGE_FAILURE_MESSAGE = "You did not pick an image";


class Style {
  static final primaryColor = "fee56f".toColor();
  static final secondaryColor = "3ff7cf".toColor();
  static final List<Color> gradientColor = [primaryColor,secondaryColor];
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case SelectImageFromCameraFailure:
      return SELECT_FROM_CAMERA_FAILURE_MESSAGE;
    case SelectImageFromGalleryFailure:
      return SELECT_FROM_GALLERY_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}

class PopUpMenu {
  static const String editPost = 'Edit';
  static const String deletePost = 'Delete';

  static const List<String> choices = <String>[
    editPost,deletePost
  ];
}