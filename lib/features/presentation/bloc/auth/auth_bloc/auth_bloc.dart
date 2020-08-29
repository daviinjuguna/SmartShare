import 'dart:async';

import 'package:SmartShare/core/utils/validators.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({@required this.repository}) : assert(repository != null),
   super(AuthState.initial());

  final AuthRepository repository;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e)async*{
        yield state.copyWith(
        isEmailValid: Validators.isValidEmail(e.email),
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        );
      },
      passwordChanged: (e)async*{
        yield state.copyWith(
        isEmailValid: true,
        isPasswordValid: Validators.isValidPassword(e.password),
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        );
      },
      loginPressed: (e)async*{
        yield AuthState.loading();
        final loginEither = await repository.loginUser(e.email, e.password);
        yield* loginEither.fold(
          (failure) async*{
            yield AuthState.failure();
          },
          (success) async*{
            yield AuthState.success();
          }
        );
      },
      registerPressed: (e)async*{
        yield AuthState.loading();
        final regesterEither = await repository.registerUser(e.email, e.password, e.passwordConfirmation);
        yield* regesterEither.fold(
          (failure) async*{
            yield AuthState.failure();
          },
          (success) async*{
            yield AuthState.success();
          }
        );
      }
    );
  }
}