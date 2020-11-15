import 'dart:async';

import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/home/get_comment.dart';
import 'package:SmartShare/features/domain/usecase/create_comment_usecase.dart';
import 'package:SmartShare/features/domain/usecase/delete_comment_usecase.dart';
import 'package:SmartShare/features/domain/usecase/edit_comment_usecase.dart';
import 'package:SmartShare/features/domain/usecase/get_comment_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

@injectable
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(
      {@required this.getCommentUseCase,
      @required this.createCommentUseCase,
      @required this.editCommentUseCase,
      @required this.deleteCommentUseCase})
      : super(Initial());

  final GetCommentUseCase getCommentUseCase;
  final CreateCommentUseCase createCommentUseCase;
  final EditCommentUseCase editCommentUseCase;
  final DeleteCommentUseCase deleteCommentUseCase;

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is GetCommentEvent) {
      yield Loading();
      final getCmmentEither =
          await getCommentUseCase(ParamsId(id: event.postId));
      yield* getCmmentEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (commentModel) async* {
        yield Success(message: "Success", commentModel: commentModel);
      });
    } else if (event is CreateCommentEvent) {
      yield CreateCommentLoading();
      final createCommentEither = await createCommentUseCase(
          CreateCommentParams(postId: event.postId, comments: event.comment));
      yield* createCommentEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (getCommentSuccess) async* {
        // final List<GetComments> getComment = [];
        // getComment.insert(0, getCommentSuccess);
        yield Created(
          message: "Success",
          getComments: getCommentSuccess,
        );
      });
    } else if (event is EditCommentEvent) {
      final editCommentEither = await editCommentUseCase(EditCommentParams(
          commentId: event.commentId, comments: event.comment));
      yield* editCommentEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (success) async* {
        yield Success(message: "Success", commentModel: event.commentModel);
      });
    } else if (event is DeleteCommentEvent) {
      final deleteCommentEither =
          await deleteCommentUseCase(ParamsId(id: event.commentId));
      yield* deleteCommentEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (success) async* {
        yield Success(message: "Success", commentModel: event.commentModel);
      });
    } else if (event is ChangeStateEvent) {
      yield Success(message: "State Changed", commentModel: event.commentModel);
    } else if (event is UpdateCommentEvent) {
      final getCmmentEither =
          await getCommentUseCase(ParamsId(id: event.postId));
      yield* getCmmentEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (commentModel) async* {
        yield Success(message: "Success", commentModel: commentModel);
      });
    }
  }
}
