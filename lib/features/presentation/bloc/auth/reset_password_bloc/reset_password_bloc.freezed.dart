// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ResetPasswordEventTearOff {
  const _$ResetPasswordEventTearOff();

// ignore: unused_element
  RecoverPassword recoverPassword(String email) {
    return RecoverPassword(
      email,
    );
  }

// ignore: unused_element
  ChangePassword changePassword(int pin, String password) {
    return ChangePassword(
      pin,
      password,
    );
  }
}

// ignore: unused_element
const $ResetPasswordEvent = _$ResetPasswordEventTearOff();

mixin _$ResetPasswordEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result recoverPassword(String email),
    @required Result changePassword(int pin, String password),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result recoverPassword(String email),
    Result changePassword(int pin, String password),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result recoverPassword(RecoverPassword value),
    @required Result changePassword(ChangePassword value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result recoverPassword(RecoverPassword value),
    Result changePassword(ChangePassword value),
    @required Result orElse(),
  });
}

abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res>;
}

class _$ResetPasswordEventCopyWithImpl<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  final ResetPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordEvent) _then;
}

abstract class $RecoverPasswordCopyWith<$Res> {
  factory $RecoverPasswordCopyWith(
          RecoverPassword value, $Res Function(RecoverPassword) then) =
      _$RecoverPasswordCopyWithImpl<$Res>;
  $Res call({String email});
}

class _$RecoverPasswordCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements $RecoverPasswordCopyWith<$Res> {
  _$RecoverPasswordCopyWithImpl(
      RecoverPassword _value, $Res Function(RecoverPassword) _then)
      : super(_value, (v) => _then(v as RecoverPassword));

  @override
  RecoverPassword get _value => super._value as RecoverPassword;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(RecoverPassword(
      email == freezed ? _value.email : email as String,
    ));
  }
}

class _$RecoverPassword implements RecoverPassword {
  const _$RecoverPassword(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'ResetPasswordEvent.recoverPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RecoverPassword &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $RecoverPasswordCopyWith<RecoverPassword> get copyWith =>
      _$RecoverPasswordCopyWithImpl<RecoverPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result recoverPassword(String email),
    @required Result changePassword(int pin, String password),
  }) {
    assert(recoverPassword != null);
    assert(changePassword != null);
    return recoverPassword(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result recoverPassword(String email),
    Result changePassword(int pin, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recoverPassword != null) {
      return recoverPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result recoverPassword(RecoverPassword value),
    @required Result changePassword(ChangePassword value),
  }) {
    assert(recoverPassword != null);
    assert(changePassword != null);
    return recoverPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result recoverPassword(RecoverPassword value),
    Result changePassword(ChangePassword value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (recoverPassword != null) {
      return recoverPassword(this);
    }
    return orElse();
  }
}

abstract class RecoverPassword implements ResetPasswordEvent {
  const factory RecoverPassword(String email) = _$RecoverPassword;

  String get email;
  $RecoverPasswordCopyWith<RecoverPassword> get copyWith;
}

abstract class $ChangePasswordCopyWith<$Res> {
  factory $ChangePasswordCopyWith(
          ChangePassword value, $Res Function(ChangePassword) then) =
      _$ChangePasswordCopyWithImpl<$Res>;
  $Res call({int pin, String password});
}

class _$ChangePasswordCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements $ChangePasswordCopyWith<$Res> {
  _$ChangePasswordCopyWithImpl(
      ChangePassword _value, $Res Function(ChangePassword) _then)
      : super(_value, (v) => _then(v as ChangePassword));

  @override
  ChangePassword get _value => super._value as ChangePassword;

  @override
  $Res call({
    Object pin = freezed,
    Object password = freezed,
  }) {
    return _then(ChangePassword(
      pin == freezed ? _value.pin : pin as int,
      password == freezed ? _value.password : password as String,
    ));
  }
}

class _$ChangePassword implements ChangePassword {
  const _$ChangePassword(this.pin, this.password)
      : assert(pin != null),
        assert(password != null);

  @override
  final int pin;
  @override
  final String password;

  @override
  String toString() {
    return 'ResetPasswordEvent.changePassword(pin: $pin, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangePassword &&
            (identical(other.pin, pin) ||
                const DeepCollectionEquality().equals(other.pin, pin)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pin) ^
      const DeepCollectionEquality().hash(password);

  @override
  $ChangePasswordCopyWith<ChangePassword> get copyWith =>
      _$ChangePasswordCopyWithImpl<ChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result recoverPassword(String email),
    @required Result changePassword(int pin, String password),
  }) {
    assert(recoverPassword != null);
    assert(changePassword != null);
    return changePassword(pin, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result recoverPassword(String email),
    Result changePassword(int pin, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(pin, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result recoverPassword(RecoverPassword value),
    @required Result changePassword(ChangePassword value),
  }) {
    assert(recoverPassword != null);
    assert(changePassword != null);
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result recoverPassword(RecoverPassword value),
    Result changePassword(ChangePassword value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class ChangePassword implements ResetPasswordEvent {
  const factory ChangePassword(int pin, String password) = _$ChangePassword;

  int get pin;
  String get password;
  $ChangePasswordCopyWith<ChangePassword> get copyWith;
}
