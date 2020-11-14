import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/features/data/data_source/image/image_data_source.dart';
import 'package:SmartShare/features/domain/repository/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ImageRepository)
class ImageRepositoryImpl implements ImageRepository {
    final ImageDataSource imageDataSource;

  ImageRepositoryImpl({@required this.imageDataSource});

  @override
  Future<Either<Failure, String>> fetchImageUrl(String url) async {
    if (url == "Camera") {
      try {
        final imageFile = await imageDataSource.selectFromCamera();
        return Right(imageFile);
      } on SelectImageException {
        return Left(SelectImageFailure());
      } on SelectImageFromCameraException {
        return Left(SelectImageFromCameraFailure());
      }
    } else {
      try {
        final imageFile = await imageDataSource.selectFromGallery();
        return Right(imageFile);
      } on SelectImageException {
        return Left(SelectImageFailure());
      } on SelectImageFromGalleryException {
        return Left(SelectImageFromGalleryFailure());
      }
    }
  }
}