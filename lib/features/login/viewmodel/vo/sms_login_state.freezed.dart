// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sms_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SmsLoginState {

 bool get isSendingCode; bool get isLoggingIn; int get resendSeconds; String? get errorMessage;
/// Create a copy of SmsLoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SmsLoginStateCopyWith<SmsLoginState> get copyWith => _$SmsLoginStateCopyWithImpl<SmsLoginState>(this as SmsLoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SmsLoginState&&(identical(other.isSendingCode, isSendingCode) || other.isSendingCode == isSendingCode)&&(identical(other.isLoggingIn, isLoggingIn) || other.isLoggingIn == isLoggingIn)&&(identical(other.resendSeconds, resendSeconds) || other.resendSeconds == resendSeconds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSendingCode,isLoggingIn,resendSeconds,errorMessage);

@override
String toString() {
  return 'SmsLoginState(isSendingCode: $isSendingCode, isLoggingIn: $isLoggingIn, resendSeconds: $resendSeconds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SmsLoginStateCopyWith<$Res>  {
  factory $SmsLoginStateCopyWith(SmsLoginState value, $Res Function(SmsLoginState) _then) = _$SmsLoginStateCopyWithImpl;
@useResult
$Res call({
 bool isSendingCode, bool isLoggingIn, int resendSeconds, String? errorMessage
});




}
/// @nodoc
class _$SmsLoginStateCopyWithImpl<$Res>
    implements $SmsLoginStateCopyWith<$Res> {
  _$SmsLoginStateCopyWithImpl(this._self, this._then);

  final SmsLoginState _self;
  final $Res Function(SmsLoginState) _then;

/// Create a copy of SmsLoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSendingCode = null,Object? isLoggingIn = null,Object? resendSeconds = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isSendingCode: null == isSendingCode ? _self.isSendingCode : isSendingCode // ignore: cast_nullable_to_non_nullable
as bool,isLoggingIn: null == isLoggingIn ? _self.isLoggingIn : isLoggingIn // ignore: cast_nullable_to_non_nullable
as bool,resendSeconds: null == resendSeconds ? _self.resendSeconds : resendSeconds // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SmsLoginState].
extension SmsLoginStatePatterns on SmsLoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SmsLoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SmsLoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SmsLoginState value)  $default,){
final _that = this;
switch (_that) {
case _SmsLoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SmsLoginState value)?  $default,){
final _that = this;
switch (_that) {
case _SmsLoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSendingCode,  bool isLoggingIn,  int resendSeconds,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SmsLoginState() when $default != null:
return $default(_that.isSendingCode,_that.isLoggingIn,_that.resendSeconds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSendingCode,  bool isLoggingIn,  int resendSeconds,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SmsLoginState():
return $default(_that.isSendingCode,_that.isLoggingIn,_that.resendSeconds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSendingCode,  bool isLoggingIn,  int resendSeconds,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SmsLoginState() when $default != null:
return $default(_that.isSendingCode,_that.isLoggingIn,_that.resendSeconds,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SmsLoginState extends SmsLoginState {
  const _SmsLoginState({this.isSendingCode = false, this.isLoggingIn = false, this.resendSeconds = 0, this.errorMessage}): super._();
  

@override@JsonKey() final  bool isSendingCode;
@override@JsonKey() final  bool isLoggingIn;
@override@JsonKey() final  int resendSeconds;
@override final  String? errorMessage;

/// Create a copy of SmsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SmsLoginStateCopyWith<_SmsLoginState> get copyWith => __$SmsLoginStateCopyWithImpl<_SmsLoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SmsLoginState&&(identical(other.isSendingCode, isSendingCode) || other.isSendingCode == isSendingCode)&&(identical(other.isLoggingIn, isLoggingIn) || other.isLoggingIn == isLoggingIn)&&(identical(other.resendSeconds, resendSeconds) || other.resendSeconds == resendSeconds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isSendingCode,isLoggingIn,resendSeconds,errorMessage);

@override
String toString() {
  return 'SmsLoginState(isSendingCode: $isSendingCode, isLoggingIn: $isLoggingIn, resendSeconds: $resendSeconds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SmsLoginStateCopyWith<$Res> implements $SmsLoginStateCopyWith<$Res> {
  factory _$SmsLoginStateCopyWith(_SmsLoginState value, $Res Function(_SmsLoginState) _then) = __$SmsLoginStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSendingCode, bool isLoggingIn, int resendSeconds, String? errorMessage
});




}
/// @nodoc
class __$SmsLoginStateCopyWithImpl<$Res>
    implements _$SmsLoginStateCopyWith<$Res> {
  __$SmsLoginStateCopyWithImpl(this._self, this._then);

  final _SmsLoginState _self;
  final $Res Function(_SmsLoginState) _then;

/// Create a copy of SmsLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSendingCode = null,Object? isLoggingIn = null,Object? resendSeconds = null,Object? errorMessage = freezed,}) {
  return _then(_SmsLoginState(
isSendingCode: null == isSendingCode ? _self.isSendingCode : isSendingCode // ignore: cast_nullable_to_non_nullable
as bool,isLoggingIn: null == isLoggingIn ? _self.isLoggingIn : isLoggingIn // ignore: cast_nullable_to_non_nullable
as bool,resendSeconds: null == resendSeconds ? _self.resendSeconds : resendSeconds // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
