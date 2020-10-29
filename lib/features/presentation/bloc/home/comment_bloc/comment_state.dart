part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class Initial extends CommentState {}
class Loading extends CommentState {}

class Error extends CommentState {
  final String title,message;

  Error({@required this.message,@required this.title});
  @override
  List<Object> get props => [message,title];
}

class Success extends CommentState {
  final String message;
  final List<GetComments> commentModel;

  Success({@required this.message,@required this.commentModel});
  @override
  List<Object> get props => [message,commentModel];
}