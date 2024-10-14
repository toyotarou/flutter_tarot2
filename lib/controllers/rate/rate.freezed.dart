// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RateState {
  List<RateModel> get rateList => throw _privateConstructorUsedError;
  Map<int, String> get rateMap => throw _privateConstructorUsedError;

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RateStateCopyWith<RateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateStateCopyWith<$Res> {
  factory $RateStateCopyWith(RateState value, $Res Function(RateState) then) =
      _$RateStateCopyWithImpl<$Res, RateState>;
  @useResult
  $Res call({List<RateModel> rateList, Map<int, String> rateMap});
}

/// @nodoc
class _$RateStateCopyWithImpl<$Res, $Val extends RateState>
    implements $RateStateCopyWith<$Res> {
  _$RateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rateList = null,
    Object? rateMap = null,
  }) {
    return _then(_value.copyWith(
      rateList: null == rateList
          ? _value.rateList
          : rateList // ignore: cast_nullable_to_non_nullable
              as List<RateModel>,
      rateMap: null == rateMap
          ? _value.rateMap
          : rateMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateStateImplCopyWith<$Res>
    implements $RateStateCopyWith<$Res> {
  factory _$$RateStateImplCopyWith(
          _$RateStateImpl value, $Res Function(_$RateStateImpl) then) =
      __$$RateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RateModel> rateList, Map<int, String> rateMap});
}

/// @nodoc
class __$$RateStateImplCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateStateImpl>
    implements _$$RateStateImplCopyWith<$Res> {
  __$$RateStateImplCopyWithImpl(
      _$RateStateImpl _value, $Res Function(_$RateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rateList = null,
    Object? rateMap = null,
  }) {
    return _then(_$RateStateImpl(
      rateList: null == rateList
          ? _value._rateList
          : rateList // ignore: cast_nullable_to_non_nullable
              as List<RateModel>,
      rateMap: null == rateMap
          ? _value._rateMap
          : rateMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc

class _$RateStateImpl implements _RateState {
  const _$RateStateImpl(
      {final List<RateModel> rateList = const <RateModel>[],
      final Map<int, String> rateMap = const <int, String>{}})
      : _rateList = rateList,
        _rateMap = rateMap;

  final List<RateModel> _rateList;
  @override
  @JsonKey()
  List<RateModel> get rateList {
    if (_rateList is EqualUnmodifiableListView) return _rateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rateList);
  }

  final Map<int, String> _rateMap;
  @override
  @JsonKey()
  Map<int, String> get rateMap {
    if (_rateMap is EqualUnmodifiableMapView) return _rateMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rateMap);
  }

  @override
  String toString() {
    return 'RateState(rateList: $rateList, rateMap: $rateMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateStateImpl &&
            const DeepCollectionEquality().equals(other._rateList, _rateList) &&
            const DeepCollectionEquality().equals(other._rateMap, _rateMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rateList),
      const DeepCollectionEquality().hash(_rateMap));

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateStateImplCopyWith<_$RateStateImpl> get copyWith =>
      __$$RateStateImplCopyWithImpl<_$RateStateImpl>(this, _$identity);
}

abstract class _RateState implements RateState {
  const factory _RateState(
      {final List<RateModel> rateList,
      final Map<int, String> rateMap}) = _$RateStateImpl;

  @override
  List<RateModel> get rateList;
  @override
  Map<int, String> get rateMap;

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateStateImplCopyWith<_$RateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
