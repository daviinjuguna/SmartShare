// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'intro_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
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

/// @nodoc
// ignore: unused_element
const $IntroEvent = _$IntroEventTearOff();

/// @nodoc
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

/// @nodoc
abstract class $IntroEventCopyWith<$Res> {
  factory $IntroEventCopyWith(
          IntroEvent value, $Res Function(IntroEvent) then) =
      _$IntroEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$IntroEventCopyWithImpl<$Res> implements $IntroEventCopyWith<$Res> {
  _$IntroEventCopyWithImpl(this._value, this._then);

  final IntroEvent _value;
  // ignore: unused_field
  final $Res Function(IntroEvent) _then;
}

/// @nodoc
abstract class $StartedCopyWith<$Res> {
  factory $StartedCopyWith(Started value, $Res Function(Started) then) =
      _$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartedCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $StartedCopyWith<$Res> {
  _$StartedCopyWithImpl(Started _value, $Res Function(Started) _then)
      : super(_value, (v) => _then(v as Started));

  @override
  Started get _value => super._value as Started;
}

/// @nodoc
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

/// @nodoc
abstract class $LoggedInCopyWith<$Res> {
  factory $LoggedInCopyWith(LoggedIn value, $Res Function(LoggedIn) then) =
      _$LoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoggedInCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $LoggedInCopyWith<$Res> {
  _$LoggedInCopyWithImpl(LoggedIn _value, $Res Function(LoggedIn) _then)
      : super(_value, (v) => _then(v as LoggedIn));

  @override
  LoggedIn get _value => super._value as LoggedIn;
}

/// @nodoc
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

/// @nodoc
abstract class $LoggedOutCopyWith<$Res> {
  factory $LoggedOutCopyWith(LoggedOut value, $Res Function(LoggedOut) then) =
      _$LoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoggedOutCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $LoggedOutCopyWith<$Res> {
  _$LoggedOutCopyWithImpl(LoggedOut _value, $Res Function(LoggedOut) _then)
      : super(_value, (v) => _then(v as LoggedOut));

  @override
  LoggedOut get _value => super._value as LoggedOut;
}

/// @nodoc
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

/// @nodoc
abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res>;
}

/// @nodoc
class _$RefreshTokenCopyWithImpl<$Res> extends _$IntroEventCopyWithImpl<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(
      RefreshToken _value, $Res Function(RefreshToken) _then)
      : super(_value, (v) => _then(v as RefreshToken));

  @override
  RefreshToken get _value => super._value as RefreshToken;
}

/// @nodoc
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
