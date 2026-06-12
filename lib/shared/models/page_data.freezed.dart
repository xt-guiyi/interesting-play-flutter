// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageData<T> {

 int get page; int get pageSize; int get total; T get data;
/// Create a copy of PageData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageDataCopyWith<T, PageData<T>> get copyWith => _$PageDataCopyWithImpl<T, PageData<T>>(this as PageData<T>, _$identity);

  /// Serializes this PageData to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageData<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,total,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PageData<$T>(page: $page, pageSize: $pageSize, total: $total, data: $data)';
}


}

/// @nodoc
abstract mixin class $PageDataCopyWith<T,$Res>  {
  factory $PageDataCopyWith(PageData<T> value, $Res Function(PageData<T>) _then) = _$PageDataCopyWithImpl;
@useResult
$Res call({
 int page, int pageSize, int total, T data
});




}
/// @nodoc
class _$PageDataCopyWithImpl<T,$Res>
    implements $PageDataCopyWith<T, $Res> {
  _$PageDataCopyWithImpl(this._self, this._then);

  final PageData<T> _self;
  final $Res Function(PageData<T>) _then;

/// Create a copy of PageData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? pageSize = null,Object? total = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}

}


/// Adds pattern-matching-related methods to [PageData].
extension PageDataPatterns<T> on PageData<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageData<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageData<T> value)  $default,){
final _that = this;
switch (_that) {
case _PageData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageData<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PageData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int pageSize,  int total,  T data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageData() when $default != null:
return $default(_that.page,_that.pageSize,_that.total,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int pageSize,  int total,  T data)  $default,) {final _that = this;
switch (_that) {
case _PageData():
return $default(_that.page,_that.pageSize,_that.total,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int pageSize,  int total,  T data)?  $default,) {final _that = this;
switch (_that) {
case _PageData() when $default != null:
return $default(_that.page,_that.pageSize,_that.total,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PageData<T> implements PageData<T> {
  const _PageData({required this.page, required this.pageSize, required this.total, required this.data});
  factory _PageData.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PageDataFromJson(json,fromJsonT);

@override final  int page;
@override final  int pageSize;
@override final  int total;
@override final  T data;

/// Create a copy of PageData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageDataCopyWith<T, _PageData<T>> get copyWith => __$PageDataCopyWithImpl<T, _PageData<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PageDataToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageData<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,total,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PageData<$T>(page: $page, pageSize: $pageSize, total: $total, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PageDataCopyWith<T,$Res> implements $PageDataCopyWith<T, $Res> {
  factory _$PageDataCopyWith(_PageData<T> value, $Res Function(_PageData<T>) _then) = __$PageDataCopyWithImpl;
@override @useResult
$Res call({
 int page, int pageSize, int total, T data
});




}
/// @nodoc
class __$PageDataCopyWithImpl<T,$Res>
    implements _$PageDataCopyWith<T, $Res> {
  __$PageDataCopyWithImpl(this._self, this._then);

  final _PageData<T> _self;
  final $Res Function(_PageData<T>) _then;

/// Create a copy of PageData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? pageSize = null,Object? total = null,Object? data = freezed,}) {
  return _then(_PageData<T>(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

// dart format on
