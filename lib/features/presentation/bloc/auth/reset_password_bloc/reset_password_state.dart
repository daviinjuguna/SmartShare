part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class Initial extends ResetPasswordState{}
class Loading extends ResetPasswordState{}
class Success extends ResetPasswordState{
  final String message;

  Success(this.message);

  @override
  List<Object> get props => [message];
}

class Error extends ResetPasswordState{
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}