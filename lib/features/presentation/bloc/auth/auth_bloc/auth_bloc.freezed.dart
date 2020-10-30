// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  NameChanged nameChanged(String name) {
    return NameChanged(
      name,
    );
  }

// ignore: unused_element
  LastNameChanged lastNameChanged(String name) {
    return LastNameChanged(
      name,
    );
  }

// ignore: unused_element
  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

// ignore: unused_element
  PasswordChanged passwordChanged(String password) {
    return PasswordChanged(
      password,
    );
  }

// ignore: unused_element
  Login loginPressed(String email, String password) {
    return Login(
      email,
      password,
    );
  }

// ignore: unused_element
  Register registerPressed(
      String email, String password, String passwordConfirmation) {
    return Register(
      email,
      password,
      passwordConfirmation,
    );
  }

// ignore: unused_element
  SaveUser saveUserPressed(String name, String lastName, String imageUrl) {
    return SaveUser(
      name,
      lastName,
      imageUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $NameChangedCopyWith<$Res> {
  factory $NameChangedCopyWith(
          NameChanged value, $Res Function(NameChanged) then) =
      _$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$NameChangedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $NameChangedCopyWith<$Res> {
  _$NameChangedCopyWithImpl(
      NameChanged _value, $Res Function(NameChanged) _then)
      : super(_value, (v) => _then(v as NameChanged));

  @override
  NameChanged get _value => super._value as NameChanged;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(NameChanged(
      name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$NameChanged implements NameChanged {
  const _$NameChanged(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString() {
    return 'AuthEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  $NameChangedCopyWith<NameChanged> get copyWith =>
      _$NameChangedCopyWithImpl<NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements AuthEvent {
  const factory NameChanged(String name) = _$NameChanged;

  String get name;
  $NameChangedCopyWith<NameChanged> get copyWith;
}

/// @nodoc
abstract class $LastNameChangedCopyWith<$Res> {
  factory $LastNameChangedCopyWith(
          LastNameChanged value, $Res Function(LastNameChanged) then) =
      _$LastNameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$LastNameChangedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LastNameChangedCopyWith<$Res> {
  _$LastNameChangedCopyWithImpl(
      LastNameChanged _value, $Res Function(LastNameChanged) _then)
      : super(_value, (v) => _then(v as LastNameChanged));

  @override
  LastNameChanged get _value => super._value as LastNameChanged;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(LastNameChanged(
      name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$LastNameChanged implements LastNameChanged {
  const _$LastNameChanged(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString() {
    return 'AuthEvent.lastNameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LastNameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  $LastNameChangedCopyWith<LastNameChanged> get copyWith =>
      _$LastNameChangedCopyWithImpl<LastNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return lastNameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lastNameChanged != null) {
      return lastNameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return lastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (lastNameChanged != null) {
      return lastNameChanged(this);
    }
    return orElse();
  }
}

abstract class LastNameChanged implements AuthEvent {
  const factory LastNameChanged(String name) = _$LastNameChanged;

  String get name;
  $LastNameChangedCopyWith<LastNameChanged> get copyWith;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(EmailChanged(
      email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements AuthEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;
  $EmailChangedCopyWith<EmailChanged> get copyWith;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object password = freezed,
  }) {
    return _then(PasswordChanged(
      password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements AuthEvent {
  const factory PasswordChanged(String password) = _$PasswordChanged;

  String get password;
  $PasswordChangedCopyWith<PasswordChanged> get copyWith;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(Login _value, $Res Function(Login) _then)
      : super(_value, (v) => _then(v as Login));

  @override
  Login get _value => super._value as Login;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(Login(
      email == freezed ? _value.email : email as String,
      password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
class _$Login implements Login {
  const _$Login(this.email, this.password)
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginPressed(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Login &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  $LoginCopyWith<Login> get copyWith =>
      _$LoginCopyWithImpl<Login>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return loginPressed(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginPressed != null) {
      return loginPressed(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return loginPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loginPressed != null) {
      return loginPressed(this);
    }
    return orElse();
  }
}

abstract class Login implements AuthEvent {
  const factory Login(String email, String password) = _$Login;

  String get email;
  String get password;
  $LoginCopyWith<Login> get copyWith;
}

/// @nodoc
abstract class $RegisterCopyWith<$Res> {
  factory $RegisterCopyWith(Register value, $Res Function(Register) then) =
      _$RegisterCopyWithImpl<$Res>;
  $Res call({String email, String password, String passwordConfirmation});
}

/// @nodoc
class _$RegisterCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $RegisterCopyWith<$Res> {
  _$RegisterCopyWithImpl(Register _value, $Res Function(Register) _then)
      : super(_value, (v) => _then(v as Register));

  @override
  Register get _value => super._value as Register;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object passwordConfirmation = freezed,
  }) {
    return _then(Register(
      email == freezed ? _value.email : email as String,
      password == freezed ? _value.password : password as String,
      passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation as String,
    ));
  }
}

/// @nodoc
class _$Register implements Register {
  const _$Register(this.email, this.password, this.passwordConfirmation)
      : assert(email != null),
        assert(password != null),
        assert(passwordConfirmation != null);

  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;

  @override
  String toString() {
    return 'AuthEvent.registerPressed(email: $email, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Register &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                const DeepCollectionEquality()
                    .equals(other.passwordConfirmation, passwordConfirmation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(passwordConfirmation);

  @override
  $RegisterCopyWith<Register> get copyWith =>
      _$RegisterCopyWithImpl<Register>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return registerPressed(email, password, passwordConfirmation);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerPressed != null) {
      return registerPressed(email, password, passwordConfirmation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return registerPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerPressed != null) {
      return registerPressed(this);
    }
    return orElse();
  }
}

abstract class Register implements AuthEvent {
  const factory Register(
      String email, String password, String passwordConfirmation) = _$Register;

  String get email;
  String get password;
  String get passwordConfirmation;
  $RegisterCopyWith<Register> get copyWith;
}

/// @nodoc
abstract class $SaveUserCopyWith<$Res> {
  factory $SaveUserCopyWith(SaveUser value, $Res Function(SaveUser) then) =
      _$SaveUserCopyWithImpl<$Res>;
  $Res call({String name, String lastName, String imageUrl});
}

/// @nodoc
class _$SaveUserCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $SaveUserCopyWith<$Res> {
  _$SaveUserCopyWithImpl(SaveUser _value, $Res Function(SaveUser) _then)
      : super(_value, (v) => _then(v as SaveUser));

  @override
  SaveUser get _value => super._value as SaveUser;

  @override
  $Res call({
    Object name = freezed,
    Object lastName = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(SaveUser(
      name == freezed ? _value.name : name as String,
      lastName == freezed ? _value.lastName : lastName as String,
      imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

/// @nodoc
class _$SaveUser implements SaveUser {
  const _$SaveUser(this.name, this.lastName, this.imageUrl)
      : assert(name != null),
        assert(lastName != null),
        assert(imageUrl != null);

  @override
  final String name;
  @override
  final String lastName;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'AuthEvent.saveUserPressed(name: $name, lastName: $lastName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveUser &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(imageUrl);

  @override
  $SaveUserCopyWith<SaveUser> get copyWith =>
      _$SaveUserCopyWithImpl<SaveUser>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result nameChanged(String name),
    @required Result lastNameChanged(String name),
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result loginPressed(String email, String password),
    @required
        Result registerPressed(
            String email, String password, String passwordConfirmation),
    @required
        Result saveUserPressed(String name, String lastName, String imageUrl),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return saveUserPressed(name, lastName, imageUrl);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result nameChanged(String name),
    Result lastNameChanged(String name),
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result loginPressed(String email, String password),
    Result registerPressed(
        String email, String password, String passwordConfirmation),
    Result saveUserPressed(String name, String lastName, String imageUrl),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveUserPressed != null) {
      return saveUserPressed(name, lastName, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result nameChanged(NameChanged value),
    @required Result lastNameChanged(LastNameChanged value),
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result loginPressed(Login value),
    @required Result registerPressed(Register value),
    @required Result saveUserPressed(SaveUser value),
  }) {
    assert(nameChanged != null);
    assert(lastNameChanged != null);
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(loginPressed != null);
    assert(registerPressed != null);
    assert(saveUserPressed != null);
    return saveUserPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result nameChanged(NameChanged value),
    Result lastNameChanged(LastNameChanged value),
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PasswordChanged value),
    Result loginPressed(Login value),
    Result registerPressed(Register value),
    Result saveUserPressed(SaveUser value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveUserPressed != null) {
      return saveUserPressed(this);
    }
    return orElse();
  }
}

abstract class SaveUser implements AuthEvent {
  const factory SaveUser(String name, String lastName, String imageUrl) =
      _$SaveUser;

  String get name;
  String get lastName;
  String get imageUrl;
  $SaveUserCopyWith<SaveUser> get copyWith;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _AuthState call(
      {@required bool isNameValid,
      @required bool isLastNameValid,
      @required bool isEmailValid,
      @required bool isPasswordValid,
      @required bool isSubmitting,
      @required bool isSuccess,
      @required bool isFailure}) {
    return _AuthState(
      isNameValid: isNameValid,
      isLastNameValid: isLastNameValid,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get isNameValid;
  bool get isLastNameValid;
  bool get isEmailValid;
  bool get isPasswordValid;
  bool get isSubmitting;
  bool get isSuccess;
  bool get isFailure;

  $AuthStateCopyWith<AuthState> get copyWith;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isNameValid,
      bool isLastNameValid,
      bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object isNameValid = freezed,
    Object isLastNameValid = freezed,
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object isFailure = freezed,
  }) {
    return _then(_value.copyWith(
      isNameValid:
          isNameValid == freezed ? _value.isNameValid : isNameValid as bool,
      isLastNameValid: isLastNameValid == freezed
          ? _value.isLastNameValid
          : isLastNameValid as bool,
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isNameValid,
      bool isLastNameValid,
      bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object isNameValid = freezed,
    Object isLastNameValid = freezed,
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object isFailure = freezed,
  }) {
    return _then(_AuthState(
      isNameValid:
          isNameValid == freezed ? _value.isNameValid : isNameValid as bool,
      isLastNameValid: isLastNameValid == freezed
          ? _value.isLastNameValid
          : isLastNameValid as bool,
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
    ));
  }
}

/// @nodoc
class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {@required this.isNameValid,
      @required this.isLastNameValid,
      @required this.isEmailValid,
      @required this.isPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure})
      : assert(isNameValid != null),
        assert(isLastNameValid != null),
        assert(isEmailValid != null),
        assert(isPasswordValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        assert(isFailure != null);

  @override
  final bool isNameValid;
  @override
  final bool isLastNameValid;
  @override
  final bool isEmailValid;
  @override
  final bool isPasswordValid;
  @override
  final bool isSubmitting;
  @override
  final bool isSuccess;
  @override
  final bool isFailure;

  @override
  String toString() {
    return 'AuthState(isNameValid: $isNameValid, isLastNameValid: $isLastNameValid, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.isNameValid, isNameValid) ||
                const DeepCollectionEquality()
                    .equals(other.isNameValid, isNameValid)) &&
            (identical(other.isLastNameValid, isLastNameValid) ||
                const DeepCollectionEquality()
                    .equals(other.isLastNameValid, isLastNameValid)) &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.isFailure, isFailure) ||
                const DeepCollectionEquality()
                    .equals(other.isFailure, isFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isNameValid) ^
      const DeepCollectionEquality().hash(isLastNameValid) ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(isFailure);

  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {@required bool isNameValid,
      @required bool isLastNameValid,
      @required bool isEmailValid,
      @required bool isPasswordValid,
      @required bool isSubmitting,
      @required bool isSuccess,
      @required bool isFailure}) = _$_AuthState;

  @override
  bool get isNameValid;
  @override
  bool get isLastNameValid;
  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  bool get isFailure;
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
