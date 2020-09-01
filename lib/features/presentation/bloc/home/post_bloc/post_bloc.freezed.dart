// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PostEventTearOff {
  const _$PostEventTearOff();

// ignore: unused_element
  GetPostEvent getPost() {
    return const GetPostEvent();
  }
}

// ignore: unused_element
const $PostEvent = _$PostEventTearOff();

mixin _$PostEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPost(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPost(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPost(GetPostEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPost(GetPostEvent value),
    @required Result orElse(),
  });
}

abstract class $PostEventCopyWith<$Res> {
  factory $PostEventCopyWith(PostEvent value, $Res Function(PostEvent) then) =
      _$PostEventCopyWithImpl<$Res>;
}

class _$PostEventCopyWithImpl<$Res> implements $PostEventCopyWith<$Res> {
  _$PostEventCopyWithImpl(this._value, this._then);

  final PostEvent _value;
  // ignore: unused_field
  final $Res Function(PostEvent) _then;
}

abstract class $GetPostEventCopyWith<$Res> {
  factory $GetPostEventCopyWith(
          GetPostEvent value, $Res Function(GetPostEvent) then) =
      _$GetPostEventCopyWithImpl<$Res>;
}

class _$GetPostEventCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements $GetPostEventCopyWith<$Res> {
  _$GetPostEventCopyWithImpl(
      GetPostEvent _value, $Res Function(GetPostEvent) _then)
      : super(_value, (v) => _then(v as GetPostEvent));

  @override
  GetPostEvent get _value => super._value as GetPostEvent;
}

class _$GetPostEvent implements GetPostEvent {
  const _$GetPostEvent();

  @override
  String toString() {
    return 'PostEvent.getPost()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GetPostEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getPost(),
  }) {
    assert(getPost != null);
    return getPost();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getPost(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPost != null) {
      return getPost();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getPost(GetPostEvent value),
  }) {
    assert(getPost != null);
    return getPost(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getPost(GetPostEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getPost != null) {
      return getPost(this);
    }
    return orElse();
  }
}

abstract class GetPostEvent implements PostEvent {
  const factory GetPostEvent() = _$GetPostEvent;
}
