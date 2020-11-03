part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class Initial extends PostState {}

class Loading extends PostState {}

class CreatePostLoading extends PostState {}

class CreatePostSuccess extends PostState {
  final String message;
  final GetPost getPost;

  CreatePostSuccess({@required this.message,@required this.getPost});
  @override
  List<Object> get props => [message,getPost];
}

class Success extends PostState {
  final List<GetPost> model;
  final GetMyPost myModel;

  Success({@required this.model, @required this.myModel});

  @override
  List<Object> get props => [model, myModel];
}

class Error extends PostState {
  final String title, message;

  Error({@required this.message, @required this.title});
  @override
  List<Object> get props => [message, title];
}

class RegisterImageState extends PostState {
  final String imageFile;

  RegisterImageState({
    @required this.imageFile,
  });
}

class RegisterImageLoading extends PostState {}

class LogoutLoading extends PostState {}

class LogoutSuccess extends PostState {}
