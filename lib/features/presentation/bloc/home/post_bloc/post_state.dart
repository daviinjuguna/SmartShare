part of 'post_bloc.dart';

abstract class PostState extends Equatable{
  const PostState();

  @override
  List<Object> get props => [];
}

class Initial extends PostState {}
class Loading extends PostState {}
class Success extends PostState{
  final List<GetPostModel> model;

  Success({@required this.model});

  @override
  List<Object> get props => [model];
}
class Error extends PostState {
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}
