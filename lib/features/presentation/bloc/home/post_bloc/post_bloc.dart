import 'dart:async';
import 'dart:io';
import 'package:SmartShare/core/utils/constants.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/domain/usecase/create_user_post.dart';
import 'package:SmartShare/features/domain/usecase/delete_post.dart';
import 'package:SmartShare/features/domain/usecase/edit_post.dart';
import 'package:SmartShare/features/domain/usecase/get_my_post_usecase.dart';
import 'package:SmartShare/features/domain/usecase/get_post.dart';
import 'package:SmartShare/features/domain/usecase/like_post.dart';
import 'package:SmartShare/features/domain/usecase/logout_usecase.dart';
import 'package:SmartShare/features/domain/usecase/select_image_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_event.dart';
part 'post_state.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(
      {@required this.getPost,
      @required this.createPostUseCase,
      @required this.getMyPostUseCase,
      @required this.selectImageUseCase,
      @required this.likePostUseCase,
      @required this.editPostUseCase,
      @required this.deletePostUseCase,
      @required this.logoutUseCase})
      : super(Initial());

  final GetPostUseCase getPost;
  final CreatePostUseCase createPostUseCase;
  final GetMyPostUseCase getMyPostUseCase;
  final SelectImageUseCase selectImageUseCase;
  final LikePostUseCase likePostUseCase;
  final EditPostUseCase editPostUseCase;
  final DeletePostUseCase deletePostUseCase;
  final LogoutUseCase logoutUseCase;
  

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is GetPostEvent) {
      yield Loading();
      final getPostEither = await getPost(NoParams());
      yield* getPostEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (model) async* {
        // yield Success(model: model);
        final myPostEither = await getMyPostUseCase(NoParams());
        yield* myPostEither.fold((failure) async* {
          yield Error(message: mapFailureToMessage(failure), title: "Error");
        }, (myModel) async* {
          yield Success(model: model, myModel: myModel);
        });
      });
    } else if (event is CreatePostEvent) {
      yield CreatePostLoading();
      final createEither = await createPostUseCase(CreatePostParams(
          postDescription: event.postDescription, imageUrl: event.imageUrl));
      yield* createEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (post) async* {
        yield CreatePostSuccess(message: 'Success',getPost: post);
      });
    } else if (event is GetImageEvent) {
      // yield RegisterImageLoading();
      final imageEither = await selectImageUseCase(
        SelectImageParams(url: event.selection),
      );
      yield* imageEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (imageUrl) async* {
        yield RegisterImageState(imageFile: imageUrl);
      });
    } else if (event is DeletePostEvent) {
      // yield DeleteLoading();
      final deleteEither =
          await deletePostUseCase(DeletePostParams(postId: event.postId));
      yield* deleteEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (success) async* {
        yield Success(model: event.model, myModel: event.myModel);
      });
    } else if (event is EditPostEvent) {
      // yield EditLoading();
      final editEither = await editPostUseCase(EditPostParams(
          postId: event.postId, postDescription: event.postDescription));
      yield* editEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (success) async* {
        yield Success(model: event.model, myModel: event.myModel);
      });
    } else if (event is LikePostEvent) {
      // yield LikeLoading();
      final likeEither =
          await likePostUseCase(LikePostParams(postId: event.postId));
      yield* likeEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (success) async* {
        yield Success(model: event.model, myModel: event.myModel);
      });
    } else if (event is LogoutEvent) {
      yield LogoutLoading();
      final logoutEither = await logoutUseCase(NoParams());
      yield* logoutEither.fold((failure) async* {
        yield Error(message: mapFailureToMessage(failure), title: "Error");
      }, (success) async* {
        yield LogoutSuccess();
      });
    }else if(event is ChangePostStateEvent){
      yield Success(model: event.model, myModel: event.myModel);
    }
  }
}
