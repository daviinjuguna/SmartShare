import 'package:SmartShare/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class ParamsId extends Equatable {
  final int id;

  ParamsId({@required this.id});
  @override
  List<Object> get props => [id];
}

class ParamsString extends Equatable {
  final String string;

  ParamsString({@required this.string});

  @override
  List<Object> get props => [string];
}