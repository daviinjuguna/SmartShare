part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostEvent extends PostEvent {}

class GetImageEvent extends PostEvent {
  final String selection;

  GetImageEvent({@required this.selection});
  @override
  List<Object> get props => [selection];
}

class CreatePostEvent extends PostEvent {
  final String postDescription;
  final String imageUrl;

  CreatePostEvent({@required this.postDescription, this.imageUrl});

  @override
  List<Object> get props => [postDescription, imageUrl];
}

class DeletePostEvent extends PostEvent {
  final int postId;
  final List<GetPost> model;
  final GetMyPost myModel;

  DeletePostEvent(
      {@required this.postId, @required this.model, @required this.myModel});

  @override
  List<Object> get props => [postId, model, myModel];
}

class EditPostEvent extends PostEvent {
  final int postId;
  final String postDescription;

  final List<GetPost> model;
  final GetMyPost myModel;

  EditPostEvent(
      {@required this.postId,
      @required this.postDescription,
      @required this.model,
      @required this.myModel});

  @override
  List<Object> get props => [postId, postDescription, model, myModel];
}

class LikePostEvent extends PostEvent {
  final int postId;

  final List<GetPost> model;
  final GetMyPost myModel;

  LikePostEvent(
      {@required this.postId, @required this.model, @required this.myModel});

  @override
  List<Object> get props => [postId, model, myModel];
}

class LogoutEvent extends PostEvent {}

class ChangePostStateEvent extends PostEvent {
  final List<GetPost> model;
  final GetMyPost myModel;

  ChangePostStateEvent({@required this.model, @required this.myModel});

  @override
  List<Object> get props => [model, myModel];
}
