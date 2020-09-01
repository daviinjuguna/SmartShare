part of 'reset_password_bloc.dart';

@freezed
abstract class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.recoverPassword(final String email) = RecoverPassword;
  const factory ResetPasswordEvent.changePassword(final int pin, final String password) = ChangePassword;
}