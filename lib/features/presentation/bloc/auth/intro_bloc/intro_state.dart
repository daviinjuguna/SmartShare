part of 'intro_bloc.dart';

@freezed
abstract class IntroState with _$IntroState {
  const factory IntroState.initial() = _Initial;
  const factory IntroState.authenticated() = _Authenticated;
  const factory IntroState.unauthenticated() = _Unauthenticated;
  const factory IntroState.error(final String message) = _Error;
}
