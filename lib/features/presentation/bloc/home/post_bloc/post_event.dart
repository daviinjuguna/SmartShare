part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostEvent extends PostEvent {
  
}

class GetImageEvent extends PostEvent {
  final String selection;

  GetImageEvent({@required this.selection});
  @override
  List<Object> get props => [selection];
}

class CreatePostEvent extends PostEvent{
  final String postDescription;
  final String imageUrl;

  CreatePostEvent({@required this.postDescription, this.imageUrl});

  @override
  List<Object> get props => [postDescription,imageUrl];
}