part of 'post_bloc.dart';

abstract class PostState extends Equatable{
  const PostState();

  @override
  List<Object> get props => [];
}

class Initial extends PostState {}
class Loading extends PostState {}
class CreatePostLoading extends PostState{}
class CreatePostSuccess extends PostState{
 final String message;

  CreatePostSuccess({@required this.message});
  @override
  List<Object> get props => [message];
}
class Success extends PostState{
  final List<GetPost> model;
  final GetMyPost myModel;

  Success({@required this.model,@required this.myModel});

  @override
  List<Object> get props => [model,myModel];
}
class Error extends PostState {
  final String title,message;

  Error({@required this.message,@required this.title});
  @override
  List<Object> get props => [message,title];
}

class RegisterImageState extends PostState {
  final String imageFile;
 
  RegisterImageState({
    @required this.imageFile,
   
  });
}

class RegisterImageLoading extends PostState{}

class DeleteLoading extends PostState {}
class DeleteSuccess extends PostState {}

class EditLoading extends PostState {}
class EditSuccess extends PostState {}

class LikeLoading extends PostState {}
class LikeSuccess extends PostState {}