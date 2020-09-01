import 'dart:async';

import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/data/model/post/post_model.dart';
import 'package:SmartShare/features/domain/usecase/get_post.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required  this.getPost}) : super(Initial());

  final GetPost getPost;
  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    yield* event.map(
      getPost: (e)async*{
        yield Loading();
        final getPostEither = await getPost(NoParams());
        yield* getPostEither.fold(
          (failure) async*{
            yield Error(message: "Ichokwadi yee, Ichokwadi mwari varipo");
          },
          (model) async*{
            yield Success(model: model);
          }
        );
      }
    );
  }
}
