import 'dart:async';

import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:SmartShare/features/domain/usecase/check_login.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'intro_event.dart';
part 'intro_state.dart';
part 'intro_bloc.freezed.dart';

@injectable
class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc({@required this.isLoggedIn,@required this.repository}) :assert(repository != null),
   super(IntroState.initial());
  
  final CheckLogin isLoggedIn;
  final AuthRepository repository;

  @override
  Stream<IntroState> mapEventToState(
    IntroEvent event,
  ) async* {
    yield* event.map(
      started: (e)async*{
         final userIsLoggedIn = await isLoggedIn();
        if (userIsLoggedIn) {
          yield IntroState.authenticated();
        }else{
          yield IntroState.unauthenticated();
        }
      },
      loggedIn: (e)async*{
        yield IntroState.authenticated();
      },
      loggedOut: (e)async*{
        final logoutEither = await repository.logout();
        yield* logoutEither.fold(
          (failure) async*{
            yield IntroState.error("naamini utaenda utarudii ooooh, mimi wakoo sheeerrieeeh");
          },
          (success) async*{
            yield IntroState.unauthenticated(); //successfully unauthenticated
          }
        );
      },
      refreshToken: (e) async*{
        final refreshEither = await repository.refreshToken();
        yield* refreshEither.fold(
          (failure) async*{
            yield IntroState.unauthenticated();
          },
          (success) async*{
            yield IntroState.authenticated();
          }
        );
      },
    );
  }
}
