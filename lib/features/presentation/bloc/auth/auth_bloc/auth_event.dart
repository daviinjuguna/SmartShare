part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.nameChanged(final String name) = NameChanged;
  const factory AuthEvent.lastNameChanged(final String name) = LastNameChanged;
  const factory AuthEvent.emailChanged(final String email) = EmailChanged;
  const factory AuthEvent.passwordChanged(final String password) = PasswordChanged;
  const factory AuthEvent.loginPressed(final String email,final String password) = Login;
  const factory AuthEvent.registerPressed(final String email,final String password,final String passwordConfirmation) = Register;
  const factory AuthEvent.saveUserPressed(final String name,final String lastName,final String imageUrl) = SaveUser;
}