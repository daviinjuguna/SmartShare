// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'intro_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$IntroEventTearOff {
  const _$IntroEventTearOff();

// ignore: unused_element
  Started started() {
    return const Started();
  }

// ignore: unused_element
  LoggedIn loggedIn() {
    return const LoggedIn();
  }

// ignore: unused_element
  LoggedOut loggedOut() {
    return const LoggedOut();
  }

// ignore: unused_element
  RefreshToken refreshToken() {
    return const RefreshToken();
  }
}

// ignore: unused_element
const $IntroEvent = _$IntroEventTearOff();

mixin _$IntroEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loggedIn(),
    @required Result loggedOut(),
    @required Result refreshToken(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loggedIn(),
    Result loggedOut(),
    Result refreshToken(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(Started value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
    @required Result refreshToken(RefreshToken value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(Started value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    Result refreshToken(RefreshToken value),
    @required Result orElse(),
  });
}

abstract class $IntroEventCopyWith<$Res> {
  factory $IntroEventCopyWith(
          IntroEvent value, $Res Function(IntroEvent) then) =
      _$IntroEventCopyWithImpl<$Res>;
}

class _$IntroEventCopyWithImpl<$Res> implements $IntroEventCopyWith<$Res> {
  _$IntroEventCopyWithImpl(this._value, this._then);

  final IntroEvent _value;
  // ignore: unused_field
  final $Res Function(IntroEvent) _then;
}

abstract class $StartedCopyWith<$Res> {
  factory $StartedCopyWith(Started value, $Res Function(Started) then) =
      _$StartedCopyWithImpl<$Res>;
}

class _$StartedCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $StartedCopyWith<$Res> {
  _$StartedCopyWithImpl(Started _value, $Res Function(Started) _then)
      : super(_value, (v) => _then(v as Started));

  @override
  Started get _value => super._value as Started;
}

class _$Started implements Started {
  const _$Started();

  @override
  String toString() {
    return 'IntroEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loggedIn(),
    @required Result loggedOut(),
    @required Result refreshToken(),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return started();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loggedIn(),
    Result loggedOut(),
    Result refreshToken(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(Started value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
    @required Result refreshToken(RefreshToken value),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return started(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(Started value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    Result refreshToken(RefreshToken value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements IntroEvent {
  const factory Started() = _$Started;
}

abstract class $LoggedInCopyWith<$Res> {
  factory $LoggedInCopyWith(LoggedIn value, $Res Function(LoggedIn) then) =
      _$LoggedInCopyWithImpl<$Res>;
}

class _$LoggedInCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $LoggedInCopyWith<$Res> {
  _$LoggedInCopyWithImpl(LoggedIn _value, $Res Function(LoggedIn) _then)
      : super(_value, (v) => _then(v as LoggedIn));

  @override
  LoggedIn get _value => super._value as LoggedIn;
}

class _$LoggedIn implements LoggedIn {
  const _$LoggedIn();

  @override
  String toString() {
    return 'IntroEvent.loggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loggedIn(),
    @required Result loggedOut(),
    @required Result refreshToken(),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return loggedIn();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loggedIn(),
    Result loggedOut(),
    Result refreshToken(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(Started value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
    @required Result refreshToken(RefreshToken value),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(Started value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    Result refreshToken(RefreshToken value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class LoggedIn implements IntroEvent {
  const factory LoggedIn() = _$LoggedIn;
}

abstract class $LoggedOutCopyWith<$Res> {
  factory $LoggedOutCopyWith(LoggedOut value, $Res Function(LoggedOut) then) =
      _$LoggedOutCopyWithImpl<$Res>;
}

class _$LoggedOutCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $LoggedOutCopyWith<$Res> {
  _$LoggedOutCopyWithImpl(LoggedOut _value, $Res Function(LoggedOut) _then)
      : super(_value, (v) => _then(v as LoggedOut));

  @override
  LoggedOut get _value => super._value as LoggedOut;
}

class _$LoggedOut implements LoggedOut {
  const _$LoggedOut();

  @override
  String toString() {
    return 'IntroEvent.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loggedIn(),
    @required Result loggedOut(),
    @required Result refreshToken(),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loggedIn(),
    Result loggedOut(),
    Result refreshToken(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(Started value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
    @required Result refreshToken(RefreshToken value),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(Started value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    Result refreshToken(RefreshToken value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements IntroEvent {
  const factory LoggedOut() = _$LoggedOut;
}

abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res>;
}

class _$RefreshTokenCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(
      RefreshToken _value, $Res Function(RefreshToken) _then)
      : super(_value, (v) => _then(v as RefreshToken));

  @override
  RefreshToken get _value => super._value as RefreshToken;
}

class _$RefreshToken implements RefreshToken {
  const _$RefreshToken();

  @override
  String toString() {
    return 'IntroEvent.refreshToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RefreshToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result started(),
    @required Result loggedIn(),
    @required Result loggedOut(),
    @required Result refreshToken(),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return refreshToken();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result started(),
    Result loggedIn(),
    Result loggedOut(),
    Result refreshToken(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshToken != null) {
      return refreshToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result started(Started value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
    @required Result refreshToken(RefreshToken value),
  }) {
    assert(started != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    assert(refreshToken != null);
    return refreshToken(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result started(Started value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    Result refreshToken(RefreshToken value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshToken != null) {
      return refreshToken(this);
    }
    return orElse();
  }
}

abstract class RefreshToken implements IntroEvent {
  const factory RefreshToken() = _$RefreshToken;
}

class _$IntroStateTearOff {
  const _$IntroStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Authenticated authenticated() {
    return const _Authenticated();
  }

// ignore: unused_element
  _Unauthenticated unauthenticated() {
    return const _Unauthenticated();
  }

// ignore: unused_element
  _Error error(String message) {
    return _Error(
      message,
    );
  }
}

// ignore: unused_element
const $IntroState = _$IntroStateTearOff();

mixin _$IntroState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result authenticated(_Authenticated value),
    @required Result unauthenticated(_Unauthenticated value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result authenticated(_Authenticated value),
    Result unauthenticated(_Unauthenticated value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res>;
}

class _$IntroStateCopyWithImpl<$Res> implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

  final IntroState _value;
  // ignore: unused_field
  final $Res Function(IntroState) _then;
}

abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

class __$InitialCopyWithImpl<$Res> extends _$IntroStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'IntroState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result authenticated(_Authenticated value),
    @required Result unauthenticated(_Unauthenticated value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result authenticated(_Authenticated value),
    Result unauthenticated(_Unauthenticated value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements IntroState {
  const factory _Initial() = _$_Initial;
}

abstract class _$AuthenticatedCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) then) =
      __$AuthenticatedCopyWithImpl<$Res>;
}

class __$AuthenticatedCopyWithImpl<$Res> extends _$IntroStateCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(
      _Authenticated _value, $Res Function(_Authenticated) _then)
      : super(_value, (v) => _then(v as _Authenticated));

  @override
  _Authenticated get _value => super._value as _Authenticated;
}

class _$_Authenticated implements _Authenticated {
  const _$_Authenticated();

  @override
  String toString() {
    return 'IntroState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result authenticated(_Authenticated value),
    @required Result unauthenticated(_Unauthenticated value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result authenticated(_Authenticated value),
    Result unauthenticated(_Unauthenticated value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements IntroState {
  const factory _Authenticated() = _$_Authenticated;
}

abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

class __$UnauthenticatedCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

class _$_Unauthenticated implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString() {
    return 'IntroState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result authenticated(_Authenticated value),
    @required Result unauthenticated(_Unauthenticated value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result authenticated(_Authenticated value),
    Result unauthenticated(_Unauthenticated value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements IntroState {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$ErrorCopyWithImpl<$Res> extends _$IntroStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_Error(
      message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_Error implements _Error {
  const _$_Error(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'IntroState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(),
    @required Result unauthenticated(),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(),
    Result unauthenticated(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result authenticated(_Authenticated value),
    @required Result unauthenticated(_Unauthenticated value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result authenticated(_Authenticated value),
    Result unauthenticated(_Unauthenticated value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements IntroState {
  const factory _Error(String message) = _$_Error;

  String get message;
  _$ErrorCopyWith<_Error> get copyWith;
}
