// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_profile_picture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateProfilePictureState {
  File? get selectedPhoto => throw _privateConstructorUsedError;

  /// Create a copy of CreateProfilePictureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateProfilePictureStateCopyWith<CreateProfilePictureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProfilePictureStateCopyWith<$Res> {
  factory $CreateProfilePictureStateCopyWith(CreateProfilePictureState value,
          $Res Function(CreateProfilePictureState) then) =
      _$CreateProfilePictureStateCopyWithImpl<$Res, CreateProfilePictureState>;
  @useResult
  $Res call({File? selectedPhoto});
}

/// @nodoc
class _$CreateProfilePictureStateCopyWithImpl<$Res,
        $Val extends CreateProfilePictureState>
    implements $CreateProfilePictureStateCopyWith<$Res> {
  _$CreateProfilePictureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateProfilePictureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPhoto = freezed,
  }) {
    return _then(_value.copyWith(
      selectedPhoto: freezed == selectedPhoto
          ? _value.selectedPhoto
          : selectedPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProfilePictureStateImplCopyWith<$Res>
    implements $CreateProfilePictureStateCopyWith<$Res> {
  factory _$$CreateProfilePictureStateImplCopyWith(
          _$CreateProfilePictureStateImpl value,
          $Res Function(_$CreateProfilePictureStateImpl) then) =
      __$$CreateProfilePictureStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? selectedPhoto});
}

/// @nodoc
class __$$CreateProfilePictureStateImplCopyWithImpl<$Res>
    extends _$CreateProfilePictureStateCopyWithImpl<$Res,
        _$CreateProfilePictureStateImpl>
    implements _$$CreateProfilePictureStateImplCopyWith<$Res> {
  __$$CreateProfilePictureStateImplCopyWithImpl(
      _$CreateProfilePictureStateImpl _value,
      $Res Function(_$CreateProfilePictureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateProfilePictureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPhoto = freezed,
  }) {
    return _then(_$CreateProfilePictureStateImpl(
      selectedPhoto: freezed == selectedPhoto
          ? _value.selectedPhoto
          : selectedPhoto // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$CreateProfilePictureStateImpl implements _CreateProfilePictureState {
  const _$CreateProfilePictureStateImpl({this.selectedPhoto});

  @override
  final File? selectedPhoto;

  @override
  String toString() {
    return 'CreateProfilePictureState(selectedPhoto: $selectedPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProfilePictureStateImpl &&
            (identical(other.selectedPhoto, selectedPhoto) ||
                other.selectedPhoto == selectedPhoto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedPhoto);

  /// Create a copy of CreateProfilePictureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProfilePictureStateImplCopyWith<_$CreateProfilePictureStateImpl>
      get copyWith => __$$CreateProfilePictureStateImplCopyWithImpl<
          _$CreateProfilePictureStateImpl>(this, _$identity);
}

abstract class _CreateProfilePictureState implements CreateProfilePictureState {
  const factory _CreateProfilePictureState({final File? selectedPhoto}) =
      _$CreateProfilePictureStateImpl;

  @override
  File? get selectedPhoto;

  /// Create a copy of CreateProfilePictureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateProfilePictureStateImplCopyWith<_$CreateProfilePictureStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
