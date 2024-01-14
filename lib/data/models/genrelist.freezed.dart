// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genrelist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenreList _$GenreListFromJson(Map<String, dynamic> json) {
  return _GenreList.fromJson(json);
}

/// @nodoc
mixin _$GenreList {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreListCopyWith<GenreList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreListCopyWith<$Res> {
  factory $GenreListCopyWith(GenreList value, $Res Function(GenreList) then) =
      _$GenreListCopyWithImpl<$Res, GenreList>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$GenreListCopyWithImpl<$Res, $Val extends GenreList>
    implements $GenreListCopyWith<$Res> {
  _$GenreListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreListImplCopyWith<$Res>
    implements $GenreListCopyWith<$Res> {
  factory _$$GenreListImplCopyWith(
          _$GenreListImpl value, $Res Function(_$GenreListImpl) then) =
      __$$GenreListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$GenreListImplCopyWithImpl<$Res>
    extends _$GenreListCopyWithImpl<$Res, _$GenreListImpl>
    implements _$$GenreListImplCopyWith<$Res> {
  __$$GenreListImplCopyWithImpl(
      _$GenreListImpl _value, $Res Function(_$GenreListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$GenreListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreListImpl implements _GenreList {
  _$GenreListImpl({this.id, this.name});

  factory _$GenreListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreListImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'GenreList(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreListImplCopyWith<_$GenreListImpl> get copyWith =>
      __$$GenreListImplCopyWithImpl<_$GenreListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreListImplToJson(
      this,
    );
  }
}

abstract class _GenreList implements GenreList {
  factory _GenreList({final int? id, final String? name}) = _$GenreListImpl;

  factory _GenreList.fromJson(Map<String, dynamic> json) =
      _$GenreListImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$GenreListImplCopyWith<_$GenreListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
