import 'dart:async';

import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:SmartShare/features/domain/usecase/check_login.dart';
import 'package:SmartShare/features/domain/usecase/logout_usecase.dart';
import 'package:SmartShare/features/domain/usecase/refresh_token_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'intro_event.dart';
part 'intro_state.dart';
part 'intro_bloc.freezed.dart';

@injectable
class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc({
    @required this.isLoggedIn,
    @required this.logoutUseCase,
    @required this.refreshTokenUseCase,
  }):
   super(Initial());
  
  final CheckLogin isLoggedIn;
  final LogoutUseCase logoutUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;

  @override
  Stream<IntroState> mapEventToState(
    IntroEvent event,
  ) async* {
    yield* event.map(
      started: (e)async*{
         final userIsLoggedIn = await isLoggedIn();
        if (userIsLoggedIn) {
          yield Authenticated();
        }else{
          yield Unauthenticated();
        }
      },
      loggedIn: (e)async*{
        yield Unauthenticated();
      },
      loggedOut: (e)async*{
        final logoutEither = await logoutUseCase(NoParams());
        yield* logoutEither.fold(
          (failure) async*{
            yield Error(message:"naamini utaenda utarudii ooooh, mimi wakoo sheeerrieeeh");
          },
          (success) async*{
            yield Unauthenticated(); //successfully unauthenticated
          }
        );
      },
      refreshToken: (e) async*{
        final refreshEither = await refreshTokenUseCase(NoParams());
        yield* refreshEither.fold(
          (failure) async*{
            yield Unauthenticated();
          },
          (success) async*{
            yield Authenticated();
          }
        );
      },
    );
  }
}
