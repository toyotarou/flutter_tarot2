// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_tarot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodayTarotState {
  TodayTarotModel? get todayTarot => throw _privateConstructorUsedError;

  /// Create a copy of TodayTarotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayTarotStateCopyWith<TodayTarotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayTarotStateCopyWith<$Res> {
  factory $TodayTarotStateCopyWith(
          TodayTarotState value, $Res Function(TodayTarotState) then) =
      _$TodayTarotStateCopyWithImpl<$Res, TodayTarotState>;
  @useResult
  $Res call({TodayTarotModel? todayTarot});
}

/// @nodoc
class _$TodayTarotStateCopyWithImpl<$Res, $Val extends TodayTarotState>
    implements $TodayTarotStateCopyWith<$Res> {
  _$TodayTarotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayTarotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayTarot = freezed,
  }) {
    return _then(_value.copyWith(
      todayTarot: freezed == todayTarot
          ? _value.todayTarot
          : todayTarot // ignore: cast_nullable_to_non_nullable
              as TodayTarotModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodayTarotStateImplCopyWith<$Res>
    implements $TodayTarotStateCopyWith<$Res> {
  factory _$$TodayTarotStateImplCopyWith(_$TodayTarotStateImpl value,
          $Res Function(_$TodayTarotStateImpl) then) =
      __$$TodayTarotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TodayTarotModel? todayTarot});
}

/// @nodoc
class __$$TodayTarotStateImplCopyWithImpl<$Res>
    extends _$TodayTarotStateCopyWithImpl<$Res, _$TodayTarotStateImpl>
    implements _$$TodayTarotStateImplCopyWith<$Res> {
  __$$TodayTarotStateImplCopyWithImpl(
      _$TodayTarotStateImpl _value, $Res Function(_$TodayTarotStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayTarotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayTarot = freezed,
  }) {
    return _then(_$TodayTarotStateImpl(
      todayTarot: freezed == todayTarot
          ? _value.todayTarot
          : todayTarot // ignore: cast_nullable_to_non_nullable
              as TodayTarotModel?,
    ));
  }
}

/// @nodoc

class _$TodayTarotStateImpl implements _TodayTarotState {
  const _$TodayTarotStateImpl({this.todayTarot});

  @override
  final TodayTarotModel? todayTarot;

  @override
  String toString() {
    return 'TodayTarotState(todayTarot: $todayTarot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayTarotStateImpl &&
            (identical(other.todayTarot, todayTarot) ||
                other.todayTarot == todayTarot));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todayTarot);

  /// Create a copy of TodayTarotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayTarotStateImplCopyWith<_$TodayTarotStateImpl> get copyWith =>
      __$$TodayTarotStateImplCopyWithImpl<_$TodayTarotStateImpl>(
          this, _$identity);
}

abstract class _TodayTarotState implements TodayTarotState {
  const factory _TodayTarotState({final TodayTarotModel? todayTarot}) =
      _$TodayTarotStateImpl;

  @override
  TodayTarotModel? get todayTarot;

  /// Create a copy of TodayTarotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayTarotStateImplCopyWith<_$TodayTarotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
