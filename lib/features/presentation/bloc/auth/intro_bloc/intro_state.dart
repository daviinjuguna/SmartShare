part of 'intro_bloc.dart';

abstract class IntroState extends Equatable {
  // const factory IntroState.initial() = _Initial;
  // const factory IntroState.authenticated() = _Authenticated;
  // const factory IntroState.unauthenticated() = _Unauthenticated;
  // const factory IntroState.error(final String message) = _Error;
  const IntroState();
  @override
  List<Object> get props => [];
}

class Initial extends IntroState {}
class Authenticated extends IntroState {}
class Unauthenticated extends IntroState {}
class Error extends IntroState {
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}