import 'dart:async';

import 'package:SmartShare/core/utils/validators.dart';
import 'package:SmartShare/features/domain/usecase/login.dart';
import 'package:SmartShare/features/domain/usecase/register.dart';
import 'package:SmartShare/features/domain/usecase/save_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {@required this.loginUseCase,
      @required this.registerUseCase,
      @required this.saveUserUseCase})
      : super(AuthState.initial());

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final SaveUserUseCase saveUserUseCase;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(nameChanged: (e) async* {
      yield state.copyWith(
          isEmailValid: true,
          isPasswordValid: true,
          isSubmitting: false,
          isSuccess: false,
          isFailure: false,
          isNameValid: Validators.isValidName(e.name),
          isLastNameValid: true);
    }, lastNameChanged: (e) async* {
      yield state.copyWith(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isNameValid: true,
        isLastNameValid: Validators.isValidName(e.name),
      );
    }, emailChanged: (e) async* {
      yield state.copyWith(
        isEmailValid: Validators.isValidEmail(e.email),
        isLastNameValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isNameValid: true,
      );
    }, passwordChanged: (e) async* {
      yield state.copyWith(
        isEmailValid: true,
        isLastNameValid: true,
        isPasswordValid: Validators.isValidPassword(e.password),
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isNameValid: true,
      );
    }, loginPressed: (e) async* {
      yield AuthState.loading();
      final loginEither =
          await loginUseCase(LoginParams(email: e.email, password: e.password));
      yield* loginEither.fold((failure) async* {
        yield AuthState.failure();
      }, (success) async* {
        yield AuthState.success();
      });
    }, registerPressed: (e) async* {
      yield AuthState.loading();
      final regesterEither = await registerUseCase(RegisterParams(
          email: e.email,
          password: e.password,
          passwordConfirmation: e.passwordConfirmation));
      yield* regesterEither.fold((failure) async* {
        yield AuthState.failure();
      }, (success) async* {
        yield AuthState.success();
      });
    }, saveUserPressed: (e) async* {
      yield AuthState.loading();
      final saveEither = await saveUserUseCase(SaveUserParams(
          firstName: e.name, lastName: e.lastName, imageUrl: e.imageUrl));
      yield* saveEither.fold((failure) async* {
        yield AuthState.failure();
      }, (success) async* {
        yield AuthState.success();
      });
    });
  }
}
