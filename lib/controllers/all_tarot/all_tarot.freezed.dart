// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_tarot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllTarotState {
  List<TarotModel> get tarotList => throw _privateConstructorUsedError;
  Map<int, TarotModel> get tarotMap => throw _privateConstructorUsedError;
  Map<String, List<TarotModel>> get tarotCategoryMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of AllTarotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllTarotStateCopyWith<AllTarotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTarotStateCopyWith<$Res> {
  factory $AllTarotStateCopyWith(
          AllTarotState value, $Res Function(AllTarotState) then) =
      _$AllTarotStateCopyWithImpl<$Res, AllTarotState>;
  @useResult
  $Res call(
      {List<TarotModel> tarotList,
      Map<int, TarotModel> tarotMap,
      Map<String, List<TarotModel>> tarotCategoryMap});
}

/// @nodoc
class _$AllTarotStateCopyWithImpl<$Res, $Val extends AllTarotState>
    implements $AllTarotStateCopyWith<$Res> {
  _$AllTarotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllTarotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tarotList = null,
    Object? tarotMap = null,
    Object? tarotCategoryMap = null,
  }) {
    return _then(_value.copyWith(
      tarotList: null == tarotList
          ? _value.tarotList
          : tarotList // ignore: cast_nullable_to_non_nullable
              as List<TarotModel>,
      tarotMap: null == tarotMap
          ? _value.tarotMap
          : tarotMap // ignore: cast_nullable_to_non_nullable
              as Map<int, TarotModel>,
      tarotCategoryMap: null == tarotCategoryMap
          ? _value.tarotCategoryMap
          : tarotCategoryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TarotModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllTarotStateImplCopyWith<$Res>
    implements $AllTarotStateCopyWith<$Res> {
  factory _$$AllTarotStateImplCopyWith(
          _$AllTarotStateImpl value, $Res Function(_$AllTarotStateImpl) then) =
      __$$AllTarotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TarotModel> tarotList,
      Map<int, TarotModel> tarotMap,
      Map<String, List<TarotModel>> tarotCategoryMap});
}

/// @nodoc
class __$$AllTarotStateImplCopyWithImpl<$Res>
    extends _$AllTarotStateCopyWithImpl<$Res, _$AllTarotStateImpl>
    implements _$$AllTarotStateImplCopyWith<$Res> {
  __$$AllTarotStateImplCopyWithImpl(
      _$AllTarotStateImpl _value, $Res Function(_$AllTarotStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllTarotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tarotList = null,
    Object? tarotMap = null,
    Object? tarotCategoryMap = null,
  }) {
    return _then(_$AllTarotStateImpl(
      tarotList: null == tarotList
          ? _value._tarotList
          : tarotList // ignore: cast_nullable_to_non_nullable
              as List<TarotModel>,
      tarotMap: null == tarotMap
          ? _value._tarotMap
          : tarotMap // ignore: cast_nullable_to_non_nullable
              as Map<int, TarotModel>,
      tarotCategoryMap: null == tarotCategoryMap
          ? _value._tarotCategoryMap
          : tarotCategoryMap // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TarotModel>>,
    ));
  }
}

/// @nodoc

class _$AllTarotStateImpl implements _AllTarotState {
  const _$AllTarotStateImpl(
      {final List<TarotModel> tarotList = const <TarotModel>[],
      final Map<int, TarotModel> tarotMap = const <int, TarotModel>{},
      final Map<String, List<TarotModel>> tarotCategoryMap =
          const <String, List<TarotModel>>{}})
      : _tarotList = tarotList,
        _tarotMap = tarotMap,
        _tarotCategoryMap = tarotCategoryMap;

  final List<TarotModel> _tarotList;
  @override
  @JsonKey()
  List<TarotModel> get tarotList {
    if (_tarotList is EqualUnmodifiableListView) return _tarotList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarotList);
  }

  final Map<int, TarotModel> _tarotMap;
  @override
  @JsonKey()
  Map<int, TarotModel> get tarotMap {
    if (_tarotMap is EqualUnmodifiableMapView) return _tarotMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tarotMap);
  }

  final Map<String, List<TarotModel>> _tarotCategoryMap;
  @override
  @JsonKey()
  Map<String, List<TarotModel>> get tarotCategoryMap {
    if (_tarotCategoryMap is EqualUnmodifiableMapView) return _tarotCategoryMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tarotCategoryMap);
  }

  @override
  String toString() {
    return 'AllTarotState(tarotList: $tarotList, tarotMap: $tarotMap, tarotCategoryMap: $tarotCategoryMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllTarotStateImpl &&
            const DeepCollectionEquality()
                .equals(other._tarotList, _tarotList) &&
            const DeepCollectionEquality().equals(other._tarotMap, _tarotMap) &&
            const DeepCollectionEquality()
                .equals(other._tarotCategoryMap, _tarotCategoryMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tarotList),
      const DeepCollectionEquality().hash(_tarotMap),
      const DeepCollectionEquality().hash(_tarotCategoryMap));

  /// Create a copy of AllTarotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllTarotStateImplCopyWith<_$AllTarotStateImpl> get copyWith =>
      __$$AllTarotStateImplCopyWithImpl<_$AllTarotStateImpl>(this, _$identity);
}

abstract class _AllTarotState implements AllTarotState {
  const factory _AllTarotState(
          {final List<TarotModel> tarotList,
          final Map<int, TarotModel> tarotMap,
          final Map<String, List<TarotModel>> tarotCategoryMap}) =
      _$AllTarotStateImpl;

  @override
  List<TarotModel> get tarotList;
  @override
  Map<int, TarotModel> get tarotMap;
  @override
  Map<String, List<TarotModel>> get tarotCategoryMap;

  /// Create a copy of AllTarotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllTarotStateImplCopyWith<_$AllTarotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
