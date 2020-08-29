part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @required bool isEmailValid,
    @required bool isPasswordValid,
    @required bool isSubmitting,
    @required bool isSuccess,
    @required bool isFailure,
  }) = _AuthState;

  factory AuthState.initial() =>
    AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
  );

  factory AuthState.loading() =>
    AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
  );

  factory AuthState.success() =>
    AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
  );

  factory AuthState.failure() =>
    AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
  );
}
