part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @required bool isNameValid,
    @required bool isLastNameValid,
    @required bool isEmailValid,
    @required bool isPasswordValid,
    @required bool isSubmitting,
    @required bool isSuccess,
    @required bool isFailure,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
      isNameValid: true,
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isLastNameValid: true);

  factory AuthState.loading() => AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      isNameValid: true,
      isLastNameValid: true);

  factory AuthState.success() => AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
      isNameValid: true,
      isLastNameValid: true);

  factory AuthState.failure() => AuthState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isNameValid: true,
      isLastNameValid: true);
}
