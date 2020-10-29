part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class GetCommentEvent extends CommentEvent{
  final int postId;

  GetCommentEvent({@required this.postId});
  @override
  List<Object> get props => [postId];
}

class EditCommentEvent extends CommentEvent{
  final int commentId;
  final String comment;
  final List<GetComments> commentModel;

  EditCommentEvent({@required this.commentId,@required  this.commentModel,@required this.comment});

  @override
  List<Object> get props => [commentId,commentModel,comment];
}

class CreateCommentEvent extends CommentEvent{
  final int postId;
  final String comment;
  final List<GetComments> commentModel;

  CreateCommentEvent({@required this.postId,@required this.comment,@required this.commentModel});

  @override
  List<Object> get props => [postId,comment,commentModel];
}

class DeleteCommentEvent extends CommentEvent{
  final int commentId;
  final List<GetComments> commentModel;

  DeleteCommentEvent({@required this.commentId,@required this.commentModel});
   @override
  List<Object> get props => [commentId,commentModel];
}