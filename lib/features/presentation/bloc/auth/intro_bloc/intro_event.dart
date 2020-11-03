part of 'intro_bloc.dart';

@freezed
abstract class IntroEvent with _$IntroEvent {
  const factory IntroEvent.started() = Started;
  const factory IntroEvent.loggedIn() = LoggedIn;
  const factory IntroEvent.loggedOut() = LoggedOut;
  const factory IntroEvent.refreshToken() = RefreshToken;
}
