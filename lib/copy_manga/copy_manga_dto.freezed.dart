// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'copy_manga_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CopyMangaResponse {

 int get code; String get message; Object? get results;
/// Create a copy of CopyMangaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopyMangaResponseCopyWith<CopyMangaResponse> get copyWith => _$CopyMangaResponseCopyWithImpl<CopyMangaResponse>(this as CopyMangaResponse, _$identity);

  /// Serializes this CopyMangaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopyMangaResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CopyMangaResponse(code: $code, message: $message, results: $results)';
}


}

/// @nodoc
abstract mixin class $CopyMangaResponseCopyWith<$Res>  {
  factory $CopyMangaResponseCopyWith(CopyMangaResponse value, $Res Function(CopyMangaResponse) _then) = _$CopyMangaResponseCopyWithImpl;
@useResult
$Res call({
 int code, String message, Object? results
});




}
/// @nodoc
class _$CopyMangaResponseCopyWithImpl<$Res>
    implements $CopyMangaResponseCopyWith<$Res> {
  _$CopyMangaResponseCopyWithImpl(this._self, this._then);

  final CopyMangaResponse _self;
  final $Res Function(CopyMangaResponse) _then;

/// Create a copy of CopyMangaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? results = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,results: freezed == results ? _self.results : results ,
  ));
}

}


/// Adds pattern-matching-related methods to [CopyMangaResponse].
extension CopyMangaResponsePatterns on CopyMangaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CopyMangaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CopyMangaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CopyMangaResponse value)  $default,){
final _that = this;
switch (_that) {
case _CopyMangaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CopyMangaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CopyMangaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String message,  Object? results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CopyMangaResponse() when $default != null:
return $default(_that.code,_that.message,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String message,  Object? results)  $default,) {final _that = this;
switch (_that) {
case _CopyMangaResponse():
return $default(_that.code,_that.message,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String message,  Object? results)?  $default,) {final _that = this;
switch (_that) {
case _CopyMangaResponse() when $default != null:
return $default(_that.code,_that.message,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CopyMangaResponse implements CopyMangaResponse {
  const _CopyMangaResponse({required this.code, this.message = '请求失败', this.results});
  factory _CopyMangaResponse.fromJson(Map<String, dynamic> json) => _$CopyMangaResponseFromJson(json);

@override final  int code;
@override@JsonKey() final  String message;
@override final  Object? results;

/// Create a copy of CopyMangaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CopyMangaResponseCopyWith<_CopyMangaResponse> get copyWith => __$CopyMangaResponseCopyWithImpl<_CopyMangaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CopyMangaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CopyMangaResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'CopyMangaResponse(code: $code, message: $message, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CopyMangaResponseCopyWith<$Res> implements $CopyMangaResponseCopyWith<$Res> {
  factory _$CopyMangaResponseCopyWith(_CopyMangaResponse value, $Res Function(_CopyMangaResponse) _then) = __$CopyMangaResponseCopyWithImpl;
@override @useResult
$Res call({
 int code, String message, Object? results
});




}
/// @nodoc
class __$CopyMangaResponseCopyWithImpl<$Res>
    implements _$CopyMangaResponseCopyWith<$Res> {
  __$CopyMangaResponseCopyWithImpl(this._self, this._then);

  final _CopyMangaResponse _self;
  final $Res Function(_CopyMangaResponse) _then;

/// Create a copy of CopyMangaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? results = freezed,}) {
  return _then(_CopyMangaResponse(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,results: freezed == results ? _self.results : results ,
  ));
}


}


/// @nodoc
mixin _$LoginResultDto {

 String get token;
/// Create a copy of LoginResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResultDtoCopyWith<LoginResultDto> get copyWith => _$LoginResultDtoCopyWithImpl<LoginResultDto>(this as LoginResultDto, _$identity);

  /// Serializes this LoginResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResultDto&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'LoginResultDto(token: $token)';
}


}

/// @nodoc
abstract mixin class $LoginResultDtoCopyWith<$Res>  {
  factory $LoginResultDtoCopyWith(LoginResultDto value, $Res Function(LoginResultDto) _then) = _$LoginResultDtoCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$LoginResultDtoCopyWithImpl<$Res>
    implements $LoginResultDtoCopyWith<$Res> {
  _$LoginResultDtoCopyWithImpl(this._self, this._then);

  final LoginResultDto _self;
  final $Res Function(LoginResultDto) _then;

/// Create a copy of LoginResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResultDto].
extension LoginResultDtoPatterns on LoginResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResultDto value)  $default,){
final _that = this;
switch (_that) {
case _LoginResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResultDto() when $default != null:
return $default(_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token)  $default,) {final _that = this;
switch (_that) {
case _LoginResultDto():
return $default(_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token)?  $default,) {final _that = this;
switch (_that) {
case _LoginResultDto() when $default != null:
return $default(_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResultDto implements LoginResultDto {
  const _LoginResultDto({required this.token});
  factory _LoginResultDto.fromJson(Map<String, dynamic> json) => _$LoginResultDtoFromJson(json);

@override final  String token;

/// Create a copy of LoginResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResultDtoCopyWith<_LoginResultDto> get copyWith => __$LoginResultDtoCopyWithImpl<_LoginResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResultDto&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'LoginResultDto(token: $token)';
}


}

/// @nodoc
abstract mixin class _$LoginResultDtoCopyWith<$Res> implements $LoginResultDtoCopyWith<$Res> {
  factory _$LoginResultDtoCopyWith(_LoginResultDto value, $Res Function(_LoginResultDto) _then) = __$LoginResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String token
});




}
/// @nodoc
class __$LoginResultDtoCopyWithImpl<$Res>
    implements _$LoginResultDtoCopyWith<$Res> {
  __$LoginResultDtoCopyWithImpl(this._self, this._then);

  final _LoginResultDto _self;
  final $Res Function(_LoginResultDto) _then;

/// Create a copy of LoginResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_LoginResultDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NamedPathDto {

 String get name; String get pathWord;
/// Create a copy of NamedPathDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedPathDtoCopyWith<NamedPathDto> get copyWith => _$NamedPathDtoCopyWithImpl<NamedPathDto>(this as NamedPathDto, _$identity);

  /// Serializes this NamedPathDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedPathDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord);

@override
String toString() {
  return 'NamedPathDto(name: $name, pathWord: $pathWord)';
}


}

/// @nodoc
abstract mixin class $NamedPathDtoCopyWith<$Res>  {
  factory $NamedPathDtoCopyWith(NamedPathDto value, $Res Function(NamedPathDto) _then) = _$NamedPathDtoCopyWithImpl;
@useResult
$Res call({
 String name, String pathWord
});




}
/// @nodoc
class _$NamedPathDtoCopyWithImpl<$Res>
    implements $NamedPathDtoCopyWith<$Res> {
  _$NamedPathDtoCopyWithImpl(this._self, this._then);

  final NamedPathDto _self;
  final $Res Function(NamedPathDto) _then;

/// Create a copy of NamedPathDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pathWord = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NamedPathDto].
extension NamedPathDtoPatterns on NamedPathDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamedPathDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamedPathDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamedPathDto value)  $default,){
final _that = this;
switch (_that) {
case _NamedPathDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamedPathDto value)?  $default,){
final _that = this;
switch (_that) {
case _NamedPathDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String pathWord)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamedPathDto() when $default != null:
return $default(_that.name,_that.pathWord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String pathWord)  $default,) {final _that = this;
switch (_that) {
case _NamedPathDto():
return $default(_that.name,_that.pathWord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String pathWord)?  $default,) {final _that = this;
switch (_that) {
case _NamedPathDto() when $default != null:
return $default(_that.name,_that.pathWord);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NamedPathDto implements NamedPathDto {
  const _NamedPathDto({this.name = '', this.pathWord = ''});
  factory _NamedPathDto.fromJson(Map<String, dynamic> json) => _$NamedPathDtoFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String pathWord;

/// Create a copy of NamedPathDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamedPathDtoCopyWith<_NamedPathDto> get copyWith => __$NamedPathDtoCopyWithImpl<_NamedPathDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedPathDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamedPathDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord);

@override
String toString() {
  return 'NamedPathDto(name: $name, pathWord: $pathWord)';
}


}

/// @nodoc
abstract mixin class _$NamedPathDtoCopyWith<$Res> implements $NamedPathDtoCopyWith<$Res> {
  factory _$NamedPathDtoCopyWith(_NamedPathDto value, $Res Function(_NamedPathDto) _then) = __$NamedPathDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String pathWord
});




}
/// @nodoc
class __$NamedPathDtoCopyWithImpl<$Res>
    implements _$NamedPathDtoCopyWith<$Res> {
  __$NamedPathDtoCopyWithImpl(this._self, this._then);

  final _NamedPathDto _self;
  final $Res Function(_NamedPathDto) _then;

/// Create a copy of NamedPathDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pathWord = null,}) {
  return _then(_NamedPathDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ComicStatusDto {

 String get display;
/// Create a copy of ComicStatusDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicStatusDtoCopyWith<ComicStatusDto> get copyWith => _$ComicStatusDtoCopyWithImpl<ComicStatusDto>(this as ComicStatusDto, _$identity);

  /// Serializes this ComicStatusDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicStatusDto&&(identical(other.display, display) || other.display == display));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display);

@override
String toString() {
  return 'ComicStatusDto(display: $display)';
}


}

/// @nodoc
abstract mixin class $ComicStatusDtoCopyWith<$Res>  {
  factory $ComicStatusDtoCopyWith(ComicStatusDto value, $Res Function(ComicStatusDto) _then) = _$ComicStatusDtoCopyWithImpl;
@useResult
$Res call({
 String display
});




}
/// @nodoc
class _$ComicStatusDtoCopyWithImpl<$Res>
    implements $ComicStatusDtoCopyWith<$Res> {
  _$ComicStatusDtoCopyWithImpl(this._self, this._then);

  final ComicStatusDto _self;
  final $Res Function(ComicStatusDto) _then;

/// Create a copy of ComicStatusDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? display = null,}) {
  return _then(_self.copyWith(
display: null == display ? _self.display : display // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicStatusDto].
extension ComicStatusDtoPatterns on ComicStatusDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicStatusDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicStatusDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicStatusDto value)  $default,){
final _that = this;
switch (_that) {
case _ComicStatusDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicStatusDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComicStatusDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String display)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicStatusDto() when $default != null:
return $default(_that.display);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String display)  $default,) {final _that = this;
switch (_that) {
case _ComicStatusDto():
return $default(_that.display);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String display)?  $default,) {final _that = this;
switch (_that) {
case _ComicStatusDto() when $default != null:
return $default(_that.display);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicStatusDto implements ComicStatusDto {
  const _ComicStatusDto({this.display = ''});
  factory _ComicStatusDto.fromJson(Map<String, dynamic> json) => _$ComicStatusDtoFromJson(json);

@override@JsonKey() final  String display;

/// Create a copy of ComicStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicStatusDtoCopyWith<_ComicStatusDto> get copyWith => __$ComicStatusDtoCopyWithImpl<_ComicStatusDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicStatusDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicStatusDto&&(identical(other.display, display) || other.display == display));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,display);

@override
String toString() {
  return 'ComicStatusDto(display: $display)';
}


}

/// @nodoc
abstract mixin class _$ComicStatusDtoCopyWith<$Res> implements $ComicStatusDtoCopyWith<$Res> {
  factory _$ComicStatusDtoCopyWith(_ComicStatusDto value, $Res Function(_ComicStatusDto) _then) = __$ComicStatusDtoCopyWithImpl;
@override @useResult
$Res call({
 String display
});




}
/// @nodoc
class __$ComicStatusDtoCopyWithImpl<$Res>
    implements _$ComicStatusDtoCopyWith<$Res> {
  __$ComicStatusDtoCopyWithImpl(this._self, this._then);

  final _ComicStatusDto _self;
  final $Res Function(_ComicStatusDto) _then;

/// Create a copy of ComicStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? display = null,}) {
  return _then(_ComicStatusDto(
display: null == display ? _self.display : display // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ComicDto {

 String get pathWord; String get uuid; String get name; String get cover; String get brief; String get datetimeUpdated;@JsonKey(name: 'author') List<NamedPathDto> get authors;@JsonKey(name: 'theme') List<NamedPathDto> get themes; ComicStatusDto? get status;
/// Create a copy of ComicDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicDtoCopyWith<ComicDto> get copyWith => _$ComicDtoCopyWithImpl<ComicDto>(this as ComicDto, _$identity);

  /// Serializes this ComicDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicDto&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.themes, themes)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pathWord,uuid,name,cover,brief,datetimeUpdated,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(themes),status);

@override
String toString() {
  return 'ComicDto(pathWord: $pathWord, uuid: $uuid, name: $name, cover: $cover, brief: $brief, datetimeUpdated: $datetimeUpdated, authors: $authors, themes: $themes, status: $status)';
}


}

/// @nodoc
abstract mixin class $ComicDtoCopyWith<$Res>  {
  factory $ComicDtoCopyWith(ComicDto value, $Res Function(ComicDto) _then) = _$ComicDtoCopyWithImpl;
@useResult
$Res call({
 String pathWord, String uuid, String name, String cover, String brief, String datetimeUpdated,@JsonKey(name: 'author') List<NamedPathDto> authors,@JsonKey(name: 'theme') List<NamedPathDto> themes, ComicStatusDto? status
});


$ComicStatusDtoCopyWith<$Res>? get status;

}
/// @nodoc
class _$ComicDtoCopyWithImpl<$Res>
    implements $ComicDtoCopyWith<$Res> {
  _$ComicDtoCopyWithImpl(this._self, this._then);

  final ComicDto _self;
  final $Res Function(ComicDto) _then;

/// Create a copy of ComicDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pathWord = null,Object? uuid = null,Object? name = null,Object? cover = null,Object? brief = null,Object? datetimeUpdated = null,Object? authors = null,Object? themes = null,Object? status = freezed,}) {
  return _then(_self.copyWith(
pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,datetimeUpdated: null == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComicStatusDto?,
  ));
}
/// Create a copy of ComicDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicStatusDtoCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $ComicStatusDtoCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicDto].
extension ComicDtoPatterns on ComicDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicDto value)  $default,){
final _that = this;
switch (_that) {
case _ComicDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComicDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pathWord,  String uuid,  String name,  String cover,  String brief,  String datetimeUpdated, @JsonKey(name: 'author')  List<NamedPathDto> authors, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  ComicStatusDto? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicDto() when $default != null:
return $default(_that.pathWord,_that.uuid,_that.name,_that.cover,_that.brief,_that.datetimeUpdated,_that.authors,_that.themes,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pathWord,  String uuid,  String name,  String cover,  String brief,  String datetimeUpdated, @JsonKey(name: 'author')  List<NamedPathDto> authors, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  ComicStatusDto? status)  $default,) {final _that = this;
switch (_that) {
case _ComicDto():
return $default(_that.pathWord,_that.uuid,_that.name,_that.cover,_that.brief,_that.datetimeUpdated,_that.authors,_that.themes,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pathWord,  String uuid,  String name,  String cover,  String brief,  String datetimeUpdated, @JsonKey(name: 'author')  List<NamedPathDto> authors, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  ComicStatusDto? status)?  $default,) {final _that = this;
switch (_that) {
case _ComicDto() when $default != null:
return $default(_that.pathWord,_that.uuid,_that.name,_that.cover,_that.brief,_that.datetimeUpdated,_that.authors,_that.themes,_that.status);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ComicDto implements ComicDto {
  const _ComicDto({this.pathWord = '', this.uuid = '', this.name = '', this.cover = '', this.brief = '', this.datetimeUpdated = '', @JsonKey(name: 'author') final  List<NamedPathDto> authors = const [], @JsonKey(name: 'theme') final  List<NamedPathDto> themes = const [], this.status}): _authors = authors,_themes = themes;
  factory _ComicDto.fromJson(Map<String, dynamic> json) => _$ComicDtoFromJson(json);

@override@JsonKey() final  String pathWord;
@override@JsonKey() final  String uuid;
@override@JsonKey() final  String name;
@override@JsonKey() final  String cover;
@override@JsonKey() final  String brief;
@override@JsonKey() final  String datetimeUpdated;
 final  List<NamedPathDto> _authors;
@override@JsonKey(name: 'author') List<NamedPathDto> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

 final  List<NamedPathDto> _themes;
@override@JsonKey(name: 'theme') List<NamedPathDto> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

@override final  ComicStatusDto? status;

/// Create a copy of ComicDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicDtoCopyWith<_ComicDto> get copyWith => __$ComicDtoCopyWithImpl<_ComicDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicDto&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.name, name) || other.name == name)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._themes, _themes)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pathWord,uuid,name,cover,brief,datetimeUpdated,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_themes),status);

@override
String toString() {
  return 'ComicDto(pathWord: $pathWord, uuid: $uuid, name: $name, cover: $cover, brief: $brief, datetimeUpdated: $datetimeUpdated, authors: $authors, themes: $themes, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ComicDtoCopyWith<$Res> implements $ComicDtoCopyWith<$Res> {
  factory _$ComicDtoCopyWith(_ComicDto value, $Res Function(_ComicDto) _then) = __$ComicDtoCopyWithImpl;
@override @useResult
$Res call({
 String pathWord, String uuid, String name, String cover, String brief, String datetimeUpdated,@JsonKey(name: 'author') List<NamedPathDto> authors,@JsonKey(name: 'theme') List<NamedPathDto> themes, ComicStatusDto? status
});


@override $ComicStatusDtoCopyWith<$Res>? get status;

}
/// @nodoc
class __$ComicDtoCopyWithImpl<$Res>
    implements _$ComicDtoCopyWith<$Res> {
  __$ComicDtoCopyWithImpl(this._self, this._then);

  final _ComicDto _self;
  final $Res Function(_ComicDto) _then;

/// Create a copy of ComicDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pathWord = null,Object? uuid = null,Object? name = null,Object? cover = null,Object? brief = null,Object? datetimeUpdated = null,Object? authors = null,Object? themes = null,Object? status = freezed,}) {
  return _then(_ComicDto(
pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,datetimeUpdated: null == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComicStatusDto?,
  ));
}

/// Create a copy of ComicDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicStatusDtoCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $ComicStatusDtoCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$RankedComicDto {

 ComicDto get comic; int get sort; int get riseSort; int get popular;
/// Create a copy of RankedComicDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankedComicDtoCopyWith<RankedComicDto> get copyWith => _$RankedComicDtoCopyWithImpl<RankedComicDto>(this as RankedComicDto, _$identity);

  /// Serializes this RankedComicDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RankedComicDto&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.riseSort, riseSort) || other.riseSort == riseSort)&&(identical(other.popular, popular) || other.popular == popular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comic,sort,riseSort,popular);

@override
String toString() {
  return 'RankedComicDto(comic: $comic, sort: $sort, riseSort: $riseSort, popular: $popular)';
}


}

/// @nodoc
abstract mixin class $RankedComicDtoCopyWith<$Res>  {
  factory $RankedComicDtoCopyWith(RankedComicDto value, $Res Function(RankedComicDto) _then) = _$RankedComicDtoCopyWithImpl;
@useResult
$Res call({
 ComicDto comic, int sort, int riseSort, int popular
});


$ComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class _$RankedComicDtoCopyWithImpl<$Res>
    implements $RankedComicDtoCopyWith<$Res> {
  _$RankedComicDtoCopyWithImpl(this._self, this._then);

  final RankedComicDto _self;
  final $Res Function(RankedComicDto) _then;

/// Create a copy of RankedComicDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comic = null,Object? sort = null,Object? riseSort = null,Object? popular = null,}) {
  return _then(_self.copyWith(
comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as ComicDto,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,riseSort: null == riseSort ? _self.riseSort : riseSort // ignore: cast_nullable_to_non_nullable
as int,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RankedComicDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicDtoCopyWith<$Res> get comic {
  
  return $ComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [RankedComicDto].
extension RankedComicDtoPatterns on RankedComicDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RankedComicDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RankedComicDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RankedComicDto value)  $default,){
final _that = this;
switch (_that) {
case _RankedComicDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RankedComicDto value)?  $default,){
final _that = this;
switch (_that) {
case _RankedComicDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ComicDto comic,  int sort,  int riseSort,  int popular)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RankedComicDto() when $default != null:
return $default(_that.comic,_that.sort,_that.riseSort,_that.popular);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ComicDto comic,  int sort,  int riseSort,  int popular)  $default,) {final _that = this;
switch (_that) {
case _RankedComicDto():
return $default(_that.comic,_that.sort,_that.riseSort,_that.popular);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ComicDto comic,  int sort,  int riseSort,  int popular)?  $default,) {final _that = this;
switch (_that) {
case _RankedComicDto() when $default != null:
return $default(_that.comic,_that.sort,_that.riseSort,_that.popular);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RankedComicDto implements RankedComicDto {
  const _RankedComicDto({required this.comic, required this.sort, this.riseSort = 0, this.popular = 0});
  factory _RankedComicDto.fromJson(Map<String, dynamic> json) => _$RankedComicDtoFromJson(json);

@override final  ComicDto comic;
@override final  int sort;
@override@JsonKey() final  int riseSort;
@override@JsonKey() final  int popular;

/// Create a copy of RankedComicDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RankedComicDtoCopyWith<_RankedComicDto> get copyWith => __$RankedComicDtoCopyWithImpl<_RankedComicDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RankedComicDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RankedComicDto&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.riseSort, riseSort) || other.riseSort == riseSort)&&(identical(other.popular, popular) || other.popular == popular));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comic,sort,riseSort,popular);

@override
String toString() {
  return 'RankedComicDto(comic: $comic, sort: $sort, riseSort: $riseSort, popular: $popular)';
}


}

/// @nodoc
abstract mixin class _$RankedComicDtoCopyWith<$Res> implements $RankedComicDtoCopyWith<$Res> {
  factory _$RankedComicDtoCopyWith(_RankedComicDto value, $Res Function(_RankedComicDto) _then) = __$RankedComicDtoCopyWithImpl;
@override @useResult
$Res call({
 ComicDto comic, int sort, int riseSort, int popular
});


@override $ComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class __$RankedComicDtoCopyWithImpl<$Res>
    implements _$RankedComicDtoCopyWith<$Res> {
  __$RankedComicDtoCopyWithImpl(this._self, this._then);

  final _RankedComicDto _self;
  final $Res Function(_RankedComicDto) _then;

/// Create a copy of RankedComicDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comic = null,Object? sort = null,Object? riseSort = null,Object? popular = null,}) {
  return _then(_RankedComicDto(
comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as ComicDto,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,riseSort: null == riseSort ? _self.riseSort : riseSort // ignore: cast_nullable_to_non_nullable
as int,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RankedComicDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicDtoCopyWith<$Res> get comic {
  
  return $ComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$ComicSectionDto {

 List<ComicDto> get list;
/// Create a copy of ComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicSectionDtoCopyWith<ComicSectionDto> get copyWith => _$ComicSectionDtoCopyWithImpl<ComicSectionDto>(this as ComicSectionDto, _$identity);

  /// Serializes this ComicSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicSectionDto&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'ComicSectionDto(list: $list)';
}


}

/// @nodoc
abstract mixin class $ComicSectionDtoCopyWith<$Res>  {
  factory $ComicSectionDtoCopyWith(ComicSectionDto value, $Res Function(ComicSectionDto) _then) = _$ComicSectionDtoCopyWithImpl;
@useResult
$Res call({
 List<ComicDto> list
});




}
/// @nodoc
class _$ComicSectionDtoCopyWithImpl<$Res>
    implements $ComicSectionDtoCopyWith<$Res> {
  _$ComicSectionDtoCopyWithImpl(this._self, this._then);

  final ComicSectionDto _self;
  final $Res Function(ComicSectionDto) _then;

/// Create a copy of ComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ComicDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicSectionDto].
extension ComicSectionDtoPatterns on ComicSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _ComicSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComicSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ComicDto> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicSectionDto() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ComicDto> list)  $default,) {final _that = this;
switch (_that) {
case _ComicSectionDto():
return $default(_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ComicDto> list)?  $default,) {final _that = this;
switch (_that) {
case _ComicSectionDto() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicSectionDto implements ComicSectionDto {
  const _ComicSectionDto({required final  List<ComicDto> list}): _list = list;
  factory _ComicSectionDto.fromJson(Map<String, dynamic> json) => _$ComicSectionDtoFromJson(json);

 final  List<ComicDto> _list;
@override List<ComicDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of ComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicSectionDtoCopyWith<_ComicSectionDto> get copyWith => __$ComicSectionDtoCopyWithImpl<_ComicSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicSectionDto&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'ComicSectionDto(list: $list)';
}


}

/// @nodoc
abstract mixin class _$ComicSectionDtoCopyWith<$Res> implements $ComicSectionDtoCopyWith<$Res> {
  factory _$ComicSectionDtoCopyWith(_ComicSectionDto value, $Res Function(_ComicSectionDto) _then) = __$ComicSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ComicDto> list
});




}
/// @nodoc
class __$ComicSectionDtoCopyWithImpl<$Res>
    implements _$ComicSectionDtoCopyWith<$Res> {
  __$ComicSectionDtoCopyWithImpl(this._self, this._then);

  final _ComicSectionDto _self;
  final $Res Function(_ComicSectionDto) _then;

/// Create a copy of ComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_ComicSectionDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ComicDto>,
  ));
}


}


/// @nodoc
mixin _$HomeResultDto {

 HomeTopicSectionDto get topics; HomeTopicSectionDto get topicsList;@JsonKey(name: 'recComics') HomeRecommendedSectionDto get recommended;@JsonKey(name: 'hotComics') List<HomeUpdateDto> get hot;@JsonKey(name: 'newComics') List<HomeUpdateDto> get latest;@JsonKey(name: 'finishComics') HomeComicSectionDto get finished;@JsonKey(name: 'rankDayComics') HomeRankSectionDto get rankDay;@JsonKey(name: 'rankWeekComics') HomeRankSectionDto get rankWeek;@JsonKey(name: 'rankMonthComics') HomeRankSectionDto get rankMonth; List<HomeBannerDto> get banners;
/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeResultDtoCopyWith<HomeResultDto> get copyWith => _$HomeResultDtoCopyWithImpl<HomeResultDto>(this as HomeResultDto, _$identity);

  /// Serializes this HomeResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeResultDto&&(identical(other.topics, topics) || other.topics == topics)&&(identical(other.topicsList, topicsList) || other.topicsList == topicsList)&&(identical(other.recommended, recommended) || other.recommended == recommended)&&const DeepCollectionEquality().equals(other.hot, hot)&&const DeepCollectionEquality().equals(other.latest, latest)&&(identical(other.finished, finished) || other.finished == finished)&&(identical(other.rankDay, rankDay) || other.rankDay == rankDay)&&(identical(other.rankWeek, rankWeek) || other.rankWeek == rankWeek)&&(identical(other.rankMonth, rankMonth) || other.rankMonth == rankMonth)&&const DeepCollectionEquality().equals(other.banners, banners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topics,topicsList,recommended,const DeepCollectionEquality().hash(hot),const DeepCollectionEquality().hash(latest),finished,rankDay,rankWeek,rankMonth,const DeepCollectionEquality().hash(banners));

@override
String toString() {
  return 'HomeResultDto(topics: $topics, topicsList: $topicsList, recommended: $recommended, hot: $hot, latest: $latest, finished: $finished, rankDay: $rankDay, rankWeek: $rankWeek, rankMonth: $rankMonth, banners: $banners)';
}


}

/// @nodoc
abstract mixin class $HomeResultDtoCopyWith<$Res>  {
  factory $HomeResultDtoCopyWith(HomeResultDto value, $Res Function(HomeResultDto) _then) = _$HomeResultDtoCopyWithImpl;
@useResult
$Res call({
 HomeTopicSectionDto topics, HomeTopicSectionDto topicsList,@JsonKey(name: 'recComics') HomeRecommendedSectionDto recommended,@JsonKey(name: 'hotComics') List<HomeUpdateDto> hot,@JsonKey(name: 'newComics') List<HomeUpdateDto> latest,@JsonKey(name: 'finishComics') HomeComicSectionDto finished,@JsonKey(name: 'rankDayComics') HomeRankSectionDto rankDay,@JsonKey(name: 'rankWeekComics') HomeRankSectionDto rankWeek,@JsonKey(name: 'rankMonthComics') HomeRankSectionDto rankMonth, List<HomeBannerDto> banners
});


$HomeTopicSectionDtoCopyWith<$Res> get topics;$HomeTopicSectionDtoCopyWith<$Res> get topicsList;$HomeRecommendedSectionDtoCopyWith<$Res> get recommended;$HomeComicSectionDtoCopyWith<$Res> get finished;$HomeRankSectionDtoCopyWith<$Res> get rankDay;$HomeRankSectionDtoCopyWith<$Res> get rankWeek;$HomeRankSectionDtoCopyWith<$Res> get rankMonth;

}
/// @nodoc
class _$HomeResultDtoCopyWithImpl<$Res>
    implements $HomeResultDtoCopyWith<$Res> {
  _$HomeResultDtoCopyWithImpl(this._self, this._then);

  final HomeResultDto _self;
  final $Res Function(HomeResultDto) _then;

/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topics = null,Object? topicsList = null,Object? recommended = null,Object? hot = null,Object? latest = null,Object? finished = null,Object? rankDay = null,Object? rankWeek = null,Object? rankMonth = null,Object? banners = null,}) {
  return _then(_self.copyWith(
topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as HomeTopicSectionDto,topicsList: null == topicsList ? _self.topicsList : topicsList // ignore: cast_nullable_to_non_nullable
as HomeTopicSectionDto,recommended: null == recommended ? _self.recommended : recommended // ignore: cast_nullable_to_non_nullable
as HomeRecommendedSectionDto,hot: null == hot ? _self.hot : hot // ignore: cast_nullable_to_non_nullable
as List<HomeUpdateDto>,latest: null == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as List<HomeUpdateDto>,finished: null == finished ? _self.finished : finished // ignore: cast_nullable_to_non_nullable
as HomeComicSectionDto,rankDay: null == rankDay ? _self.rankDay : rankDay // ignore: cast_nullable_to_non_nullable
as HomeRankSectionDto,rankWeek: null == rankWeek ? _self.rankWeek : rankWeek // ignore: cast_nullable_to_non_nullable
as HomeRankSectionDto,rankMonth: null == rankMonth ? _self.rankMonth : rankMonth // ignore: cast_nullable_to_non_nullable
as HomeRankSectionDto,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<HomeBannerDto>,
  ));
}
/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeTopicSectionDtoCopyWith<$Res> get topics {
  
  return $HomeTopicSectionDtoCopyWith<$Res>(_self.topics, (value) {
    return _then(_self.copyWith(topics: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeTopicSectionDtoCopyWith<$Res> get topicsList {
  
  return $HomeTopicSectionDtoCopyWith<$Res>(_self.topicsList, (value) {
    return _then(_self.copyWith(topicsList: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRecommendedSectionDtoCopyWith<$Res> get recommended {
  
  return $HomeRecommendedSectionDtoCopyWith<$Res>(_self.recommended, (value) {
    return _then(_self.copyWith(recommended: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicSectionDtoCopyWith<$Res> get finished {
  
  return $HomeComicSectionDtoCopyWith<$Res>(_self.finished, (value) {
    return _then(_self.copyWith(finished: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<$Res> get rankDay {
  
  return $HomeRankSectionDtoCopyWith<$Res>(_self.rankDay, (value) {
    return _then(_self.copyWith(rankDay: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<$Res> get rankWeek {
  
  return $HomeRankSectionDtoCopyWith<$Res>(_self.rankWeek, (value) {
    return _then(_self.copyWith(rankWeek: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<$Res> get rankMonth {
  
  return $HomeRankSectionDtoCopyWith<$Res>(_self.rankMonth, (value) {
    return _then(_self.copyWith(rankMonth: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeResultDto].
extension HomeResultDtoPatterns on HomeResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeResultDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeTopicSectionDto topics,  HomeTopicSectionDto topicsList, @JsonKey(name: 'recComics')  HomeRecommendedSectionDto recommended, @JsonKey(name: 'hotComics')  List<HomeUpdateDto> hot, @JsonKey(name: 'newComics')  List<HomeUpdateDto> latest, @JsonKey(name: 'finishComics')  HomeComicSectionDto finished, @JsonKey(name: 'rankDayComics')  HomeRankSectionDto rankDay, @JsonKey(name: 'rankWeekComics')  HomeRankSectionDto rankWeek, @JsonKey(name: 'rankMonthComics')  HomeRankSectionDto rankMonth,  List<HomeBannerDto> banners)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeResultDto() when $default != null:
return $default(_that.topics,_that.topicsList,_that.recommended,_that.hot,_that.latest,_that.finished,_that.rankDay,_that.rankWeek,_that.rankMonth,_that.banners);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeTopicSectionDto topics,  HomeTopicSectionDto topicsList, @JsonKey(name: 'recComics')  HomeRecommendedSectionDto recommended, @JsonKey(name: 'hotComics')  List<HomeUpdateDto> hot, @JsonKey(name: 'newComics')  List<HomeUpdateDto> latest, @JsonKey(name: 'finishComics')  HomeComicSectionDto finished, @JsonKey(name: 'rankDayComics')  HomeRankSectionDto rankDay, @JsonKey(name: 'rankWeekComics')  HomeRankSectionDto rankWeek, @JsonKey(name: 'rankMonthComics')  HomeRankSectionDto rankMonth,  List<HomeBannerDto> banners)  $default,) {final _that = this;
switch (_that) {
case _HomeResultDto():
return $default(_that.topics,_that.topicsList,_that.recommended,_that.hot,_that.latest,_that.finished,_that.rankDay,_that.rankWeek,_that.rankMonth,_that.banners);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeTopicSectionDto topics,  HomeTopicSectionDto topicsList, @JsonKey(name: 'recComics')  HomeRecommendedSectionDto recommended, @JsonKey(name: 'hotComics')  List<HomeUpdateDto> hot, @JsonKey(name: 'newComics')  List<HomeUpdateDto> latest, @JsonKey(name: 'finishComics')  HomeComicSectionDto finished, @JsonKey(name: 'rankDayComics')  HomeRankSectionDto rankDay, @JsonKey(name: 'rankWeekComics')  HomeRankSectionDto rankWeek, @JsonKey(name: 'rankMonthComics')  HomeRankSectionDto rankMonth,  List<HomeBannerDto> banners)?  $default,) {final _that = this;
switch (_that) {
case _HomeResultDto() when $default != null:
return $default(_that.topics,_that.topicsList,_that.recommended,_that.hot,_that.latest,_that.finished,_that.rankDay,_that.rankWeek,_that.rankMonth,_that.banners);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeResultDto implements HomeResultDto {
  const _HomeResultDto({required this.topics, required this.topicsList, @JsonKey(name: 'recComics') required this.recommended, @JsonKey(name: 'hotComics') required final  List<HomeUpdateDto> hot, @JsonKey(name: 'newComics') required final  List<HomeUpdateDto> latest, @JsonKey(name: 'finishComics') required this.finished, @JsonKey(name: 'rankDayComics') required this.rankDay, @JsonKey(name: 'rankWeekComics') required this.rankWeek, @JsonKey(name: 'rankMonthComics') required this.rankMonth, required final  List<HomeBannerDto> banners}): _hot = hot,_latest = latest,_banners = banners;
  factory _HomeResultDto.fromJson(Map<String, dynamic> json) => _$HomeResultDtoFromJson(json);

@override final  HomeTopicSectionDto topics;
@override final  HomeTopicSectionDto topicsList;
@override@JsonKey(name: 'recComics') final  HomeRecommendedSectionDto recommended;
 final  List<HomeUpdateDto> _hot;
@override@JsonKey(name: 'hotComics') List<HomeUpdateDto> get hot {
  if (_hot is EqualUnmodifiableListView) return _hot;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hot);
}

 final  List<HomeUpdateDto> _latest;
@override@JsonKey(name: 'newComics') List<HomeUpdateDto> get latest {
  if (_latest is EqualUnmodifiableListView) return _latest;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latest);
}

@override@JsonKey(name: 'finishComics') final  HomeComicSectionDto finished;
@override@JsonKey(name: 'rankDayComics') final  HomeRankSectionDto rankDay;
@override@JsonKey(name: 'rankWeekComics') final  HomeRankSectionDto rankWeek;
@override@JsonKey(name: 'rankMonthComics') final  HomeRankSectionDto rankMonth;
 final  List<HomeBannerDto> _banners;
@override List<HomeBannerDto> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}


/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeResultDtoCopyWith<_HomeResultDto> get copyWith => __$HomeResultDtoCopyWithImpl<_HomeResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeResultDto&&(identical(other.topics, topics) || other.topics == topics)&&(identical(other.topicsList, topicsList) || other.topicsList == topicsList)&&(identical(other.recommended, recommended) || other.recommended == recommended)&&const DeepCollectionEquality().equals(other._hot, _hot)&&const DeepCollectionEquality().equals(other._latest, _latest)&&(identical(other.finished, finished) || other.finished == finished)&&(identical(other.rankDay, rankDay) || other.rankDay == rankDay)&&(identical(other.rankWeek, rankWeek) || other.rankWeek == rankWeek)&&(identical(other.rankMonth, rankMonth) || other.rankMonth == rankMonth)&&const DeepCollectionEquality().equals(other._banners, _banners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topics,topicsList,recommended,const DeepCollectionEquality().hash(_hot),const DeepCollectionEquality().hash(_latest),finished,rankDay,rankWeek,rankMonth,const DeepCollectionEquality().hash(_banners));

@override
String toString() {
  return 'HomeResultDto(topics: $topics, topicsList: $topicsList, recommended: $recommended, hot: $hot, latest: $latest, finished: $finished, rankDay: $rankDay, rankWeek: $rankWeek, rankMonth: $rankMonth, banners: $banners)';
}


}

/// @nodoc
abstract mixin class _$HomeResultDtoCopyWith<$Res> implements $HomeResultDtoCopyWith<$Res> {
  factory _$HomeResultDtoCopyWith(_HomeResultDto value, $Res Function(_HomeResultDto) _then) = __$HomeResultDtoCopyWithImpl;
@override @useResult
$Res call({
 HomeTopicSectionDto topics, HomeTopicSectionDto topicsList,@JsonKey(name: 'recComics') HomeRecommendedSectionDto recommended,@JsonKey(name: 'hotComics') List<HomeUpdateDto> hot,@JsonKey(name: 'newComics') List<HomeUpdateDto> latest,@JsonKey(name: 'finishComics') HomeComicSectionDto finished,@JsonKey(name: 'rankDayComics') HomeRankSectionDto rankDay,@JsonKey(name: 'rankWeekComics') HomeRankSectionDto rankWeek,@JsonKey(name: 'rankMonthComics') HomeRankSectionDto rankMonth, List<HomeBannerDto> banners
});


@override $HomeTopicSectionDtoCopyWith<$Res> get topics;@override $HomeTopicSectionDtoCopyWith<$Res> get topicsList;@override $HomeRecommendedSectionDtoCopyWith<$Res> get recommended;@override $HomeComicSectionDtoCopyWith<$Res> get finished;@override $HomeRankSectionDtoCopyWith<$Res> get rankDay;@override $HomeRankSectionDtoCopyWith<$Res> get rankWeek;@override $HomeRankSectionDtoCopyWith<$Res> get rankMonth;

}
/// @nodoc
class __$HomeResultDtoCopyWithImpl<$Res>
    implements _$HomeResultDtoCopyWith<$Res> {
  __$HomeResultDtoCopyWithImpl(this._self, this._then);

  final _HomeResultDto _self;
  final $Res Function(_HomeResultDto) _then;

/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topics = null,Object? topicsList = null,Object? recommended = null,Object? hot = null,Object? latest = null,Object? finished = null,Object? rankDay = null,Object? rankWeek = null,Object? rankMonth = null,Object? banners = null,}) {
  return _then(_HomeResultDto(
topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as HomeTopicSectionDto,topicsList: null == topicsList ? _self.topicsList : topicsList // ignore: cast_nullable_to_non_nullable
as HomeTopicSectionDto,recommended: null == recommended ? _self.recommended : recommended // ignore: cast_nullable_to_non_nullable
as HomeRecommendedSectionDto,hot: null == hot ? _self._hot : hot // ignore: cast_nullable_to_non_nullable
as List<HomeUpdateDto>,latest: null == latest ? _self._latest : latest // ignore: cast_nullable_to_non_nullable
as List<HomeUpdateDto>,finished: null == finished ? _self.finished : finished // ignore: cast_nullable_to_non_nullable
as HomeComicSectionDto,rankDay: null == rankDay ? _self.rankDay : rankDay // ignore: cast_nullable_to_non_nullable
as HomeRankSectionDto,rankWeek: null == rankWeek ? _self.rankWeek : rankWeek // ignore: cast_nullable_to_non_nullable
as HomeRankSectionDto,rankMonth: null == rankMonth ? _self.rankMonth : rankMonth // ignore: cast_nullable_to_non_nullable
as HomeRankSectionDto,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<HomeBannerDto>,
  ));
}

/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeTopicSectionDtoCopyWith<$Res> get topics {
  
  return $HomeTopicSectionDtoCopyWith<$Res>(_self.topics, (value) {
    return _then(_self.copyWith(topics: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeTopicSectionDtoCopyWith<$Res> get topicsList {
  
  return $HomeTopicSectionDtoCopyWith<$Res>(_self.topicsList, (value) {
    return _then(_self.copyWith(topicsList: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRecommendedSectionDtoCopyWith<$Res> get recommended {
  
  return $HomeRecommendedSectionDtoCopyWith<$Res>(_self.recommended, (value) {
    return _then(_self.copyWith(recommended: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicSectionDtoCopyWith<$Res> get finished {
  
  return $HomeComicSectionDtoCopyWith<$Res>(_self.finished, (value) {
    return _then(_self.copyWith(finished: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<$Res> get rankDay {
  
  return $HomeRankSectionDtoCopyWith<$Res>(_self.rankDay, (value) {
    return _then(_self.copyWith(rankDay: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<$Res> get rankWeek {
  
  return $HomeRankSectionDtoCopyWith<$Res>(_self.rankWeek, (value) {
    return _then(_self.copyWith(rankWeek: value));
  });
}/// Create a copy of HomeResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<$Res> get rankMonth {
  
  return $HomeRankSectionDtoCopyWith<$Res>(_self.rankMonth, (value) {
    return _then(_self.copyWith(rankMonth: value));
  });
}
}


/// @nodoc
mixin _$HomeTopicSectionDto {

 List<HomeTopicDto> get list; int get total; int get limit; int get offset;
/// Create a copy of HomeTopicSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTopicSectionDtoCopyWith<HomeTopicSectionDto> get copyWith => _$HomeTopicSectionDtoCopyWithImpl<HomeTopicSectionDto>(this as HomeTopicSectionDto, _$identity);

  /// Serializes this HomeTopicSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTopicSectionDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,limit,offset);

@override
String toString() {
  return 'HomeTopicSectionDto(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $HomeTopicSectionDtoCopyWith<$Res>  {
  factory $HomeTopicSectionDtoCopyWith(HomeTopicSectionDto value, $Res Function(HomeTopicSectionDto) _then) = _$HomeTopicSectionDtoCopyWithImpl;
@useResult
$Res call({
 List<HomeTopicDto> list, int total, int limit, int offset
});




}
/// @nodoc
class _$HomeTopicSectionDtoCopyWithImpl<$Res>
    implements $HomeTopicSectionDtoCopyWith<$Res> {
  _$HomeTopicSectionDtoCopyWithImpl(this._self, this._then);

  final HomeTopicSectionDto _self;
  final $Res Function(HomeTopicSectionDto) _then;

/// Create a copy of HomeTopicSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<HomeTopicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeTopicSectionDto].
extension HomeTopicSectionDtoPatterns on HomeTopicSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeTopicSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeTopicSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeTopicSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeTopicSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeTopicSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeTopicSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HomeTopicDto> list,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeTopicSectionDto() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HomeTopicDto> list,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _HomeTopicSectionDto():
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HomeTopicDto> list,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _HomeTopicSectionDto() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeTopicSectionDto implements HomeTopicSectionDto {
  const _HomeTopicSectionDto({required final  List<HomeTopicDto> list, required this.total, required this.limit, required this.offset}): _list = list;
  factory _HomeTopicSectionDto.fromJson(Map<String, dynamic> json) => _$HomeTopicSectionDtoFromJson(json);

 final  List<HomeTopicDto> _list;
@override List<HomeTopicDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of HomeTopicSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTopicSectionDtoCopyWith<_HomeTopicSectionDto> get copyWith => __$HomeTopicSectionDtoCopyWithImpl<_HomeTopicSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeTopicSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTopicSectionDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,limit,offset);

@override
String toString() {
  return 'HomeTopicSectionDto(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$HomeTopicSectionDtoCopyWith<$Res> implements $HomeTopicSectionDtoCopyWith<$Res> {
  factory _$HomeTopicSectionDtoCopyWith(_HomeTopicSectionDto value, $Res Function(_HomeTopicSectionDto) _then) = __$HomeTopicSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 List<HomeTopicDto> list, int total, int limit, int offset
});




}
/// @nodoc
class __$HomeTopicSectionDtoCopyWithImpl<$Res>
    implements _$HomeTopicSectionDtoCopyWith<$Res> {
  __$HomeTopicSectionDtoCopyWithImpl(this._self, this._then);

  final _HomeTopicSectionDto _self;
  final $Res Function(_HomeTopicSectionDto) _then;

/// Create a copy of HomeTopicSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_HomeTopicSectionDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<HomeTopicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeTopicDto {

 String get title; String? get series; String get journal; String get cover; String get period; int get type; String get brief; String get pathWord; String get datetimeCreated;
/// Create a copy of HomeTopicDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeTopicDtoCopyWith<HomeTopicDto> get copyWith => _$HomeTopicDtoCopyWithImpl<HomeTopicDto>(this as HomeTopicDto, _$identity);

  /// Serializes this HomeTopicDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTopicDto&&(identical(other.title, title) || other.title == title)&&(identical(other.series, series) || other.series == series)&&(identical(other.journal, journal) || other.journal == journal)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.period, period) || other.period == period)&&(identical(other.type, type) || other.type == type)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,series,journal,cover,period,type,brief,pathWord,datetimeCreated);

@override
String toString() {
  return 'HomeTopicDto(title: $title, series: $series, journal: $journal, cover: $cover, period: $period, type: $type, brief: $brief, pathWord: $pathWord, datetimeCreated: $datetimeCreated)';
}


}

/// @nodoc
abstract mixin class $HomeTopicDtoCopyWith<$Res>  {
  factory $HomeTopicDtoCopyWith(HomeTopicDto value, $Res Function(HomeTopicDto) _then) = _$HomeTopicDtoCopyWithImpl;
@useResult
$Res call({
 String title, String? series, String journal, String cover, String period, int type, String brief, String pathWord, String datetimeCreated
});




}
/// @nodoc
class _$HomeTopicDtoCopyWithImpl<$Res>
    implements $HomeTopicDtoCopyWith<$Res> {
  _$HomeTopicDtoCopyWithImpl(this._self, this._then);

  final HomeTopicDto _self;
  final $Res Function(HomeTopicDto) _then;

/// Create a copy of HomeTopicDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? series = freezed,Object? journal = null,Object? cover = null,Object? period = null,Object? type = null,Object? brief = null,Object? pathWord = null,Object? datetimeCreated = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String?,journal: null == journal ? _self.journal : journal // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,datetimeCreated: null == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeTopicDto].
extension HomeTopicDtoPatterns on HomeTopicDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeTopicDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeTopicDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeTopicDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeTopicDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeTopicDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeTopicDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? series,  String journal,  String cover,  String period,  int type,  String brief,  String pathWord,  String datetimeCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeTopicDto() when $default != null:
return $default(_that.title,_that.series,_that.journal,_that.cover,_that.period,_that.type,_that.brief,_that.pathWord,_that.datetimeCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? series,  String journal,  String cover,  String period,  int type,  String brief,  String pathWord,  String datetimeCreated)  $default,) {final _that = this;
switch (_that) {
case _HomeTopicDto():
return $default(_that.title,_that.series,_that.journal,_that.cover,_that.period,_that.type,_that.brief,_that.pathWord,_that.datetimeCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? series,  String journal,  String cover,  String period,  int type,  String brief,  String pathWord,  String datetimeCreated)?  $default,) {final _that = this;
switch (_that) {
case _HomeTopicDto() when $default != null:
return $default(_that.title,_that.series,_that.journal,_that.cover,_that.period,_that.type,_that.brief,_that.pathWord,_that.datetimeCreated);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeTopicDto implements HomeTopicDto {
  const _HomeTopicDto({required this.title, this.series, required this.journal, required this.cover, required this.period, required this.type, this.brief = '', required this.pathWord, required this.datetimeCreated});
  factory _HomeTopicDto.fromJson(Map<String, dynamic> json) => _$HomeTopicDtoFromJson(json);

@override final  String title;
@override final  String? series;
@override final  String journal;
@override final  String cover;
@override final  String period;
@override final  int type;
@override@JsonKey() final  String brief;
@override final  String pathWord;
@override final  String datetimeCreated;

/// Create a copy of HomeTopicDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeTopicDtoCopyWith<_HomeTopicDto> get copyWith => __$HomeTopicDtoCopyWithImpl<_HomeTopicDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeTopicDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeTopicDto&&(identical(other.title, title) || other.title == title)&&(identical(other.series, series) || other.series == series)&&(identical(other.journal, journal) || other.journal == journal)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.period, period) || other.period == period)&&(identical(other.type, type) || other.type == type)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,series,journal,cover,period,type,brief,pathWord,datetimeCreated);

@override
String toString() {
  return 'HomeTopicDto(title: $title, series: $series, journal: $journal, cover: $cover, period: $period, type: $type, brief: $brief, pathWord: $pathWord, datetimeCreated: $datetimeCreated)';
}


}

/// @nodoc
abstract mixin class _$HomeTopicDtoCopyWith<$Res> implements $HomeTopicDtoCopyWith<$Res> {
  factory _$HomeTopicDtoCopyWith(_HomeTopicDto value, $Res Function(_HomeTopicDto) _then) = __$HomeTopicDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String? series, String journal, String cover, String period, int type, String brief, String pathWord, String datetimeCreated
});




}
/// @nodoc
class __$HomeTopicDtoCopyWithImpl<$Res>
    implements _$HomeTopicDtoCopyWith<$Res> {
  __$HomeTopicDtoCopyWithImpl(this._self, this._then);

  final _HomeTopicDto _self;
  final $Res Function(_HomeTopicDto) _then;

/// Create a copy of HomeTopicDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? series = freezed,Object? journal = null,Object? cover = null,Object? period = null,Object? type = null,Object? brief = null,Object? pathWord = null,Object? datetimeCreated = null,}) {
  return _then(_HomeTopicDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,series: freezed == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as String?,journal: null == journal ? _self.journal : journal // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,datetimeCreated: null == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeRecommendedSectionDto {

 List<HomeRecommendedItemDto> get list; int get total; int get limit; int get offset;
/// Create a copy of HomeRecommendedSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeRecommendedSectionDtoCopyWith<HomeRecommendedSectionDto> get copyWith => _$HomeRecommendedSectionDtoCopyWithImpl<HomeRecommendedSectionDto>(this as HomeRecommendedSectionDto, _$identity);

  /// Serializes this HomeRecommendedSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRecommendedSectionDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,limit,offset);

@override
String toString() {
  return 'HomeRecommendedSectionDto(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $HomeRecommendedSectionDtoCopyWith<$Res>  {
  factory $HomeRecommendedSectionDtoCopyWith(HomeRecommendedSectionDto value, $Res Function(HomeRecommendedSectionDto) _then) = _$HomeRecommendedSectionDtoCopyWithImpl;
@useResult
$Res call({
 List<HomeRecommendedItemDto> list, int total, int limit, int offset
});




}
/// @nodoc
class _$HomeRecommendedSectionDtoCopyWithImpl<$Res>
    implements $HomeRecommendedSectionDtoCopyWith<$Res> {
  _$HomeRecommendedSectionDtoCopyWithImpl(this._self, this._then);

  final HomeRecommendedSectionDto _self;
  final $Res Function(HomeRecommendedSectionDto) _then;

/// Create a copy of HomeRecommendedSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<HomeRecommendedItemDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeRecommendedSectionDto].
extension HomeRecommendedSectionDtoPatterns on HomeRecommendedSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeRecommendedSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeRecommendedSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeRecommendedSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeRecommendedSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeRecommendedSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeRecommendedSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HomeRecommendedItemDto> list,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeRecommendedSectionDto() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HomeRecommendedItemDto> list,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _HomeRecommendedSectionDto():
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HomeRecommendedItemDto> list,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _HomeRecommendedSectionDto() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeRecommendedSectionDto implements HomeRecommendedSectionDto {
  const _HomeRecommendedSectionDto({required final  List<HomeRecommendedItemDto> list, required this.total, required this.limit, required this.offset}): _list = list;
  factory _HomeRecommendedSectionDto.fromJson(Map<String, dynamic> json) => _$HomeRecommendedSectionDtoFromJson(json);

 final  List<HomeRecommendedItemDto> _list;
@override List<HomeRecommendedItemDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of HomeRecommendedSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeRecommendedSectionDtoCopyWith<_HomeRecommendedSectionDto> get copyWith => __$HomeRecommendedSectionDtoCopyWithImpl<_HomeRecommendedSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeRecommendedSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeRecommendedSectionDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,limit,offset);

@override
String toString() {
  return 'HomeRecommendedSectionDto(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$HomeRecommendedSectionDtoCopyWith<$Res> implements $HomeRecommendedSectionDtoCopyWith<$Res> {
  factory _$HomeRecommendedSectionDtoCopyWith(_HomeRecommendedSectionDto value, $Res Function(_HomeRecommendedSectionDto) _then) = __$HomeRecommendedSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 List<HomeRecommendedItemDto> list, int total, int limit, int offset
});




}
/// @nodoc
class __$HomeRecommendedSectionDtoCopyWithImpl<$Res>
    implements _$HomeRecommendedSectionDtoCopyWith<$Res> {
  __$HomeRecommendedSectionDtoCopyWithImpl(this._self, this._then);

  final _HomeRecommendedSectionDto _self;
  final $Res Function(_HomeRecommendedSectionDto) _then;

/// Create a copy of HomeRecommendedSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_HomeRecommendedSectionDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<HomeRecommendedItemDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeRecommendedItemDto {

 int get type; HomeComicDto get comic;
/// Create a copy of HomeRecommendedItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeRecommendedItemDtoCopyWith<HomeRecommendedItemDto> get copyWith => _$HomeRecommendedItemDtoCopyWithImpl<HomeRecommendedItemDto>(this as HomeRecommendedItemDto, _$identity);

  /// Serializes this HomeRecommendedItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRecommendedItemDto&&(identical(other.type, type) || other.type == type)&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,comic);

@override
String toString() {
  return 'HomeRecommendedItemDto(type: $type, comic: $comic)';
}


}

/// @nodoc
abstract mixin class $HomeRecommendedItemDtoCopyWith<$Res>  {
  factory $HomeRecommendedItemDtoCopyWith(HomeRecommendedItemDto value, $Res Function(HomeRecommendedItemDto) _then) = _$HomeRecommendedItemDtoCopyWithImpl;
@useResult
$Res call({
 int type, HomeComicDto comic
});


$HomeComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class _$HomeRecommendedItemDtoCopyWithImpl<$Res>
    implements $HomeRecommendedItemDtoCopyWith<$Res> {
  _$HomeRecommendedItemDtoCopyWithImpl(this._self, this._then);

  final HomeRecommendedItemDto _self;
  final $Res Function(HomeRecommendedItemDto) _then;

/// Create a copy of HomeRecommendedItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? comic = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as HomeComicDto,
  ));
}
/// Create a copy of HomeRecommendedItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<$Res> get comic {
  
  return $HomeComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeRecommendedItemDto].
extension HomeRecommendedItemDtoPatterns on HomeRecommendedItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeRecommendedItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeRecommendedItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeRecommendedItemDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeRecommendedItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeRecommendedItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeRecommendedItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int type,  HomeComicDto comic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeRecommendedItemDto() when $default != null:
return $default(_that.type,_that.comic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int type,  HomeComicDto comic)  $default,) {final _that = this;
switch (_that) {
case _HomeRecommendedItemDto():
return $default(_that.type,_that.comic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int type,  HomeComicDto comic)?  $default,) {final _that = this;
switch (_that) {
case _HomeRecommendedItemDto() when $default != null:
return $default(_that.type,_that.comic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeRecommendedItemDto implements HomeRecommendedItemDto {
  const _HomeRecommendedItemDto({required this.type, required this.comic});
  factory _HomeRecommendedItemDto.fromJson(Map<String, dynamic> json) => _$HomeRecommendedItemDtoFromJson(json);

@override final  int type;
@override final  HomeComicDto comic;

/// Create a copy of HomeRecommendedItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeRecommendedItemDtoCopyWith<_HomeRecommendedItemDto> get copyWith => __$HomeRecommendedItemDtoCopyWithImpl<_HomeRecommendedItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeRecommendedItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeRecommendedItemDto&&(identical(other.type, type) || other.type == type)&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,comic);

@override
String toString() {
  return 'HomeRecommendedItemDto(type: $type, comic: $comic)';
}


}

/// @nodoc
abstract mixin class _$HomeRecommendedItemDtoCopyWith<$Res> implements $HomeRecommendedItemDtoCopyWith<$Res> {
  factory _$HomeRecommendedItemDtoCopyWith(_HomeRecommendedItemDto value, $Res Function(_HomeRecommendedItemDto) _then) = __$HomeRecommendedItemDtoCopyWithImpl;
@override @useResult
$Res call({
 int type, HomeComicDto comic
});


@override $HomeComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class __$HomeRecommendedItemDtoCopyWithImpl<$Res>
    implements _$HomeRecommendedItemDtoCopyWith<$Res> {
  __$HomeRecommendedItemDtoCopyWithImpl(this._self, this._then);

  final _HomeRecommendedItemDto _self;
  final $Res Function(_HomeRecommendedItemDto) _then;

/// Create a copy of HomeRecommendedItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? comic = null,}) {
  return _then(_HomeRecommendedItemDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as HomeComicDto,
  ));
}

/// Create a copy of HomeRecommendedItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<$Res> get comic {
  
  return $HomeComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$HomeUpdateDto {

 String get name; String get datetimeCreated; HomeComicDto get comic;
/// Create a copy of HomeUpdateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUpdateDtoCopyWith<HomeUpdateDto> get copyWith => _$HomeUpdateDtoCopyWithImpl<HomeUpdateDto>(this as HomeUpdateDto, _$identity);

  /// Serializes this HomeUpdateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUpdateDto&&(identical(other.name, name) || other.name == name)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated)&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,datetimeCreated,comic);

@override
String toString() {
  return 'HomeUpdateDto(name: $name, datetimeCreated: $datetimeCreated, comic: $comic)';
}


}

/// @nodoc
abstract mixin class $HomeUpdateDtoCopyWith<$Res>  {
  factory $HomeUpdateDtoCopyWith(HomeUpdateDto value, $Res Function(HomeUpdateDto) _then) = _$HomeUpdateDtoCopyWithImpl;
@useResult
$Res call({
 String name, String datetimeCreated, HomeComicDto comic
});


$HomeComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class _$HomeUpdateDtoCopyWithImpl<$Res>
    implements $HomeUpdateDtoCopyWith<$Res> {
  _$HomeUpdateDtoCopyWithImpl(this._self, this._then);

  final HomeUpdateDto _self;
  final $Res Function(HomeUpdateDto) _then;

/// Create a copy of HomeUpdateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? datetimeCreated = null,Object? comic = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,datetimeCreated: null == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String,comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as HomeComicDto,
  ));
}
/// Create a copy of HomeUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<$Res> get comic {
  
  return $HomeComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeUpdateDto].
extension HomeUpdateDtoPatterns on HomeUpdateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeUpdateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeUpdateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeUpdateDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeUpdateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeUpdateDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeUpdateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String datetimeCreated,  HomeComicDto comic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeUpdateDto() when $default != null:
return $default(_that.name,_that.datetimeCreated,_that.comic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String datetimeCreated,  HomeComicDto comic)  $default,) {final _that = this;
switch (_that) {
case _HomeUpdateDto():
return $default(_that.name,_that.datetimeCreated,_that.comic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String datetimeCreated,  HomeComicDto comic)?  $default,) {final _that = this;
switch (_that) {
case _HomeUpdateDto() when $default != null:
return $default(_that.name,_that.datetimeCreated,_that.comic);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeUpdateDto implements HomeUpdateDto {
  const _HomeUpdateDto({required this.name, required this.datetimeCreated, required this.comic});
  factory _HomeUpdateDto.fromJson(Map<String, dynamic> json) => _$HomeUpdateDtoFromJson(json);

@override final  String name;
@override final  String datetimeCreated;
@override final  HomeComicDto comic;

/// Create a copy of HomeUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeUpdateDtoCopyWith<_HomeUpdateDto> get copyWith => __$HomeUpdateDtoCopyWithImpl<_HomeUpdateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeUpdateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeUpdateDto&&(identical(other.name, name) || other.name == name)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated)&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,datetimeCreated,comic);

@override
String toString() {
  return 'HomeUpdateDto(name: $name, datetimeCreated: $datetimeCreated, comic: $comic)';
}


}

/// @nodoc
abstract mixin class _$HomeUpdateDtoCopyWith<$Res> implements $HomeUpdateDtoCopyWith<$Res> {
  factory _$HomeUpdateDtoCopyWith(_HomeUpdateDto value, $Res Function(_HomeUpdateDto) _then) = __$HomeUpdateDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String datetimeCreated, HomeComicDto comic
});


@override $HomeComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class __$HomeUpdateDtoCopyWithImpl<$Res>
    implements _$HomeUpdateDtoCopyWith<$Res> {
  __$HomeUpdateDtoCopyWithImpl(this._self, this._then);

  final _HomeUpdateDto _self;
  final $Res Function(_HomeUpdateDto) _then;

/// Create a copy of HomeUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? datetimeCreated = null,Object? comic = null,}) {
  return _then(_HomeUpdateDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,datetimeCreated: null == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String,comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as HomeComicDto,
  ));
}

/// Create a copy of HomeUpdateDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<$Res> get comic {
  
  return $HomeComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$HomeComicSectionDto {

 String get name; String get pathWord; String get type; List<HomeComicDto> get list; int get total; int get limit; int get offset;
/// Create a copy of HomeComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeComicSectionDtoCopyWith<HomeComicSectionDto> get copyWith => _$HomeComicSectionDtoCopyWithImpl<HomeComicSectionDto>(this as HomeComicSectionDto, _$identity);

  /// Serializes this HomeComicSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeComicSectionDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord,type,const DeepCollectionEquality().hash(list),total,limit,offset);

@override
String toString() {
  return 'HomeComicSectionDto(name: $name, pathWord: $pathWord, type: $type, list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $HomeComicSectionDtoCopyWith<$Res>  {
  factory $HomeComicSectionDtoCopyWith(HomeComicSectionDto value, $Res Function(HomeComicSectionDto) _then) = _$HomeComicSectionDtoCopyWithImpl;
@useResult
$Res call({
 String name, String pathWord, String type, List<HomeComicDto> list, int total, int limit, int offset
});




}
/// @nodoc
class _$HomeComicSectionDtoCopyWithImpl<$Res>
    implements $HomeComicSectionDtoCopyWith<$Res> {
  _$HomeComicSectionDtoCopyWithImpl(this._self, this._then);

  final HomeComicSectionDto _self;
  final $Res Function(HomeComicSectionDto) _then;

/// Create a copy of HomeComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pathWord = null,Object? type = null,Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<HomeComicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeComicSectionDto].
extension HomeComicSectionDtoPatterns on HomeComicSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeComicSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeComicSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeComicSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeComicSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeComicSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeComicSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String pathWord,  String type,  List<HomeComicDto> list,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeComicSectionDto() when $default != null:
return $default(_that.name,_that.pathWord,_that.type,_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String pathWord,  String type,  List<HomeComicDto> list,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _HomeComicSectionDto():
return $default(_that.name,_that.pathWord,_that.type,_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String pathWord,  String type,  List<HomeComicDto> list,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _HomeComicSectionDto() when $default != null:
return $default(_that.name,_that.pathWord,_that.type,_that.list,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeComicSectionDto implements HomeComicSectionDto {
  const _HomeComicSectionDto({required this.name, required this.pathWord, required this.type, required final  List<HomeComicDto> list, required this.total, required this.limit, required this.offset}): _list = list;
  factory _HomeComicSectionDto.fromJson(Map<String, dynamic> json) => _$HomeComicSectionDtoFromJson(json);

@override final  String name;
@override final  String pathWord;
@override final  String type;
 final  List<HomeComicDto> _list;
@override List<HomeComicDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of HomeComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeComicSectionDtoCopyWith<_HomeComicSectionDto> get copyWith => __$HomeComicSectionDtoCopyWithImpl<_HomeComicSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeComicSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeComicSectionDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord,type,const DeepCollectionEquality().hash(_list),total,limit,offset);

@override
String toString() {
  return 'HomeComicSectionDto(name: $name, pathWord: $pathWord, type: $type, list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$HomeComicSectionDtoCopyWith<$Res> implements $HomeComicSectionDtoCopyWith<$Res> {
  factory _$HomeComicSectionDtoCopyWith(_HomeComicSectionDto value, $Res Function(_HomeComicSectionDto) _then) = __$HomeComicSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String pathWord, String type, List<HomeComicDto> list, int total, int limit, int offset
});




}
/// @nodoc
class __$HomeComicSectionDtoCopyWithImpl<$Res>
    implements _$HomeComicSectionDtoCopyWith<$Res> {
  __$HomeComicSectionDtoCopyWithImpl(this._self, this._then);

  final _HomeComicSectionDto _self;
  final $Res Function(_HomeComicSectionDto) _then;

/// Create a copy of HomeComicSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pathWord = null,Object? type = null,Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_HomeComicSectionDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<HomeComicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeRankSectionDto {

 List<HomeRankItemDto> get list; int get total; int get limit; int get offset;
/// Create a copy of HomeRankSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeRankSectionDtoCopyWith<HomeRankSectionDto> get copyWith => _$HomeRankSectionDtoCopyWithImpl<HomeRankSectionDto>(this as HomeRankSectionDto, _$identity);

  /// Serializes this HomeRankSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRankSectionDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total,limit,offset);

@override
String toString() {
  return 'HomeRankSectionDto(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $HomeRankSectionDtoCopyWith<$Res>  {
  factory $HomeRankSectionDtoCopyWith(HomeRankSectionDto value, $Res Function(HomeRankSectionDto) _then) = _$HomeRankSectionDtoCopyWithImpl;
@useResult
$Res call({
 List<HomeRankItemDto> list, int total, int limit, int offset
});




}
/// @nodoc
class _$HomeRankSectionDtoCopyWithImpl<$Res>
    implements $HomeRankSectionDtoCopyWith<$Res> {
  _$HomeRankSectionDtoCopyWithImpl(this._self, this._then);

  final HomeRankSectionDto _self;
  final $Res Function(HomeRankSectionDto) _then;

/// Create a copy of HomeRankSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<HomeRankItemDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeRankSectionDto].
extension HomeRankSectionDtoPatterns on HomeRankSectionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeRankSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeRankSectionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeRankSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeRankSectionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeRankSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeRankSectionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HomeRankItemDto> list,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeRankSectionDto() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HomeRankItemDto> list,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _HomeRankSectionDto():
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HomeRankItemDto> list,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _HomeRankSectionDto() when $default != null:
return $default(_that.list,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeRankSectionDto implements HomeRankSectionDto {
  const _HomeRankSectionDto({required final  List<HomeRankItemDto> list, required this.total, required this.limit, required this.offset}): _list = list;
  factory _HomeRankSectionDto.fromJson(Map<String, dynamic> json) => _$HomeRankSectionDtoFromJson(json);

 final  List<HomeRankItemDto> _list;
@override List<HomeRankItemDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of HomeRankSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeRankSectionDtoCopyWith<_HomeRankSectionDto> get copyWith => __$HomeRankSectionDtoCopyWithImpl<_HomeRankSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeRankSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeRankSectionDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total,limit,offset);

@override
String toString() {
  return 'HomeRankSectionDto(list: $list, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$HomeRankSectionDtoCopyWith<$Res> implements $HomeRankSectionDtoCopyWith<$Res> {
  factory _$HomeRankSectionDtoCopyWith(_HomeRankSectionDto value, $Res Function(_HomeRankSectionDto) _then) = __$HomeRankSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 List<HomeRankItemDto> list, int total, int limit, int offset
});




}
/// @nodoc
class __$HomeRankSectionDtoCopyWithImpl<$Res>
    implements _$HomeRankSectionDtoCopyWith<$Res> {
  __$HomeRankSectionDtoCopyWithImpl(this._self, this._then);

  final _HomeRankSectionDto _self;
  final $Res Function(_HomeRankSectionDto) _then;

/// Create a copy of HomeRankSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_HomeRankSectionDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<HomeRankItemDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HomeRankItemDto {

 HomeComicDto get comic; int get sort; int get sortLast; int get riseSort; int get riseNum; int get popular; int get dateType;
/// Create a copy of HomeRankItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeRankItemDtoCopyWith<HomeRankItemDto> get copyWith => _$HomeRankItemDtoCopyWithImpl<HomeRankItemDto>(this as HomeRankItemDto, _$identity);

  /// Serializes this HomeRankItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRankItemDto&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.sortLast, sortLast) || other.sortLast == sortLast)&&(identical(other.riseSort, riseSort) || other.riseSort == riseSort)&&(identical(other.riseNum, riseNum) || other.riseNum == riseNum)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.dateType, dateType) || other.dateType == dateType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comic,sort,sortLast,riseSort,riseNum,popular,dateType);

@override
String toString() {
  return 'HomeRankItemDto(comic: $comic, sort: $sort, sortLast: $sortLast, riseSort: $riseSort, riseNum: $riseNum, popular: $popular, dateType: $dateType)';
}


}

/// @nodoc
abstract mixin class $HomeRankItemDtoCopyWith<$Res>  {
  factory $HomeRankItemDtoCopyWith(HomeRankItemDto value, $Res Function(HomeRankItemDto) _then) = _$HomeRankItemDtoCopyWithImpl;
@useResult
$Res call({
 HomeComicDto comic, int sort, int sortLast, int riseSort, int riseNum, int popular, int dateType
});


$HomeComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class _$HomeRankItemDtoCopyWithImpl<$Res>
    implements $HomeRankItemDtoCopyWith<$Res> {
  _$HomeRankItemDtoCopyWithImpl(this._self, this._then);

  final HomeRankItemDto _self;
  final $Res Function(HomeRankItemDto) _then;

/// Create a copy of HomeRankItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comic = null,Object? sort = null,Object? sortLast = null,Object? riseSort = null,Object? riseNum = null,Object? popular = null,Object? dateType = null,}) {
  return _then(_self.copyWith(
comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as HomeComicDto,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,sortLast: null == sortLast ? _self.sortLast : sortLast // ignore: cast_nullable_to_non_nullable
as int,riseSort: null == riseSort ? _self.riseSort : riseSort // ignore: cast_nullable_to_non_nullable
as int,riseNum: null == riseNum ? _self.riseNum : riseNum // ignore: cast_nullable_to_non_nullable
as int,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HomeRankItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<$Res> get comic {
  
  return $HomeComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeRankItemDto].
extension HomeRankItemDtoPatterns on HomeRankItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeRankItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeRankItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeRankItemDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeRankItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeRankItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeRankItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeComicDto comic,  int sort,  int sortLast,  int riseSort,  int riseNum,  int popular,  int dateType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeRankItemDto() when $default != null:
return $default(_that.comic,_that.sort,_that.sortLast,_that.riseSort,_that.riseNum,_that.popular,_that.dateType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeComicDto comic,  int sort,  int sortLast,  int riseSort,  int riseNum,  int popular,  int dateType)  $default,) {final _that = this;
switch (_that) {
case _HomeRankItemDto():
return $default(_that.comic,_that.sort,_that.sortLast,_that.riseSort,_that.riseNum,_that.popular,_that.dateType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeComicDto comic,  int sort,  int sortLast,  int riseSort,  int riseNum,  int popular,  int dateType)?  $default,) {final _that = this;
switch (_that) {
case _HomeRankItemDto() when $default != null:
return $default(_that.comic,_that.sort,_that.sortLast,_that.riseSort,_that.riseNum,_that.popular,_that.dateType);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeRankItemDto implements HomeRankItemDto {
  const _HomeRankItemDto({required this.comic, required this.sort, required this.sortLast, required this.riseSort, required this.riseNum, required this.popular, required this.dateType});
  factory _HomeRankItemDto.fromJson(Map<String, dynamic> json) => _$HomeRankItemDtoFromJson(json);

@override final  HomeComicDto comic;
@override final  int sort;
@override final  int sortLast;
@override final  int riseSort;
@override final  int riseNum;
@override final  int popular;
@override final  int dateType;

/// Create a copy of HomeRankItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeRankItemDtoCopyWith<_HomeRankItemDto> get copyWith => __$HomeRankItemDtoCopyWithImpl<_HomeRankItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeRankItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeRankItemDto&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.sortLast, sortLast) || other.sortLast == sortLast)&&(identical(other.riseSort, riseSort) || other.riseSort == riseSort)&&(identical(other.riseNum, riseNum) || other.riseNum == riseNum)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.dateType, dateType) || other.dateType == dateType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comic,sort,sortLast,riseSort,riseNum,popular,dateType);

@override
String toString() {
  return 'HomeRankItemDto(comic: $comic, sort: $sort, sortLast: $sortLast, riseSort: $riseSort, riseNum: $riseNum, popular: $popular, dateType: $dateType)';
}


}

/// @nodoc
abstract mixin class _$HomeRankItemDtoCopyWith<$Res> implements $HomeRankItemDtoCopyWith<$Res> {
  factory _$HomeRankItemDtoCopyWith(_HomeRankItemDto value, $Res Function(_HomeRankItemDto) _then) = __$HomeRankItemDtoCopyWithImpl;
@override @useResult
$Res call({
 HomeComicDto comic, int sort, int sortLast, int riseSort, int riseNum, int popular, int dateType
});


@override $HomeComicDtoCopyWith<$Res> get comic;

}
/// @nodoc
class __$HomeRankItemDtoCopyWithImpl<$Res>
    implements _$HomeRankItemDtoCopyWith<$Res> {
  __$HomeRankItemDtoCopyWithImpl(this._self, this._then);

  final _HomeRankItemDto _self;
  final $Res Function(_HomeRankItemDto) _then;

/// Create a copy of HomeRankItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comic = null,Object? sort = null,Object? sortLast = null,Object? riseSort = null,Object? riseNum = null,Object? popular = null,Object? dateType = null,}) {
  return _then(_HomeRankItemDto(
comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as HomeComicDto,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as int,sortLast: null == sortLast ? _self.sortLast : sortLast // ignore: cast_nullable_to_non_nullable
as int,riseSort: null == riseSort ? _self.riseSort : riseSort // ignore: cast_nullable_to_non_nullable
as int,riseNum: null == riseNum ? _self.riseNum : riseNum // ignore: cast_nullable_to_non_nullable
as int,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeRankItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<$Res> get comic {
  
  return $HomeComicDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$HomeComicDto {

 String get name; String get pathWord; String get cover;@JsonKey(name: 'author') List<NamedPathDto> get authors; String get authorAlias; int get popular; String get datetimeUpdated; String get lastChapterName; List<NamedPathDto> get females; List<NamedPathDto> get males;@JsonKey(name: 'theme') List<NamedPathDto> get themes; Object? get freeType;
/// Create a copy of HomeComicDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeComicDtoCopyWith<HomeComicDto> get copyWith => _$HomeComicDtoCopyWithImpl<HomeComicDto>(this as HomeComicDto, _$identity);

  /// Serializes this HomeComicDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeComicDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.authorAlias, authorAlias) || other.authorAlias == authorAlias)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&(identical(other.lastChapterName, lastChapterName) || other.lastChapterName == lastChapterName)&&const DeepCollectionEquality().equals(other.females, females)&&const DeepCollectionEquality().equals(other.males, males)&&const DeepCollectionEquality().equals(other.themes, themes)&&const DeepCollectionEquality().equals(other.freeType, freeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord,cover,const DeepCollectionEquality().hash(authors),authorAlias,popular,datetimeUpdated,lastChapterName,const DeepCollectionEquality().hash(females),const DeepCollectionEquality().hash(males),const DeepCollectionEquality().hash(themes),const DeepCollectionEquality().hash(freeType));

@override
String toString() {
  return 'HomeComicDto(name: $name, pathWord: $pathWord, cover: $cover, authors: $authors, authorAlias: $authorAlias, popular: $popular, datetimeUpdated: $datetimeUpdated, lastChapterName: $lastChapterName, females: $females, males: $males, themes: $themes, freeType: $freeType)';
}


}

/// @nodoc
abstract mixin class $HomeComicDtoCopyWith<$Res>  {
  factory $HomeComicDtoCopyWith(HomeComicDto value, $Res Function(HomeComicDto) _then) = _$HomeComicDtoCopyWithImpl;
@useResult
$Res call({
 String name, String pathWord, String cover,@JsonKey(name: 'author') List<NamedPathDto> authors, String authorAlias, int popular, String datetimeUpdated, String lastChapterName, List<NamedPathDto> females, List<NamedPathDto> males,@JsonKey(name: 'theme') List<NamedPathDto> themes, Object? freeType
});




}
/// @nodoc
class _$HomeComicDtoCopyWithImpl<$Res>
    implements $HomeComicDtoCopyWith<$Res> {
  _$HomeComicDtoCopyWithImpl(this._self, this._then);

  final HomeComicDto _self;
  final $Res Function(HomeComicDto) _then;

/// Create a copy of HomeComicDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pathWord = null,Object? cover = null,Object? authors = null,Object? authorAlias = null,Object? popular = null,Object? datetimeUpdated = null,Object? lastChapterName = null,Object? females = null,Object? males = null,Object? themes = null,Object? freeType = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,authorAlias: null == authorAlias ? _self.authorAlias : authorAlias // ignore: cast_nullable_to_non_nullable
as String,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,datetimeUpdated: null == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String,lastChapterName: null == lastChapterName ? _self.lastChapterName : lastChapterName // ignore: cast_nullable_to_non_nullable
as String,females: null == females ? _self.females : females // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,males: null == males ? _self.males : males // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,freeType: freezed == freeType ? _self.freeType : freeType ,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeComicDto].
extension HomeComicDtoPatterns on HomeComicDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeComicDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeComicDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeComicDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeComicDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeComicDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeComicDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String pathWord,  String cover, @JsonKey(name: 'author')  List<NamedPathDto> authors,  String authorAlias,  int popular,  String datetimeUpdated,  String lastChapterName,  List<NamedPathDto> females,  List<NamedPathDto> males, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  Object? freeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeComicDto() when $default != null:
return $default(_that.name,_that.pathWord,_that.cover,_that.authors,_that.authorAlias,_that.popular,_that.datetimeUpdated,_that.lastChapterName,_that.females,_that.males,_that.themes,_that.freeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String pathWord,  String cover, @JsonKey(name: 'author')  List<NamedPathDto> authors,  String authorAlias,  int popular,  String datetimeUpdated,  String lastChapterName,  List<NamedPathDto> females,  List<NamedPathDto> males, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  Object? freeType)  $default,) {final _that = this;
switch (_that) {
case _HomeComicDto():
return $default(_that.name,_that.pathWord,_that.cover,_that.authors,_that.authorAlias,_that.popular,_that.datetimeUpdated,_that.lastChapterName,_that.females,_that.males,_that.themes,_that.freeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String pathWord,  String cover, @JsonKey(name: 'author')  List<NamedPathDto> authors,  String authorAlias,  int popular,  String datetimeUpdated,  String lastChapterName,  List<NamedPathDto> females,  List<NamedPathDto> males, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  Object? freeType)?  $default,) {final _that = this;
switch (_that) {
case _HomeComicDto() when $default != null:
return $default(_that.name,_that.pathWord,_that.cover,_that.authors,_that.authorAlias,_that.popular,_that.datetimeUpdated,_that.lastChapterName,_that.females,_that.males,_that.themes,_that.freeType);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeComicDto implements HomeComicDto {
  const _HomeComicDto({required this.name, required this.pathWord, required this.cover, @JsonKey(name: 'author') final  List<NamedPathDto> authors = const [], this.authorAlias = '', this.popular = 0, this.datetimeUpdated = '', this.lastChapterName = '', final  List<NamedPathDto> females = const [], final  List<NamedPathDto> males = const [], @JsonKey(name: 'theme') final  List<NamedPathDto> themes = const [], this.freeType}): _authors = authors,_females = females,_males = males,_themes = themes;
  factory _HomeComicDto.fromJson(Map<String, dynamic> json) => _$HomeComicDtoFromJson(json);

@override final  String name;
@override final  String pathWord;
@override final  String cover;
 final  List<NamedPathDto> _authors;
@override@JsonKey(name: 'author') List<NamedPathDto> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override@JsonKey() final  String authorAlias;
@override@JsonKey() final  int popular;
@override@JsonKey() final  String datetimeUpdated;
@override@JsonKey() final  String lastChapterName;
 final  List<NamedPathDto> _females;
@override@JsonKey() List<NamedPathDto> get females {
  if (_females is EqualUnmodifiableListView) return _females;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_females);
}

 final  List<NamedPathDto> _males;
@override@JsonKey() List<NamedPathDto> get males {
  if (_males is EqualUnmodifiableListView) return _males;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_males);
}

 final  List<NamedPathDto> _themes;
@override@JsonKey(name: 'theme') List<NamedPathDto> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

@override final  Object? freeType;

/// Create a copy of HomeComicDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeComicDtoCopyWith<_HomeComicDto> get copyWith => __$HomeComicDtoCopyWithImpl<_HomeComicDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeComicDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeComicDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.cover, cover) || other.cover == cover)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.authorAlias, authorAlias) || other.authorAlias == authorAlias)&&(identical(other.popular, popular) || other.popular == popular)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&(identical(other.lastChapterName, lastChapterName) || other.lastChapterName == lastChapterName)&&const DeepCollectionEquality().equals(other._females, _females)&&const DeepCollectionEquality().equals(other._males, _males)&&const DeepCollectionEquality().equals(other._themes, _themes)&&const DeepCollectionEquality().equals(other.freeType, freeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord,cover,const DeepCollectionEquality().hash(_authors),authorAlias,popular,datetimeUpdated,lastChapterName,const DeepCollectionEquality().hash(_females),const DeepCollectionEquality().hash(_males),const DeepCollectionEquality().hash(_themes),const DeepCollectionEquality().hash(freeType));

@override
String toString() {
  return 'HomeComicDto(name: $name, pathWord: $pathWord, cover: $cover, authors: $authors, authorAlias: $authorAlias, popular: $popular, datetimeUpdated: $datetimeUpdated, lastChapterName: $lastChapterName, females: $females, males: $males, themes: $themes, freeType: $freeType)';
}


}

/// @nodoc
abstract mixin class _$HomeComicDtoCopyWith<$Res> implements $HomeComicDtoCopyWith<$Res> {
  factory _$HomeComicDtoCopyWith(_HomeComicDto value, $Res Function(_HomeComicDto) _then) = __$HomeComicDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String pathWord, String cover,@JsonKey(name: 'author') List<NamedPathDto> authors, String authorAlias, int popular, String datetimeUpdated, String lastChapterName, List<NamedPathDto> females, List<NamedPathDto> males,@JsonKey(name: 'theme') List<NamedPathDto> themes, Object? freeType
});




}
/// @nodoc
class __$HomeComicDtoCopyWithImpl<$Res>
    implements _$HomeComicDtoCopyWith<$Res> {
  __$HomeComicDtoCopyWithImpl(this._self, this._then);

  final _HomeComicDto _self;
  final $Res Function(_HomeComicDto) _then;

/// Create a copy of HomeComicDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pathWord = null,Object? cover = null,Object? authors = null,Object? authorAlias = null,Object? popular = null,Object? datetimeUpdated = null,Object? lastChapterName = null,Object? females = null,Object? males = null,Object? themes = null,Object? freeType = freezed,}) {
  return _then(_HomeComicDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,authorAlias: null == authorAlias ? _self.authorAlias : authorAlias // ignore: cast_nullable_to_non_nullable
as String,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,datetimeUpdated: null == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String,lastChapterName: null == lastChapterName ? _self.lastChapterName : lastChapterName // ignore: cast_nullable_to_non_nullable
as String,females: null == females ? _self._females : females // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,males: null == males ? _self._males : males // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,freeType: freezed == freeType ? _self.freeType : freeType ,
  ));
}


}


/// @nodoc
mixin _$HomeBannerDto {

 String get cover; String get brief; int get type; String get outUuid; NamedPathDto? get comic;
/// Create a copy of HomeBannerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBannerDtoCopyWith<HomeBannerDto> get copyWith => _$HomeBannerDtoCopyWithImpl<HomeBannerDto>(this as HomeBannerDto, _$identity);

  /// Serializes this HomeBannerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBannerDto&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.type, type) || other.type == type)&&(identical(other.outUuid, outUuid) || other.outUuid == outUuid)&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cover,brief,type,outUuid,comic);

@override
String toString() {
  return 'HomeBannerDto(cover: $cover, brief: $brief, type: $type, outUuid: $outUuid, comic: $comic)';
}


}

/// @nodoc
abstract mixin class $HomeBannerDtoCopyWith<$Res>  {
  factory $HomeBannerDtoCopyWith(HomeBannerDto value, $Res Function(HomeBannerDto) _then) = _$HomeBannerDtoCopyWithImpl;
@useResult
$Res call({
 String cover, String brief, int type, String outUuid, NamedPathDto? comic
});


$NamedPathDtoCopyWith<$Res>? get comic;

}
/// @nodoc
class _$HomeBannerDtoCopyWithImpl<$Res>
    implements $HomeBannerDtoCopyWith<$Res> {
  _$HomeBannerDtoCopyWithImpl(this._self, this._then);

  final HomeBannerDto _self;
  final $Res Function(HomeBannerDto) _then;

/// Create a copy of HomeBannerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cover = null,Object? brief = null,Object? type = null,Object? outUuid = null,Object? comic = freezed,}) {
  return _then(_self.copyWith(
cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,outUuid: null == outUuid ? _self.outUuid : outUuid // ignore: cast_nullable_to_non_nullable
as String,comic: freezed == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as NamedPathDto?,
  ));
}
/// Create a copy of HomeBannerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedPathDtoCopyWith<$Res>? get comic {
    if (_self.comic == null) {
    return null;
  }

  return $NamedPathDtoCopyWith<$Res>(_self.comic!, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeBannerDto].
extension HomeBannerDtoPatterns on HomeBannerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeBannerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBannerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeBannerDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeBannerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeBannerDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeBannerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cover,  String brief,  int type,  String outUuid,  NamedPathDto? comic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeBannerDto() when $default != null:
return $default(_that.cover,_that.brief,_that.type,_that.outUuid,_that.comic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cover,  String brief,  int type,  String outUuid,  NamedPathDto? comic)  $default,) {final _that = this;
switch (_that) {
case _HomeBannerDto():
return $default(_that.cover,_that.brief,_that.type,_that.outUuid,_that.comic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cover,  String brief,  int type,  String outUuid,  NamedPathDto? comic)?  $default,) {final _that = this;
switch (_that) {
case _HomeBannerDto() when $default != null:
return $default(_that.cover,_that.brief,_that.type,_that.outUuid,_that.comic);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _HomeBannerDto implements HomeBannerDto {
  const _HomeBannerDto({required this.cover, this.brief = '', required this.type, required this.outUuid, this.comic});
  factory _HomeBannerDto.fromJson(Map<String, dynamic> json) => _$HomeBannerDtoFromJson(json);

@override final  String cover;
@override@JsonKey() final  String brief;
@override final  int type;
@override final  String outUuid;
@override final  NamedPathDto? comic;

/// Create a copy of HomeBannerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBannerDtoCopyWith<_HomeBannerDto> get copyWith => __$HomeBannerDtoCopyWithImpl<_HomeBannerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeBannerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBannerDto&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.type, type) || other.type == type)&&(identical(other.outUuid, outUuid) || other.outUuid == outUuid)&&(identical(other.comic, comic) || other.comic == comic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cover,brief,type,outUuid,comic);

@override
String toString() {
  return 'HomeBannerDto(cover: $cover, brief: $brief, type: $type, outUuid: $outUuid, comic: $comic)';
}


}

/// @nodoc
abstract mixin class _$HomeBannerDtoCopyWith<$Res> implements $HomeBannerDtoCopyWith<$Res> {
  factory _$HomeBannerDtoCopyWith(_HomeBannerDto value, $Res Function(_HomeBannerDto) _then) = __$HomeBannerDtoCopyWithImpl;
@override @useResult
$Res call({
 String cover, String brief, int type, String outUuid, NamedPathDto? comic
});


@override $NamedPathDtoCopyWith<$Res>? get comic;

}
/// @nodoc
class __$HomeBannerDtoCopyWithImpl<$Res>
    implements _$HomeBannerDtoCopyWith<$Res> {
  __$HomeBannerDtoCopyWithImpl(this._self, this._then);

  final _HomeBannerDto _self;
  final $Res Function(_HomeBannerDto) _then;

/// Create a copy of HomeBannerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cover = null,Object? brief = null,Object? type = null,Object? outUuid = null,Object? comic = freezed,}) {
  return _then(_HomeBannerDto(
cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,outUuid: null == outUuid ? _self.outUuid : outUuid // ignore: cast_nullable_to_non_nullable
as String,comic: freezed == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as NamedPathDto?,
  ));
}

/// Create a copy of HomeBannerDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedPathDtoCopyWith<$Res>? get comic {
    if (_self.comic == null) {
    return null;
  }

  return $NamedPathDtoCopyWith<$Res>(_self.comic!, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$ComicPageResultDto {

 List<ComicDto> get list; int get total;
/// Create a copy of ComicPageResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicPageResultDtoCopyWith<ComicPageResultDto> get copyWith => _$ComicPageResultDtoCopyWithImpl<ComicPageResultDto>(this as ComicPageResultDto, _$identity);

  /// Serializes this ComicPageResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicPageResultDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total);

@override
String toString() {
  return 'ComicPageResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class $ComicPageResultDtoCopyWith<$Res>  {
  factory $ComicPageResultDtoCopyWith(ComicPageResultDto value, $Res Function(ComicPageResultDto) _then) = _$ComicPageResultDtoCopyWithImpl;
@useResult
$Res call({
 List<ComicDto> list, int total
});




}
/// @nodoc
class _$ComicPageResultDtoCopyWithImpl<$Res>
    implements $ComicPageResultDtoCopyWith<$Res> {
  _$ComicPageResultDtoCopyWithImpl(this._self, this._then);

  final ComicPageResultDto _self;
  final $Res Function(ComicPageResultDto) _then;

/// Create a copy of ComicPageResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ComicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicPageResultDto].
extension ComicPageResultDtoPatterns on ComicPageResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicPageResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicPageResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicPageResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ComicPageResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicPageResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComicPageResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ComicDto> list,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicPageResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ComicDto> list,  int total)  $default,) {final _that = this;
switch (_that) {
case _ComicPageResultDto():
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ComicDto> list,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ComicPageResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicPageResultDto implements ComicPageResultDto {
  const _ComicPageResultDto({required final  List<ComicDto> list, required this.total}): _list = list;
  factory _ComicPageResultDto.fromJson(Map<String, dynamic> json) => _$ComicPageResultDtoFromJson(json);

 final  List<ComicDto> _list;
@override List<ComicDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;

/// Create a copy of ComicPageResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicPageResultDtoCopyWith<_ComicPageResultDto> get copyWith => __$ComicPageResultDtoCopyWithImpl<_ComicPageResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicPageResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicPageResultDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total);

@override
String toString() {
  return 'ComicPageResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ComicPageResultDtoCopyWith<$Res> implements $ComicPageResultDtoCopyWith<$Res> {
  factory _$ComicPageResultDtoCopyWith(_ComicPageResultDto value, $Res Function(_ComicPageResultDto) _then) = __$ComicPageResultDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ComicDto> list, int total
});




}
/// @nodoc
class __$ComicPageResultDtoCopyWithImpl<$Res>
    implements _$ComicPageResultDtoCopyWith<$Res> {
  __$ComicPageResultDtoCopyWithImpl(this._self, this._then);

  final _ComicPageResultDto _self;
  final $Res Function(_ComicPageResultDto) _then;

/// Create a copy of ComicPageResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,}) {
  return _then(_ComicPageResultDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ComicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RankPageResultDto {

 List<RankedComicDto> get list; int get total;
/// Create a copy of RankPageResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankPageResultDtoCopyWith<RankPageResultDto> get copyWith => _$RankPageResultDtoCopyWithImpl<RankPageResultDto>(this as RankPageResultDto, _$identity);

  /// Serializes this RankPageResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RankPageResultDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total);

@override
String toString() {
  return 'RankPageResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class $RankPageResultDtoCopyWith<$Res>  {
  factory $RankPageResultDtoCopyWith(RankPageResultDto value, $Res Function(RankPageResultDto) _then) = _$RankPageResultDtoCopyWithImpl;
@useResult
$Res call({
 List<RankedComicDto> list, int total
});




}
/// @nodoc
class _$RankPageResultDtoCopyWithImpl<$Res>
    implements $RankPageResultDtoCopyWith<$Res> {
  _$RankPageResultDtoCopyWithImpl(this._self, this._then);

  final RankPageResultDto _self;
  final $Res Function(RankPageResultDto) _then;

/// Create a copy of RankPageResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<RankedComicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RankPageResultDto].
extension RankPageResultDtoPatterns on RankPageResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RankPageResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RankPageResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RankPageResultDto value)  $default,){
final _that = this;
switch (_that) {
case _RankPageResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RankPageResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _RankPageResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RankedComicDto> list,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RankPageResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RankedComicDto> list,  int total)  $default,) {final _that = this;
switch (_that) {
case _RankPageResultDto():
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RankedComicDto> list,  int total)?  $default,) {final _that = this;
switch (_that) {
case _RankPageResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RankPageResultDto implements RankPageResultDto {
  const _RankPageResultDto({required final  List<RankedComicDto> list, required this.total}): _list = list;
  factory _RankPageResultDto.fromJson(Map<String, dynamic> json) => _$RankPageResultDtoFromJson(json);

 final  List<RankedComicDto> _list;
@override List<RankedComicDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;

/// Create a copy of RankPageResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RankPageResultDtoCopyWith<_RankPageResultDto> get copyWith => __$RankPageResultDtoCopyWithImpl<_RankPageResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RankPageResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RankPageResultDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total);

@override
String toString() {
  return 'RankPageResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class _$RankPageResultDtoCopyWith<$Res> implements $RankPageResultDtoCopyWith<$Res> {
  factory _$RankPageResultDtoCopyWith(_RankPageResultDto value, $Res Function(_RankPageResultDto) _then) = __$RankPageResultDtoCopyWithImpl;
@override @useResult
$Res call({
 List<RankedComicDto> list, int total
});




}
/// @nodoc
class __$RankPageResultDtoCopyWithImpl<$Res>
    implements _$RankPageResultDtoCopyWith<$Res> {
  __$RankPageResultDtoCopyWithImpl(this._self, this._then);

  final _RankPageResultDto _self;
  final $Res Function(_RankPageResultDto) _then;

/// Create a copy of RankPageResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,}) {
  return _then(_RankPageResultDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<RankedComicDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ComicInfoResultDto {

 bool get isBanned; bool get isLock; bool get isLogin; bool get isMobileBind; bool get isVip; ComicInfoDto get comic; int get popular; Map<String, ChapterGroupDto> get groups;
/// Create a copy of ComicInfoResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicInfoResultDtoCopyWith<ComicInfoResultDto> get copyWith => _$ComicInfoResultDtoCopyWithImpl<ComicInfoResultDto>(this as ComicInfoResultDto, _$identity);

  /// Serializes this ComicInfoResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicInfoResultDto&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.isLock, isLock) || other.isLock == isLock)&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isMobileBind, isMobileBind) || other.isMobileBind == isMobileBind)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.popular, popular) || other.popular == popular)&&const DeepCollectionEquality().equals(other.groups, groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isBanned,isLock,isLogin,isMobileBind,isVip,comic,popular,const DeepCollectionEquality().hash(groups));

@override
String toString() {
  return 'ComicInfoResultDto(isBanned: $isBanned, isLock: $isLock, isLogin: $isLogin, isMobileBind: $isMobileBind, isVip: $isVip, comic: $comic, popular: $popular, groups: $groups)';
}


}

/// @nodoc
abstract mixin class $ComicInfoResultDtoCopyWith<$Res>  {
  factory $ComicInfoResultDtoCopyWith(ComicInfoResultDto value, $Res Function(ComicInfoResultDto) _then) = _$ComicInfoResultDtoCopyWithImpl;
@useResult
$Res call({
 bool isBanned, bool isLock, bool isLogin, bool isMobileBind, bool isVip, ComicInfoDto comic, int popular, Map<String, ChapterGroupDto> groups
});


$ComicInfoDtoCopyWith<$Res> get comic;

}
/// @nodoc
class _$ComicInfoResultDtoCopyWithImpl<$Res>
    implements $ComicInfoResultDtoCopyWith<$Res> {
  _$ComicInfoResultDtoCopyWithImpl(this._self, this._then);

  final ComicInfoResultDto _self;
  final $Res Function(ComicInfoResultDto) _then;

/// Create a copy of ComicInfoResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isBanned = null,Object? isLock = null,Object? isLogin = null,Object? isMobileBind = null,Object? isVip = null,Object? comic = null,Object? popular = null,Object? groups = null,}) {
  return _then(_self.copyWith(
isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,isLock: null == isLock ? _self.isLock : isLock // ignore: cast_nullable_to_non_nullable
as bool,isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isMobileBind: null == isMobileBind ? _self.isMobileBind : isMobileBind // ignore: cast_nullable_to_non_nullable
as bool,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as ComicInfoDto,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as Map<String, ChapterGroupDto>,
  ));
}
/// Create a copy of ComicInfoResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicInfoDtoCopyWith<$Res> get comic {
  
  return $ComicInfoDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicInfoResultDto].
extension ComicInfoResultDtoPatterns on ComicInfoResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicInfoResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicInfoResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicInfoResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ComicInfoResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicInfoResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComicInfoResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isBanned,  bool isLock,  bool isLogin,  bool isMobileBind,  bool isVip,  ComicInfoDto comic,  int popular,  Map<String, ChapterGroupDto> groups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicInfoResultDto() when $default != null:
return $default(_that.isBanned,_that.isLock,_that.isLogin,_that.isMobileBind,_that.isVip,_that.comic,_that.popular,_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isBanned,  bool isLock,  bool isLogin,  bool isMobileBind,  bool isVip,  ComicInfoDto comic,  int popular,  Map<String, ChapterGroupDto> groups)  $default,) {final _that = this;
switch (_that) {
case _ComicInfoResultDto():
return $default(_that.isBanned,_that.isLock,_that.isLogin,_that.isMobileBind,_that.isVip,_that.comic,_that.popular,_that.groups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isBanned,  bool isLock,  bool isLogin,  bool isMobileBind,  bool isVip,  ComicInfoDto comic,  int popular,  Map<String, ChapterGroupDto> groups)?  $default,) {final _that = this;
switch (_that) {
case _ComicInfoResultDto() when $default != null:
return $default(_that.isBanned,_that.isLock,_that.isLogin,_that.isMobileBind,_that.isVip,_that.comic,_that.popular,_that.groups);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ComicInfoResultDto implements ComicInfoResultDto {
  const _ComicInfoResultDto({this.isBanned = false, this.isLock = false, this.isLogin = false, this.isMobileBind = false, this.isVip = false, required this.comic, this.popular = 0, required final  Map<String, ChapterGroupDto> groups}): _groups = groups;
  factory _ComicInfoResultDto.fromJson(Map<String, dynamic> json) => _$ComicInfoResultDtoFromJson(json);

@override@JsonKey() final  bool isBanned;
@override@JsonKey() final  bool isLock;
@override@JsonKey() final  bool isLogin;
@override@JsonKey() final  bool isMobileBind;
@override@JsonKey() final  bool isVip;
@override final  ComicInfoDto comic;
@override@JsonKey() final  int popular;
 final  Map<String, ChapterGroupDto> _groups;
@override Map<String, ChapterGroupDto> get groups {
  if (_groups is EqualUnmodifiableMapView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groups);
}


/// Create a copy of ComicInfoResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicInfoResultDtoCopyWith<_ComicInfoResultDto> get copyWith => __$ComicInfoResultDtoCopyWithImpl<_ComicInfoResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicInfoResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicInfoResultDto&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.isLock, isLock) || other.isLock == isLock)&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isMobileBind, isMobileBind) || other.isMobileBind == isMobileBind)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.comic, comic) || other.comic == comic)&&(identical(other.popular, popular) || other.popular == popular)&&const DeepCollectionEquality().equals(other._groups, _groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isBanned,isLock,isLogin,isMobileBind,isVip,comic,popular,const DeepCollectionEquality().hash(_groups));

@override
String toString() {
  return 'ComicInfoResultDto(isBanned: $isBanned, isLock: $isLock, isLogin: $isLogin, isMobileBind: $isMobileBind, isVip: $isVip, comic: $comic, popular: $popular, groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$ComicInfoResultDtoCopyWith<$Res> implements $ComicInfoResultDtoCopyWith<$Res> {
  factory _$ComicInfoResultDtoCopyWith(_ComicInfoResultDto value, $Res Function(_ComicInfoResultDto) _then) = __$ComicInfoResultDtoCopyWithImpl;
@override @useResult
$Res call({
 bool isBanned, bool isLock, bool isLogin, bool isMobileBind, bool isVip, ComicInfoDto comic, int popular, Map<String, ChapterGroupDto> groups
});


@override $ComicInfoDtoCopyWith<$Res> get comic;

}
/// @nodoc
class __$ComicInfoResultDtoCopyWithImpl<$Res>
    implements _$ComicInfoResultDtoCopyWith<$Res> {
  __$ComicInfoResultDtoCopyWithImpl(this._self, this._then);

  final _ComicInfoResultDto _self;
  final $Res Function(_ComicInfoResultDto) _then;

/// Create a copy of ComicInfoResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isBanned = null,Object? isLock = null,Object? isLogin = null,Object? isMobileBind = null,Object? isVip = null,Object? comic = null,Object? popular = null,Object? groups = null,}) {
  return _then(_ComicInfoResultDto(
isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,isLock: null == isLock ? _self.isLock : isLock // ignore: cast_nullable_to_non_nullable
as bool,isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isMobileBind: null == isMobileBind ? _self.isMobileBind : isMobileBind // ignore: cast_nullable_to_non_nullable
as bool,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,comic: null == comic ? _self.comic : comic // ignore: cast_nullable_to_non_nullable
as ComicInfoDto,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as Map<String, ChapterGroupDto>,
  ));
}

/// Create a copy of ComicInfoResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicInfoDtoCopyWith<$Res> get comic {
  
  return $ComicInfoDtoCopyWith<$Res>(_self.comic, (value) {
    return _then(_self.copyWith(comic: value));
  });
}
}


/// @nodoc
mixin _$ComicInfoDto {

 String get uuid; bool get b404; bool get bHidden; int get ban; String get name; String get alias; String get pathWord; bool get closeComment; bool get closeRoast; LabeledValueDto? get freeType; LabeledValueDto? get restrict; LabeledValueDto? get reclass; List<NamedPathDto> get females; List<NamedPathDto> get males; List<NamedPathDto> get clubs; String get seoBaidu; LabeledValueDto? get region; ComicStatusDto? get status;@JsonKey(name: 'author') List<NamedPathDto> get authors;@JsonKey(name: 'theme') List<NamedPathDto> get themes; List<NamedPathDto> get parodies; String get brief; String get datetimeUpdated; String get cover; ChapterDto? get lastChapter; int get popular; Object? get channel;
/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicInfoDtoCopyWith<ComicInfoDto> get copyWith => _$ComicInfoDtoCopyWithImpl<ComicInfoDto>(this as ComicInfoDto, _$identity);

  /// Serializes this ComicInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicInfoDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.b404, b404) || other.b404 == b404)&&(identical(other.bHidden, bHidden) || other.bHidden == bHidden)&&(identical(other.ban, ban) || other.ban == ban)&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.closeComment, closeComment) || other.closeComment == closeComment)&&(identical(other.closeRoast, closeRoast) || other.closeRoast == closeRoast)&&(identical(other.freeType, freeType) || other.freeType == freeType)&&(identical(other.restrict, restrict) || other.restrict == restrict)&&(identical(other.reclass, reclass) || other.reclass == reclass)&&const DeepCollectionEquality().equals(other.females, females)&&const DeepCollectionEquality().equals(other.males, males)&&const DeepCollectionEquality().equals(other.clubs, clubs)&&(identical(other.seoBaidu, seoBaidu) || other.seoBaidu == seoBaidu)&&(identical(other.region, region) || other.region == region)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.themes, themes)&&const DeepCollectionEquality().equals(other.parodies, parodies)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter)&&(identical(other.popular, popular) || other.popular == popular)&&const DeepCollectionEquality().equals(other.channel, channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,uuid,b404,bHidden,ban,name,alias,pathWord,closeComment,closeRoast,freeType,restrict,reclass,const DeepCollectionEquality().hash(females),const DeepCollectionEquality().hash(males),const DeepCollectionEquality().hash(clubs),seoBaidu,region,status,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(themes),const DeepCollectionEquality().hash(parodies),brief,datetimeUpdated,cover,lastChapter,popular,const DeepCollectionEquality().hash(channel)]);

@override
String toString() {
  return 'ComicInfoDto(uuid: $uuid, b404: $b404, bHidden: $bHidden, ban: $ban, name: $name, alias: $alias, pathWord: $pathWord, closeComment: $closeComment, closeRoast: $closeRoast, freeType: $freeType, restrict: $restrict, reclass: $reclass, females: $females, males: $males, clubs: $clubs, seoBaidu: $seoBaidu, region: $region, status: $status, authors: $authors, themes: $themes, parodies: $parodies, brief: $brief, datetimeUpdated: $datetimeUpdated, cover: $cover, lastChapter: $lastChapter, popular: $popular, channel: $channel)';
}


}

/// @nodoc
abstract mixin class $ComicInfoDtoCopyWith<$Res>  {
  factory $ComicInfoDtoCopyWith(ComicInfoDto value, $Res Function(ComicInfoDto) _then) = _$ComicInfoDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, bool b404, bool bHidden, int ban, String name, String alias, String pathWord, bool closeComment, bool closeRoast, LabeledValueDto? freeType, LabeledValueDto? restrict, LabeledValueDto? reclass, List<NamedPathDto> females, List<NamedPathDto> males, List<NamedPathDto> clubs, String seoBaidu, LabeledValueDto? region, ComicStatusDto? status,@JsonKey(name: 'author') List<NamedPathDto> authors,@JsonKey(name: 'theme') List<NamedPathDto> themes, List<NamedPathDto> parodies, String brief, String datetimeUpdated, String cover, ChapterDto? lastChapter, int popular, Object? channel
});


$LabeledValueDtoCopyWith<$Res>? get freeType;$LabeledValueDtoCopyWith<$Res>? get restrict;$LabeledValueDtoCopyWith<$Res>? get reclass;$LabeledValueDtoCopyWith<$Res>? get region;$ComicStatusDtoCopyWith<$Res>? get status;$ChapterDtoCopyWith<$Res>? get lastChapter;

}
/// @nodoc
class _$ComicInfoDtoCopyWithImpl<$Res>
    implements $ComicInfoDtoCopyWith<$Res> {
  _$ComicInfoDtoCopyWithImpl(this._self, this._then);

  final ComicInfoDto _self;
  final $Res Function(ComicInfoDto) _then;

/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? b404 = null,Object? bHidden = null,Object? ban = null,Object? name = null,Object? alias = null,Object? pathWord = null,Object? closeComment = null,Object? closeRoast = null,Object? freeType = freezed,Object? restrict = freezed,Object? reclass = freezed,Object? females = null,Object? males = null,Object? clubs = null,Object? seoBaidu = null,Object? region = freezed,Object? status = freezed,Object? authors = null,Object? themes = null,Object? parodies = null,Object? brief = null,Object? datetimeUpdated = null,Object? cover = null,Object? lastChapter = freezed,Object? popular = null,Object? channel = freezed,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,b404: null == b404 ? _self.b404 : b404 // ignore: cast_nullable_to_non_nullable
as bool,bHidden: null == bHidden ? _self.bHidden : bHidden // ignore: cast_nullable_to_non_nullable
as bool,ban: null == ban ? _self.ban : ban // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,closeComment: null == closeComment ? _self.closeComment : closeComment // ignore: cast_nullable_to_non_nullable
as bool,closeRoast: null == closeRoast ? _self.closeRoast : closeRoast // ignore: cast_nullable_to_non_nullable
as bool,freeType: freezed == freeType ? _self.freeType : freeType // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,restrict: freezed == restrict ? _self.restrict : restrict // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,reclass: freezed == reclass ? _self.reclass : reclass // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,females: null == females ? _self.females : females // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,males: null == males ? _self.males : males // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,clubs: null == clubs ? _self.clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,seoBaidu: null == seoBaidu ? _self.seoBaidu : seoBaidu // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComicStatusDto?,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,parodies: null == parodies ? _self.parodies : parodies // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,datetimeUpdated: null == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as ChapterDto?,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,channel: freezed == channel ? _self.channel : channel ,
  ));
}
/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get freeType {
    if (_self.freeType == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.freeType!, (value) {
    return _then(_self.copyWith(freeType: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get restrict {
    if (_self.restrict == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.restrict!, (value) {
    return _then(_self.copyWith(restrict: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get reclass {
    if (_self.reclass == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.reclass!, (value) {
    return _then(_self.copyWith(reclass: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get region {
    if (_self.region == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.region!, (value) {
    return _then(_self.copyWith(region: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicStatusDtoCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $ComicStatusDtoCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChapterDtoCopyWith<$Res>? get lastChapter {
    if (_self.lastChapter == null) {
    return null;
  }

  return $ChapterDtoCopyWith<$Res>(_self.lastChapter!, (value) {
    return _then(_self.copyWith(lastChapter: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicInfoDto].
extension ComicInfoDtoPatterns on ComicInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _ComicInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _ComicInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  bool b404,  bool bHidden,  int ban,  String name,  String alias,  String pathWord,  bool closeComment,  bool closeRoast,  LabeledValueDto? freeType,  LabeledValueDto? restrict,  LabeledValueDto? reclass,  List<NamedPathDto> females,  List<NamedPathDto> males,  List<NamedPathDto> clubs,  String seoBaidu,  LabeledValueDto? region,  ComicStatusDto? status, @JsonKey(name: 'author')  List<NamedPathDto> authors, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  List<NamedPathDto> parodies,  String brief,  String datetimeUpdated,  String cover,  ChapterDto? lastChapter,  int popular,  Object? channel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicInfoDto() when $default != null:
return $default(_that.uuid,_that.b404,_that.bHidden,_that.ban,_that.name,_that.alias,_that.pathWord,_that.closeComment,_that.closeRoast,_that.freeType,_that.restrict,_that.reclass,_that.females,_that.males,_that.clubs,_that.seoBaidu,_that.region,_that.status,_that.authors,_that.themes,_that.parodies,_that.brief,_that.datetimeUpdated,_that.cover,_that.lastChapter,_that.popular,_that.channel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  bool b404,  bool bHidden,  int ban,  String name,  String alias,  String pathWord,  bool closeComment,  bool closeRoast,  LabeledValueDto? freeType,  LabeledValueDto? restrict,  LabeledValueDto? reclass,  List<NamedPathDto> females,  List<NamedPathDto> males,  List<NamedPathDto> clubs,  String seoBaidu,  LabeledValueDto? region,  ComicStatusDto? status, @JsonKey(name: 'author')  List<NamedPathDto> authors, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  List<NamedPathDto> parodies,  String brief,  String datetimeUpdated,  String cover,  ChapterDto? lastChapter,  int popular,  Object? channel)  $default,) {final _that = this;
switch (_that) {
case _ComicInfoDto():
return $default(_that.uuid,_that.b404,_that.bHidden,_that.ban,_that.name,_that.alias,_that.pathWord,_that.closeComment,_that.closeRoast,_that.freeType,_that.restrict,_that.reclass,_that.females,_that.males,_that.clubs,_that.seoBaidu,_that.region,_that.status,_that.authors,_that.themes,_that.parodies,_that.brief,_that.datetimeUpdated,_that.cover,_that.lastChapter,_that.popular,_that.channel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  bool b404,  bool bHidden,  int ban,  String name,  String alias,  String pathWord,  bool closeComment,  bool closeRoast,  LabeledValueDto? freeType,  LabeledValueDto? restrict,  LabeledValueDto? reclass,  List<NamedPathDto> females,  List<NamedPathDto> males,  List<NamedPathDto> clubs,  String seoBaidu,  LabeledValueDto? region,  ComicStatusDto? status, @JsonKey(name: 'author')  List<NamedPathDto> authors, @JsonKey(name: 'theme')  List<NamedPathDto> themes,  List<NamedPathDto> parodies,  String brief,  String datetimeUpdated,  String cover,  ChapterDto? lastChapter,  int popular,  Object? channel)?  $default,) {final _that = this;
switch (_that) {
case _ComicInfoDto() when $default != null:
return $default(_that.uuid,_that.b404,_that.bHidden,_that.ban,_that.name,_that.alias,_that.pathWord,_that.closeComment,_that.closeRoast,_that.freeType,_that.restrict,_that.reclass,_that.females,_that.males,_that.clubs,_that.seoBaidu,_that.region,_that.status,_that.authors,_that.themes,_that.parodies,_that.brief,_that.datetimeUpdated,_that.cover,_that.lastChapter,_that.popular,_that.channel);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ComicInfoDto implements ComicInfoDto {
  const _ComicInfoDto({this.uuid = '', this.b404 = false, this.bHidden = false, this.ban = 0, this.name = '', this.alias = '', this.pathWord = '', this.closeComment = false, this.closeRoast = false, this.freeType, this.restrict, this.reclass, final  List<NamedPathDto> females = const [], final  List<NamedPathDto> males = const [], final  List<NamedPathDto> clubs = const [], this.seoBaidu = '', this.region, this.status, @JsonKey(name: 'author') final  List<NamedPathDto> authors = const [], @JsonKey(name: 'theme') final  List<NamedPathDto> themes = const [], final  List<NamedPathDto> parodies = const [], this.brief = '', this.datetimeUpdated = '', this.cover = '', this.lastChapter, this.popular = 0, this.channel}): _females = females,_males = males,_clubs = clubs,_authors = authors,_themes = themes,_parodies = parodies;
  factory _ComicInfoDto.fromJson(Map<String, dynamic> json) => _$ComicInfoDtoFromJson(json);

@override@JsonKey() final  String uuid;
@override@JsonKey() final  bool b404;
@override@JsonKey() final  bool bHidden;
@override@JsonKey() final  int ban;
@override@JsonKey() final  String name;
@override@JsonKey() final  String alias;
@override@JsonKey() final  String pathWord;
@override@JsonKey() final  bool closeComment;
@override@JsonKey() final  bool closeRoast;
@override final  LabeledValueDto? freeType;
@override final  LabeledValueDto? restrict;
@override final  LabeledValueDto? reclass;
 final  List<NamedPathDto> _females;
@override@JsonKey() List<NamedPathDto> get females {
  if (_females is EqualUnmodifiableListView) return _females;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_females);
}

 final  List<NamedPathDto> _males;
@override@JsonKey() List<NamedPathDto> get males {
  if (_males is EqualUnmodifiableListView) return _males;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_males);
}

 final  List<NamedPathDto> _clubs;
@override@JsonKey() List<NamedPathDto> get clubs {
  if (_clubs is EqualUnmodifiableListView) return _clubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clubs);
}

@override@JsonKey() final  String seoBaidu;
@override final  LabeledValueDto? region;
@override final  ComicStatusDto? status;
 final  List<NamedPathDto> _authors;
@override@JsonKey(name: 'author') List<NamedPathDto> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

 final  List<NamedPathDto> _themes;
@override@JsonKey(name: 'theme') List<NamedPathDto> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

 final  List<NamedPathDto> _parodies;
@override@JsonKey() List<NamedPathDto> get parodies {
  if (_parodies is EqualUnmodifiableListView) return _parodies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parodies);
}

@override@JsonKey() final  String brief;
@override@JsonKey() final  String datetimeUpdated;
@override@JsonKey() final  String cover;
@override final  ChapterDto? lastChapter;
@override@JsonKey() final  int popular;
@override final  Object? channel;

/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicInfoDtoCopyWith<_ComicInfoDto> get copyWith => __$ComicInfoDtoCopyWithImpl<_ComicInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicInfoDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.b404, b404) || other.b404 == b404)&&(identical(other.bHidden, bHidden) || other.bHidden == bHidden)&&(identical(other.ban, ban) || other.ban == ban)&&(identical(other.name, name) || other.name == name)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.closeComment, closeComment) || other.closeComment == closeComment)&&(identical(other.closeRoast, closeRoast) || other.closeRoast == closeRoast)&&(identical(other.freeType, freeType) || other.freeType == freeType)&&(identical(other.restrict, restrict) || other.restrict == restrict)&&(identical(other.reclass, reclass) || other.reclass == reclass)&&const DeepCollectionEquality().equals(other._females, _females)&&const DeepCollectionEquality().equals(other._males, _males)&&const DeepCollectionEquality().equals(other._clubs, _clubs)&&(identical(other.seoBaidu, seoBaidu) || other.seoBaidu == seoBaidu)&&(identical(other.region, region) || other.region == region)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._themes, _themes)&&const DeepCollectionEquality().equals(other._parodies, _parodies)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.datetimeUpdated, datetimeUpdated) || other.datetimeUpdated == datetimeUpdated)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter)&&(identical(other.popular, popular) || other.popular == popular)&&const DeepCollectionEquality().equals(other.channel, channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,uuid,b404,bHidden,ban,name,alias,pathWord,closeComment,closeRoast,freeType,restrict,reclass,const DeepCollectionEquality().hash(_females),const DeepCollectionEquality().hash(_males),const DeepCollectionEquality().hash(_clubs),seoBaidu,region,status,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_themes),const DeepCollectionEquality().hash(_parodies),brief,datetimeUpdated,cover,lastChapter,popular,const DeepCollectionEquality().hash(channel)]);

@override
String toString() {
  return 'ComicInfoDto(uuid: $uuid, b404: $b404, bHidden: $bHidden, ban: $ban, name: $name, alias: $alias, pathWord: $pathWord, closeComment: $closeComment, closeRoast: $closeRoast, freeType: $freeType, restrict: $restrict, reclass: $reclass, females: $females, males: $males, clubs: $clubs, seoBaidu: $seoBaidu, region: $region, status: $status, authors: $authors, themes: $themes, parodies: $parodies, brief: $brief, datetimeUpdated: $datetimeUpdated, cover: $cover, lastChapter: $lastChapter, popular: $popular, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$ComicInfoDtoCopyWith<$Res> implements $ComicInfoDtoCopyWith<$Res> {
  factory _$ComicInfoDtoCopyWith(_ComicInfoDto value, $Res Function(_ComicInfoDto) _then) = __$ComicInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, bool b404, bool bHidden, int ban, String name, String alias, String pathWord, bool closeComment, bool closeRoast, LabeledValueDto? freeType, LabeledValueDto? restrict, LabeledValueDto? reclass, List<NamedPathDto> females, List<NamedPathDto> males, List<NamedPathDto> clubs, String seoBaidu, LabeledValueDto? region, ComicStatusDto? status,@JsonKey(name: 'author') List<NamedPathDto> authors,@JsonKey(name: 'theme') List<NamedPathDto> themes, List<NamedPathDto> parodies, String brief, String datetimeUpdated, String cover, ChapterDto? lastChapter, int popular, Object? channel
});


@override $LabeledValueDtoCopyWith<$Res>? get freeType;@override $LabeledValueDtoCopyWith<$Res>? get restrict;@override $LabeledValueDtoCopyWith<$Res>? get reclass;@override $LabeledValueDtoCopyWith<$Res>? get region;@override $ComicStatusDtoCopyWith<$Res>? get status;@override $ChapterDtoCopyWith<$Res>? get lastChapter;

}
/// @nodoc
class __$ComicInfoDtoCopyWithImpl<$Res>
    implements _$ComicInfoDtoCopyWith<$Res> {
  __$ComicInfoDtoCopyWithImpl(this._self, this._then);

  final _ComicInfoDto _self;
  final $Res Function(_ComicInfoDto) _then;

/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? b404 = null,Object? bHidden = null,Object? ban = null,Object? name = null,Object? alias = null,Object? pathWord = null,Object? closeComment = null,Object? closeRoast = null,Object? freeType = freezed,Object? restrict = freezed,Object? reclass = freezed,Object? females = null,Object? males = null,Object? clubs = null,Object? seoBaidu = null,Object? region = freezed,Object? status = freezed,Object? authors = null,Object? themes = null,Object? parodies = null,Object? brief = null,Object? datetimeUpdated = null,Object? cover = null,Object? lastChapter = freezed,Object? popular = null,Object? channel = freezed,}) {
  return _then(_ComicInfoDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,b404: null == b404 ? _self.b404 : b404 // ignore: cast_nullable_to_non_nullable
as bool,bHidden: null == bHidden ? _self.bHidden : bHidden // ignore: cast_nullable_to_non_nullable
as bool,ban: null == ban ? _self.ban : ban // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,closeComment: null == closeComment ? _self.closeComment : closeComment // ignore: cast_nullable_to_non_nullable
as bool,closeRoast: null == closeRoast ? _self.closeRoast : closeRoast // ignore: cast_nullable_to_non_nullable
as bool,freeType: freezed == freeType ? _self.freeType : freeType // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,restrict: freezed == restrict ? _self.restrict : restrict // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,reclass: freezed == reclass ? _self.reclass : reclass // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,females: null == females ? _self._females : females // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,males: null == males ? _self._males : males // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,clubs: null == clubs ? _self._clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,seoBaidu: null == seoBaidu ? _self.seoBaidu : seoBaidu // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as LabeledValueDto?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComicStatusDto?,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,parodies: null == parodies ? _self._parodies : parodies // ignore: cast_nullable_to_non_nullable
as List<NamedPathDto>,brief: null == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String,datetimeUpdated: null == datetimeUpdated ? _self.datetimeUpdated : datetimeUpdated // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as ChapterDto?,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as int,channel: freezed == channel ? _self.channel : channel ,
  ));
}

/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get freeType {
    if (_self.freeType == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.freeType!, (value) {
    return _then(_self.copyWith(freeType: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get restrict {
    if (_self.restrict == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.restrict!, (value) {
    return _then(_self.copyWith(restrict: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get reclass {
    if (_self.reclass == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.reclass!, (value) {
    return _then(_self.copyWith(reclass: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<$Res>? get region {
    if (_self.region == null) {
    return null;
  }

  return $LabeledValueDtoCopyWith<$Res>(_self.region!, (value) {
    return _then(_self.copyWith(region: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicStatusDtoCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $ComicStatusDtoCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of ComicInfoDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChapterDtoCopyWith<$Res>? get lastChapter {
    if (_self.lastChapter == null) {
    return null;
  }

  return $ChapterDtoCopyWith<$Res>(_self.lastChapter!, (value) {
    return _then(_self.copyWith(lastChapter: value));
  });
}
}


/// @nodoc
mixin _$LabeledValueDto {

 int get value; String get display;
/// Create a copy of LabeledValueDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabeledValueDtoCopyWith<LabeledValueDto> get copyWith => _$LabeledValueDtoCopyWithImpl<LabeledValueDto>(this as LabeledValueDto, _$identity);

  /// Serializes this LabeledValueDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabeledValueDto&&(identical(other.value, value) || other.value == value)&&(identical(other.display, display) || other.display == display));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,display);

@override
String toString() {
  return 'LabeledValueDto(value: $value, display: $display)';
}


}

/// @nodoc
abstract mixin class $LabeledValueDtoCopyWith<$Res>  {
  factory $LabeledValueDtoCopyWith(LabeledValueDto value, $Res Function(LabeledValueDto) _then) = _$LabeledValueDtoCopyWithImpl;
@useResult
$Res call({
 int value, String display
});




}
/// @nodoc
class _$LabeledValueDtoCopyWithImpl<$Res>
    implements $LabeledValueDtoCopyWith<$Res> {
  _$LabeledValueDtoCopyWithImpl(this._self, this._then);

  final LabeledValueDto _self;
  final $Res Function(LabeledValueDto) _then;

/// Create a copy of LabeledValueDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? display = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,display: null == display ? _self.display : display // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LabeledValueDto].
extension LabeledValueDtoPatterns on LabeledValueDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabeledValueDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabeledValueDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabeledValueDto value)  $default,){
final _that = this;
switch (_that) {
case _LabeledValueDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabeledValueDto value)?  $default,){
final _that = this;
switch (_that) {
case _LabeledValueDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int value,  String display)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabeledValueDto() when $default != null:
return $default(_that.value,_that.display);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int value,  String display)  $default,) {final _that = this;
switch (_that) {
case _LabeledValueDto():
return $default(_that.value,_that.display);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int value,  String display)?  $default,) {final _that = this;
switch (_that) {
case _LabeledValueDto() when $default != null:
return $default(_that.value,_that.display);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabeledValueDto implements LabeledValueDto {
  const _LabeledValueDto({this.value = 0, this.display = ''});
  factory _LabeledValueDto.fromJson(Map<String, dynamic> json) => _$LabeledValueDtoFromJson(json);

@override@JsonKey() final  int value;
@override@JsonKey() final  String display;

/// Create a copy of LabeledValueDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabeledValueDtoCopyWith<_LabeledValueDto> get copyWith => __$LabeledValueDtoCopyWithImpl<_LabeledValueDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabeledValueDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabeledValueDto&&(identical(other.value, value) || other.value == value)&&(identical(other.display, display) || other.display == display));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,display);

@override
String toString() {
  return 'LabeledValueDto(value: $value, display: $display)';
}


}

/// @nodoc
abstract mixin class _$LabeledValueDtoCopyWith<$Res> implements $LabeledValueDtoCopyWith<$Res> {
  factory _$LabeledValueDtoCopyWith(_LabeledValueDto value, $Res Function(_LabeledValueDto) _then) = __$LabeledValueDtoCopyWithImpl;
@override @useResult
$Res call({
 int value, String display
});




}
/// @nodoc
class __$LabeledValueDtoCopyWithImpl<$Res>
    implements _$LabeledValueDtoCopyWith<$Res> {
  __$LabeledValueDtoCopyWithImpl(this._self, this._then);

  final _LabeledValueDto _self;
  final $Res Function(_LabeledValueDto) _then;

/// Create a copy of LabeledValueDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? display = null,}) {
  return _then(_LabeledValueDto(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,display: null == display ? _self.display : display // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChapterGroupDto {

 String get name; String get pathWord; int get count;
/// Create a copy of ChapterGroupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterGroupDtoCopyWith<ChapterGroupDto> get copyWith => _$ChapterGroupDtoCopyWithImpl<ChapterGroupDto>(this as ChapterGroupDto, _$identity);

  /// Serializes this ChapterGroupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterGroupDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord,count);

@override
String toString() {
  return 'ChapterGroupDto(name: $name, pathWord: $pathWord, count: $count)';
}


}

/// @nodoc
abstract mixin class $ChapterGroupDtoCopyWith<$Res>  {
  factory $ChapterGroupDtoCopyWith(ChapterGroupDto value, $Res Function(ChapterGroupDto) _then) = _$ChapterGroupDtoCopyWithImpl;
@useResult
$Res call({
 String name, String pathWord, int count
});




}
/// @nodoc
class _$ChapterGroupDtoCopyWithImpl<$Res>
    implements $ChapterGroupDtoCopyWith<$Res> {
  _$ChapterGroupDtoCopyWithImpl(this._self, this._then);

  final ChapterGroupDto _self;
  final $Res Function(ChapterGroupDto) _then;

/// Create a copy of ChapterGroupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? pathWord = null,Object? count = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterGroupDto].
extension ChapterGroupDtoPatterns on ChapterGroupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterGroupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterGroupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterGroupDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterGroupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterGroupDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterGroupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String pathWord,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterGroupDto() when $default != null:
return $default(_that.name,_that.pathWord,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String pathWord,  int count)  $default,) {final _that = this;
switch (_that) {
case _ChapterGroupDto():
return $default(_that.name,_that.pathWord,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String pathWord,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ChapterGroupDto() when $default != null:
return $default(_that.name,_that.pathWord,_that.count);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChapterGroupDto implements ChapterGroupDto {
  const _ChapterGroupDto({this.name = '', this.pathWord = '', this.count = 0});
  factory _ChapterGroupDto.fromJson(Map<String, dynamic> json) => _$ChapterGroupDtoFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String pathWord;
@override@JsonKey() final  int count;

/// Create a copy of ChapterGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterGroupDtoCopyWith<_ChapterGroupDto> get copyWith => __$ChapterGroupDtoCopyWithImpl<_ChapterGroupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterGroupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterGroupDto&&(identical(other.name, name) || other.name == name)&&(identical(other.pathWord, pathWord) || other.pathWord == pathWord)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,pathWord,count);

@override
String toString() {
  return 'ChapterGroupDto(name: $name, pathWord: $pathWord, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ChapterGroupDtoCopyWith<$Res> implements $ChapterGroupDtoCopyWith<$Res> {
  factory _$ChapterGroupDtoCopyWith(_ChapterGroupDto value, $Res Function(_ChapterGroupDto) _then) = __$ChapterGroupDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String pathWord, int count
});




}
/// @nodoc
class __$ChapterGroupDtoCopyWithImpl<$Res>
    implements _$ChapterGroupDtoCopyWith<$Res> {
  __$ChapterGroupDtoCopyWithImpl(this._self, this._then);

  final _ChapterGroupDto _self;
  final $Res Function(_ChapterGroupDto) _then;

/// Create a copy of ChapterGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? pathWord = null,Object? count = null,}) {
  return _then(_ChapterGroupDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pathWord: null == pathWord ? _self.pathWord : pathWord // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FavoriteStatusResultDto {

 Object? get collect;
/// Create a copy of FavoriteStatusResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStatusResultDtoCopyWith<FavoriteStatusResultDto> get copyWith => _$FavoriteStatusResultDtoCopyWithImpl<FavoriteStatusResultDto>(this as FavoriteStatusResultDto, _$identity);

  /// Serializes this FavoriteStatusResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteStatusResultDto&&const DeepCollectionEquality().equals(other.collect, collect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(collect));

@override
String toString() {
  return 'FavoriteStatusResultDto(collect: $collect)';
}


}

/// @nodoc
abstract mixin class $FavoriteStatusResultDtoCopyWith<$Res>  {
  factory $FavoriteStatusResultDtoCopyWith(FavoriteStatusResultDto value, $Res Function(FavoriteStatusResultDto) _then) = _$FavoriteStatusResultDtoCopyWithImpl;
@useResult
$Res call({
 Object? collect
});




}
/// @nodoc
class _$FavoriteStatusResultDtoCopyWithImpl<$Res>
    implements $FavoriteStatusResultDtoCopyWith<$Res> {
  _$FavoriteStatusResultDtoCopyWithImpl(this._self, this._then);

  final FavoriteStatusResultDto _self;
  final $Res Function(FavoriteStatusResultDto) _then;

/// Create a copy of FavoriteStatusResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collect = freezed,}) {
  return _then(_self.copyWith(
collect: freezed == collect ? _self.collect : collect ,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteStatusResultDto].
extension FavoriteStatusResultDtoPatterns on FavoriteStatusResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteStatusResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteStatusResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteStatusResultDto value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteStatusResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteStatusResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteStatusResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Object? collect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteStatusResultDto() when $default != null:
return $default(_that.collect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Object? collect)  $default,) {final _that = this;
switch (_that) {
case _FavoriteStatusResultDto():
return $default(_that.collect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Object? collect)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteStatusResultDto() when $default != null:
return $default(_that.collect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteStatusResultDto implements FavoriteStatusResultDto {
  const _FavoriteStatusResultDto({this.collect});
  factory _FavoriteStatusResultDto.fromJson(Map<String, dynamic> json) => _$FavoriteStatusResultDtoFromJson(json);

@override final  Object? collect;

/// Create a copy of FavoriteStatusResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStatusResultDtoCopyWith<_FavoriteStatusResultDto> get copyWith => __$FavoriteStatusResultDtoCopyWithImpl<_FavoriteStatusResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteStatusResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteStatusResultDto&&const DeepCollectionEquality().equals(other.collect, collect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(collect));

@override
String toString() {
  return 'FavoriteStatusResultDto(collect: $collect)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStatusResultDtoCopyWith<$Res> implements $FavoriteStatusResultDtoCopyWith<$Res> {
  factory _$FavoriteStatusResultDtoCopyWith(_FavoriteStatusResultDto value, $Res Function(_FavoriteStatusResultDto) _then) = __$FavoriteStatusResultDtoCopyWithImpl;
@override @useResult
$Res call({
 Object? collect
});




}
/// @nodoc
class __$FavoriteStatusResultDtoCopyWithImpl<$Res>
    implements _$FavoriteStatusResultDtoCopyWith<$Res> {
  __$FavoriteStatusResultDtoCopyWithImpl(this._self, this._then);

  final _FavoriteStatusResultDto _self;
  final $Res Function(_FavoriteStatusResultDto) _then;

/// Create a copy of FavoriteStatusResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collect = freezed,}) {
  return _then(_FavoriteStatusResultDto(
collect: freezed == collect ? _self.collect : collect ,
  ));
}


}


/// @nodoc
mixin _$ChapterListResultDto {

 List<ChapterDto> get list; int get total;
/// Create a copy of ChapterListResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterListResultDtoCopyWith<ChapterListResultDto> get copyWith => _$ChapterListResultDtoCopyWithImpl<ChapterListResultDto>(this as ChapterListResultDto, _$identity);

  /// Serializes this ChapterListResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterListResultDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total);

@override
String toString() {
  return 'ChapterListResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class $ChapterListResultDtoCopyWith<$Res>  {
  factory $ChapterListResultDtoCopyWith(ChapterListResultDto value, $Res Function(ChapterListResultDto) _then) = _$ChapterListResultDtoCopyWithImpl;
@useResult
$Res call({
 List<ChapterDto> list, int total
});




}
/// @nodoc
class _$ChapterListResultDtoCopyWithImpl<$Res>
    implements $ChapterListResultDtoCopyWith<$Res> {
  _$ChapterListResultDtoCopyWithImpl(this._self, this._then);

  final ChapterListResultDto _self;
  final $Res Function(ChapterListResultDto) _then;

/// Create a copy of ChapterListResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ChapterDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterListResultDto].
extension ChapterListResultDtoPatterns on ChapterListResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterListResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterListResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterListResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterListResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterListResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterListResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChapterDto> list,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterListResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChapterDto> list,  int total)  $default,) {final _that = this;
switch (_that) {
case _ChapterListResultDto():
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChapterDto> list,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ChapterListResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterListResultDto implements ChapterListResultDto {
  const _ChapterListResultDto({final  List<ChapterDto> list = const [], this.total = 0}): _list = list;
  factory _ChapterListResultDto.fromJson(Map<String, dynamic> json) => _$ChapterListResultDtoFromJson(json);

 final  List<ChapterDto> _list;
@override@JsonKey() List<ChapterDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  int total;

/// Create a copy of ChapterListResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterListResultDtoCopyWith<_ChapterListResultDto> get copyWith => __$ChapterListResultDtoCopyWithImpl<_ChapterListResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterListResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterListResultDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total);

@override
String toString() {
  return 'ChapterListResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ChapterListResultDtoCopyWith<$Res> implements $ChapterListResultDtoCopyWith<$Res> {
  factory _$ChapterListResultDtoCopyWith(_ChapterListResultDto value, $Res Function(_ChapterListResultDto) _then) = __$ChapterListResultDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ChapterDto> list, int total
});




}
/// @nodoc
class __$ChapterListResultDtoCopyWithImpl<$Res>
    implements _$ChapterListResultDtoCopyWith<$Res> {
  __$ChapterListResultDtoCopyWithImpl(this._self, this._then);

  final _ChapterListResultDto _self;
  final $Res Function(_ChapterListResultDto) _then;

/// Create a copy of ChapterListResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,}) {
  return _then(_ChapterListResultDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ChapterDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChapterDto {

 int get index; String get uuid; int get count; int get ordered; int get size; String get name; String get comicId; String get comicPathWord; String? get groupId; String get groupPathWord; int get type; String get news; String get datetimeCreated; String? get prev; String? get next;
/// Create a copy of ChapterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterDtoCopyWith<ChapterDto> get copyWith => _$ChapterDtoCopyWithImpl<ChapterDto>(this as ChapterDto, _$identity);

  /// Serializes this ChapterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterDto&&(identical(other.index, index) || other.index == index)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.count, count) || other.count == count)&&(identical(other.ordered, ordered) || other.ordered == ordered)&&(identical(other.size, size) || other.size == size)&&(identical(other.name, name) || other.name == name)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.comicPathWord, comicPathWord) || other.comicPathWord == comicPathWord)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupPathWord, groupPathWord) || other.groupPathWord == groupPathWord)&&(identical(other.type, type) || other.type == type)&&(identical(other.news, news) || other.news == news)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,uuid,count,ordered,size,name,comicId,comicPathWord,groupId,groupPathWord,type,news,datetimeCreated,prev,next);

@override
String toString() {
  return 'ChapterDto(index: $index, uuid: $uuid, count: $count, ordered: $ordered, size: $size, name: $name, comicId: $comicId, comicPathWord: $comicPathWord, groupId: $groupId, groupPathWord: $groupPathWord, type: $type, news: $news, datetimeCreated: $datetimeCreated, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class $ChapterDtoCopyWith<$Res>  {
  factory $ChapterDtoCopyWith(ChapterDto value, $Res Function(ChapterDto) _then) = _$ChapterDtoCopyWithImpl;
@useResult
$Res call({
 int index, String uuid, int count, int ordered, int size, String name, String comicId, String comicPathWord, String? groupId, String groupPathWord, int type, String news, String datetimeCreated, String? prev, String? next
});




}
/// @nodoc
class _$ChapterDtoCopyWithImpl<$Res>
    implements $ChapterDtoCopyWith<$Res> {
  _$ChapterDtoCopyWithImpl(this._self, this._then);

  final ChapterDto _self;
  final $Res Function(ChapterDto) _then;

/// Create a copy of ChapterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? uuid = null,Object? count = null,Object? ordered = null,Object? size = null,Object? name = null,Object? comicId = null,Object? comicPathWord = null,Object? groupId = freezed,Object? groupPathWord = null,Object? type = null,Object? news = null,Object? datetimeCreated = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,ordered: null == ordered ? _self.ordered : ordered // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,comicPathWord: null == comicPathWord ? _self.comicPathWord : comicPathWord // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,groupPathWord: null == groupPathWord ? _self.groupPathWord : groupPathWord // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as String,datetimeCreated: null == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterDto].
extension ChapterDtoPatterns on ChapterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String uuid,  int count,  int ordered,  int size,  String name,  String comicId,  String comicPathWord,  String? groupId,  String groupPathWord,  int type,  String news,  String datetimeCreated,  String? prev,  String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterDto() when $default != null:
return $default(_that.index,_that.uuid,_that.count,_that.ordered,_that.size,_that.name,_that.comicId,_that.comicPathWord,_that.groupId,_that.groupPathWord,_that.type,_that.news,_that.datetimeCreated,_that.prev,_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String uuid,  int count,  int ordered,  int size,  String name,  String comicId,  String comicPathWord,  String? groupId,  String groupPathWord,  int type,  String news,  String datetimeCreated,  String? prev,  String? next)  $default,) {final _that = this;
switch (_that) {
case _ChapterDto():
return $default(_that.index,_that.uuid,_that.count,_that.ordered,_that.size,_that.name,_that.comicId,_that.comicPathWord,_that.groupId,_that.groupPathWord,_that.type,_that.news,_that.datetimeCreated,_that.prev,_that.next);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String uuid,  int count,  int ordered,  int size,  String name,  String comicId,  String comicPathWord,  String? groupId,  String groupPathWord,  int type,  String news,  String datetimeCreated,  String? prev,  String? next)?  $default,) {final _that = this;
switch (_that) {
case _ChapterDto() when $default != null:
return $default(_that.index,_that.uuid,_that.count,_that.ordered,_that.size,_that.name,_that.comicId,_that.comicPathWord,_that.groupId,_that.groupPathWord,_that.type,_that.news,_that.datetimeCreated,_that.prev,_that.next);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChapterDto implements ChapterDto {
  const _ChapterDto({this.index = 0, this.uuid = '', this.count = 0, this.ordered = 0, this.size = 0, this.name = '', this.comicId = '', this.comicPathWord = '', this.groupId, this.groupPathWord = '', this.type = 0, this.news = '', this.datetimeCreated = '', this.prev, this.next});
  factory _ChapterDto.fromJson(Map<String, dynamic> json) => _$ChapterDtoFromJson(json);

@override@JsonKey() final  int index;
@override@JsonKey() final  String uuid;
@override@JsonKey() final  int count;
@override@JsonKey() final  int ordered;
@override@JsonKey() final  int size;
@override@JsonKey() final  String name;
@override@JsonKey() final  String comicId;
@override@JsonKey() final  String comicPathWord;
@override final  String? groupId;
@override@JsonKey() final  String groupPathWord;
@override@JsonKey() final  int type;
@override@JsonKey() final  String news;
@override@JsonKey() final  String datetimeCreated;
@override final  String? prev;
@override final  String? next;

/// Create a copy of ChapterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterDtoCopyWith<_ChapterDto> get copyWith => __$ChapterDtoCopyWithImpl<_ChapterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterDto&&(identical(other.index, index) || other.index == index)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.count, count) || other.count == count)&&(identical(other.ordered, ordered) || other.ordered == ordered)&&(identical(other.size, size) || other.size == size)&&(identical(other.name, name) || other.name == name)&&(identical(other.comicId, comicId) || other.comicId == comicId)&&(identical(other.comicPathWord, comicPathWord) || other.comicPathWord == comicPathWord)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupPathWord, groupPathWord) || other.groupPathWord == groupPathWord)&&(identical(other.type, type) || other.type == type)&&(identical(other.news, news) || other.news == news)&&(identical(other.datetimeCreated, datetimeCreated) || other.datetimeCreated == datetimeCreated)&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,uuid,count,ordered,size,name,comicId,comicPathWord,groupId,groupPathWord,type,news,datetimeCreated,prev,next);

@override
String toString() {
  return 'ChapterDto(index: $index, uuid: $uuid, count: $count, ordered: $ordered, size: $size, name: $name, comicId: $comicId, comicPathWord: $comicPathWord, groupId: $groupId, groupPathWord: $groupPathWord, type: $type, news: $news, datetimeCreated: $datetimeCreated, prev: $prev, next: $next)';
}


}

/// @nodoc
abstract mixin class _$ChapterDtoCopyWith<$Res> implements $ChapterDtoCopyWith<$Res> {
  factory _$ChapterDtoCopyWith(_ChapterDto value, $Res Function(_ChapterDto) _then) = __$ChapterDtoCopyWithImpl;
@override @useResult
$Res call({
 int index, String uuid, int count, int ordered, int size, String name, String comicId, String comicPathWord, String? groupId, String groupPathWord, int type, String news, String datetimeCreated, String? prev, String? next
});




}
/// @nodoc
class __$ChapterDtoCopyWithImpl<$Res>
    implements _$ChapterDtoCopyWith<$Res> {
  __$ChapterDtoCopyWithImpl(this._self, this._then);

  final _ChapterDto _self;
  final $Res Function(_ChapterDto) _then;

/// Create a copy of ChapterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? uuid = null,Object? count = null,Object? ordered = null,Object? size = null,Object? name = null,Object? comicId = null,Object? comicPathWord = null,Object? groupId = freezed,Object? groupPathWord = null,Object? type = null,Object? news = null,Object? datetimeCreated = null,Object? prev = freezed,Object? next = freezed,}) {
  return _then(_ChapterDto(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,ordered: null == ordered ? _self.ordered : ordered // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,comicId: null == comicId ? _self.comicId : comicId // ignore: cast_nullable_to_non_nullable
as String,comicPathWord: null == comicPathWord ? _self.comicPathWord : comicPathWord // ignore: cast_nullable_to_non_nullable
as String,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,groupPathWord: null == groupPathWord ? _self.groupPathWord : groupPathWord // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as String,datetimeCreated: null == datetimeCreated ? _self.datetimeCreated : datetimeCreated // ignore: cast_nullable_to_non_nullable
as String,prev: freezed == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String?,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChapterContentResultDto {

 ChapterContentDto get chapter;
/// Create a copy of ChapterContentResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterContentResultDtoCopyWith<ChapterContentResultDto> get copyWith => _$ChapterContentResultDtoCopyWithImpl<ChapterContentResultDto>(this as ChapterContentResultDto, _$identity);

  /// Serializes this ChapterContentResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterContentResultDto&&(identical(other.chapter, chapter) || other.chapter == chapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter);

@override
String toString() {
  return 'ChapterContentResultDto(chapter: $chapter)';
}


}

/// @nodoc
abstract mixin class $ChapterContentResultDtoCopyWith<$Res>  {
  factory $ChapterContentResultDtoCopyWith(ChapterContentResultDto value, $Res Function(ChapterContentResultDto) _then) = _$ChapterContentResultDtoCopyWithImpl;
@useResult
$Res call({
 ChapterContentDto chapter
});


$ChapterContentDtoCopyWith<$Res> get chapter;

}
/// @nodoc
class _$ChapterContentResultDtoCopyWithImpl<$Res>
    implements $ChapterContentResultDtoCopyWith<$Res> {
  _$ChapterContentResultDtoCopyWithImpl(this._self, this._then);

  final ChapterContentResultDto _self;
  final $Res Function(ChapterContentResultDto) _then;

/// Create a copy of ChapterContentResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapter = null,}) {
  return _then(_self.copyWith(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as ChapterContentDto,
  ));
}
/// Create a copy of ChapterContentResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChapterContentDtoCopyWith<$Res> get chapter {
  
  return $ChapterContentDtoCopyWith<$Res>(_self.chapter, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChapterContentResultDto].
extension ChapterContentResultDtoPatterns on ChapterContentResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterContentResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterContentResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterContentResultDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterContentResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterContentResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterContentResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChapterContentDto chapter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterContentResultDto() when $default != null:
return $default(_that.chapter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChapterContentDto chapter)  $default,) {final _that = this;
switch (_that) {
case _ChapterContentResultDto():
return $default(_that.chapter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChapterContentDto chapter)?  $default,) {final _that = this;
switch (_that) {
case _ChapterContentResultDto() when $default != null:
return $default(_that.chapter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterContentResultDto implements ChapterContentResultDto {
  const _ChapterContentResultDto({required this.chapter});
  factory _ChapterContentResultDto.fromJson(Map<String, dynamic> json) => _$ChapterContentResultDtoFromJson(json);

@override final  ChapterContentDto chapter;

/// Create a copy of ChapterContentResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterContentResultDtoCopyWith<_ChapterContentResultDto> get copyWith => __$ChapterContentResultDtoCopyWithImpl<_ChapterContentResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterContentResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterContentResultDto&&(identical(other.chapter, chapter) || other.chapter == chapter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter);

@override
String toString() {
  return 'ChapterContentResultDto(chapter: $chapter)';
}


}

/// @nodoc
abstract mixin class _$ChapterContentResultDtoCopyWith<$Res> implements $ChapterContentResultDtoCopyWith<$Res> {
  factory _$ChapterContentResultDtoCopyWith(_ChapterContentResultDto value, $Res Function(_ChapterContentResultDto) _then) = __$ChapterContentResultDtoCopyWithImpl;
@override @useResult
$Res call({
 ChapterContentDto chapter
});


@override $ChapterContentDtoCopyWith<$Res> get chapter;

}
/// @nodoc
class __$ChapterContentResultDtoCopyWithImpl<$Res>
    implements _$ChapterContentResultDtoCopyWith<$Res> {
  __$ChapterContentResultDtoCopyWithImpl(this._self, this._then);

  final _ChapterContentResultDto _self;
  final $Res Function(_ChapterContentResultDto) _then;

/// Create a copy of ChapterContentResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapter = null,}) {
  return _then(_ChapterContentResultDto(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as ChapterContentDto,
  ));
}

/// Create a copy of ChapterContentResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChapterContentDtoCopyWith<$Res> get chapter {
  
  return $ChapterContentDtoCopyWith<$Res>(_self.chapter, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// @nodoc
mixin _$ChapterContentDto {

 List<ChapterImageDto> get contents; List<int> get words;
/// Create a copy of ChapterContentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterContentDtoCopyWith<ChapterContentDto> get copyWith => _$ChapterContentDtoCopyWithImpl<ChapterContentDto>(this as ChapterContentDto, _$identity);

  /// Serializes this ChapterContentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterContentDto&&const DeepCollectionEquality().equals(other.contents, contents)&&const DeepCollectionEquality().equals(other.words, words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(contents),const DeepCollectionEquality().hash(words));

@override
String toString() {
  return 'ChapterContentDto(contents: $contents, words: $words)';
}


}

/// @nodoc
abstract mixin class $ChapterContentDtoCopyWith<$Res>  {
  factory $ChapterContentDtoCopyWith(ChapterContentDto value, $Res Function(ChapterContentDto) _then) = _$ChapterContentDtoCopyWithImpl;
@useResult
$Res call({
 List<ChapterImageDto> contents, List<int> words
});




}
/// @nodoc
class _$ChapterContentDtoCopyWithImpl<$Res>
    implements $ChapterContentDtoCopyWith<$Res> {
  _$ChapterContentDtoCopyWithImpl(this._self, this._then);

  final ChapterContentDto _self;
  final $Res Function(ChapterContentDto) _then;

/// Create a copy of ChapterContentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contents = null,Object? words = null,}) {
  return _then(_self.copyWith(
contents: null == contents ? _self.contents : contents // ignore: cast_nullable_to_non_nullable
as List<ChapterImageDto>,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterContentDto].
extension ChapterContentDtoPatterns on ChapterContentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterContentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterContentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterContentDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterContentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterContentDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterContentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChapterImageDto> contents,  List<int> words)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterContentDto() when $default != null:
return $default(_that.contents,_that.words);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChapterImageDto> contents,  List<int> words)  $default,) {final _that = this;
switch (_that) {
case _ChapterContentDto():
return $default(_that.contents,_that.words);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChapterImageDto> contents,  List<int> words)?  $default,) {final _that = this;
switch (_that) {
case _ChapterContentDto() when $default != null:
return $default(_that.contents,_that.words);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterContentDto implements ChapterContentDto {
  const _ChapterContentDto({required final  List<ChapterImageDto> contents, required final  List<int> words}): _contents = contents,_words = words;
  factory _ChapterContentDto.fromJson(Map<String, dynamic> json) => _$ChapterContentDtoFromJson(json);

 final  List<ChapterImageDto> _contents;
@override List<ChapterImageDto> get contents {
  if (_contents is EqualUnmodifiableListView) return _contents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contents);
}

 final  List<int> _words;
@override List<int> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}


/// Create a copy of ChapterContentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterContentDtoCopyWith<_ChapterContentDto> get copyWith => __$ChapterContentDtoCopyWithImpl<_ChapterContentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterContentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterContentDto&&const DeepCollectionEquality().equals(other._contents, _contents)&&const DeepCollectionEquality().equals(other._words, _words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contents),const DeepCollectionEquality().hash(_words));

@override
String toString() {
  return 'ChapterContentDto(contents: $contents, words: $words)';
}


}

/// @nodoc
abstract mixin class _$ChapterContentDtoCopyWith<$Res> implements $ChapterContentDtoCopyWith<$Res> {
  factory _$ChapterContentDtoCopyWith(_ChapterContentDto value, $Res Function(_ChapterContentDto) _then) = __$ChapterContentDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ChapterImageDto> contents, List<int> words
});




}
/// @nodoc
class __$ChapterContentDtoCopyWithImpl<$Res>
    implements _$ChapterContentDtoCopyWith<$Res> {
  __$ChapterContentDtoCopyWithImpl(this._self, this._then);

  final _ChapterContentDto _self;
  final $Res Function(_ChapterContentDto) _then;

/// Create a copy of ChapterContentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contents = null,Object? words = null,}) {
  return _then(_ChapterContentDto(
contents: null == contents ? _self._contents : contents // ignore: cast_nullable_to_non_nullable
as List<ChapterImageDto>,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$ChapterImageDto {

 String get url;
/// Create a copy of ChapterImageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterImageDtoCopyWith<ChapterImageDto> get copyWith => _$ChapterImageDtoCopyWithImpl<ChapterImageDto>(this as ChapterImageDto, _$identity);

  /// Serializes this ChapterImageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterImageDto&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ChapterImageDto(url: $url)';
}


}

/// @nodoc
abstract mixin class $ChapterImageDtoCopyWith<$Res>  {
  factory $ChapterImageDtoCopyWith(ChapterImageDto value, $Res Function(ChapterImageDto) _then) = _$ChapterImageDtoCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$ChapterImageDtoCopyWithImpl<$Res>
    implements $ChapterImageDtoCopyWith<$Res> {
  _$ChapterImageDtoCopyWithImpl(this._self, this._then);

  final ChapterImageDto _self;
  final $Res Function(ChapterImageDto) _then;

/// Create a copy of ChapterImageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterImageDto].
extension ChapterImageDtoPatterns on ChapterImageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterImageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterImageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterImageDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterImageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterImageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterImageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterImageDto() when $default != null:
return $default(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url)  $default,) {final _that = this;
switch (_that) {
case _ChapterImageDto():
return $default(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url)?  $default,) {final _that = this;
switch (_that) {
case _ChapterImageDto() when $default != null:
return $default(_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterImageDto implements ChapterImageDto {
  const _ChapterImageDto({this.url = ''});
  factory _ChapterImageDto.fromJson(Map<String, dynamic> json) => _$ChapterImageDtoFromJson(json);

@override@JsonKey() final  String url;

/// Create a copy of ChapterImageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterImageDtoCopyWith<_ChapterImageDto> get copyWith => __$ChapterImageDtoCopyWithImpl<_ChapterImageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterImageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterImageDto&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'ChapterImageDto(url: $url)';
}


}

/// @nodoc
abstract mixin class _$ChapterImageDtoCopyWith<$Res> implements $ChapterImageDtoCopyWith<$Res> {
  factory _$ChapterImageDtoCopyWith(_ChapterImageDto value, $Res Function(_ChapterImageDto) _then) = __$ChapterImageDtoCopyWithImpl;
@override @useResult
$Res call({
 String url
});




}
/// @nodoc
class __$ChapterImageDtoCopyWithImpl<$Res>
    implements _$ChapterImageDtoCopyWith<$Res> {
  __$ChapterImageDtoCopyWithImpl(this._self, this._then);

  final _ChapterImageDto _self;
  final $Res Function(_ChapterImageDto) _then;

/// Create a copy of ChapterImageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_ChapterImageDto(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CommentPageResultDto {

 List<CommentDto> get list; int get total;
/// Create a copy of CommentPageResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentPageResultDtoCopyWith<CommentPageResultDto> get copyWith => _$CommentPageResultDtoCopyWithImpl<CommentPageResultDto>(this as CommentPageResultDto, _$identity);

  /// Serializes this CommentPageResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentPageResultDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),total);

@override
String toString() {
  return 'CommentPageResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class $CommentPageResultDtoCopyWith<$Res>  {
  factory $CommentPageResultDtoCopyWith(CommentPageResultDto value, $Res Function(CommentPageResultDto) _then) = _$CommentPageResultDtoCopyWithImpl;
@useResult
$Res call({
 List<CommentDto> list, int total
});




}
/// @nodoc
class _$CommentPageResultDtoCopyWithImpl<$Res>
    implements $CommentPageResultDtoCopyWith<$Res> {
  _$CommentPageResultDtoCopyWithImpl(this._self, this._then);

  final CommentPageResultDto _self;
  final $Res Function(CommentPageResultDto) _then;

/// Create a copy of CommentPageResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<CommentDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentPageResultDto].
extension CommentPageResultDtoPatterns on CommentPageResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentPageResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentPageResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentPageResultDto value)  $default,){
final _that = this;
switch (_that) {
case _CommentPageResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentPageResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _CommentPageResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CommentDto> list,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentPageResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CommentDto> list,  int total)  $default,) {final _that = this;
switch (_that) {
case _CommentPageResultDto():
return $default(_that.list,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CommentDto> list,  int total)?  $default,) {final _that = this;
switch (_that) {
case _CommentPageResultDto() when $default != null:
return $default(_that.list,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentPageResultDto implements CommentPageResultDto {
  const _CommentPageResultDto({required final  List<CommentDto> list, required this.total}): _list = list;
  factory _CommentPageResultDto.fromJson(Map<String, dynamic> json) => _$CommentPageResultDtoFromJson(json);

 final  List<CommentDto> _list;
@override List<CommentDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override final  int total;

/// Create a copy of CommentPageResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentPageResultDtoCopyWith<_CommentPageResultDto> get copyWith => __$CommentPageResultDtoCopyWithImpl<_CommentPageResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentPageResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentPageResultDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),total);

@override
String toString() {
  return 'CommentPageResultDto(list: $list, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CommentPageResultDtoCopyWith<$Res> implements $CommentPageResultDtoCopyWith<$Res> {
  factory _$CommentPageResultDtoCopyWith(_CommentPageResultDto value, $Res Function(_CommentPageResultDto) _then) = __$CommentPageResultDtoCopyWithImpl;
@override @useResult
$Res call({
 List<CommentDto> list, int total
});




}
/// @nodoc
class __$CommentPageResultDtoCopyWithImpl<$Res>
    implements _$CommentPageResultDtoCopyWith<$Res> {
  __$CommentPageResultDtoCopyWithImpl(this._self, this._then);

  final _CommentPageResultDto _self;
  final $Res Function(_CommentPageResultDto) _then;

/// Create a copy of CommentPageResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? total = null,}) {
  return _then(_CommentPageResultDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<CommentDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CommentDto {

 String get userName; String get parentUserName; String get userAvatar; String get comment; String get createAt; int? get count; Object? get id;
/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDtoCopyWith<CommentDto> get copyWith => _$CommentDtoCopyWithImpl<CommentDto>(this as CommentDto, _$identity);

  /// Serializes this CommentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDto&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.parentUserName, parentUserName) || other.parentUserName == parentUserName)&&(identical(other.userAvatar, userAvatar) || other.userAvatar == userAvatar)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.id, id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,parentUserName,userAvatar,comment,createAt,count,const DeepCollectionEquality().hash(id));

@override
String toString() {
  return 'CommentDto(userName: $userName, parentUserName: $parentUserName, userAvatar: $userAvatar, comment: $comment, createAt: $createAt, count: $count, id: $id)';
}


}

/// @nodoc
abstract mixin class $CommentDtoCopyWith<$Res>  {
  factory $CommentDtoCopyWith(CommentDto value, $Res Function(CommentDto) _then) = _$CommentDtoCopyWithImpl;
@useResult
$Res call({
 String userName, String parentUserName, String userAvatar, String comment, String createAt, int? count, Object? id
});




}
/// @nodoc
class _$CommentDtoCopyWithImpl<$Res>
    implements $CommentDtoCopyWith<$Res> {
  _$CommentDtoCopyWithImpl(this._self, this._then);

  final CommentDto _self;
  final $Res Function(CommentDto) _then;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? parentUserName = null,Object? userAvatar = null,Object? comment = null,Object? createAt = null,Object? count = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,parentUserName: null == parentUserName ? _self.parentUserName : parentUserName // ignore: cast_nullable_to_non_nullable
as String,userAvatar: null == userAvatar ? _self.userAvatar : userAvatar // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,createAt: null == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id ,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentDto].
extension CommentDtoPatterns on CommentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentDto value)  $default,){
final _that = this;
switch (_that) {
case _CommentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentDto value)?  $default,){
final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String parentUserName,  String userAvatar,  String comment,  String createAt,  int? count,  Object? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
return $default(_that.userName,_that.parentUserName,_that.userAvatar,_that.comment,_that.createAt,_that.count,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String parentUserName,  String userAvatar,  String comment,  String createAt,  int? count,  Object? id)  $default,) {final _that = this;
switch (_that) {
case _CommentDto():
return $default(_that.userName,_that.parentUserName,_that.userAvatar,_that.comment,_that.createAt,_that.count,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String parentUserName,  String userAvatar,  String comment,  String createAt,  int? count,  Object? id)?  $default,) {final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
return $default(_that.userName,_that.parentUserName,_that.userAvatar,_that.comment,_that.createAt,_that.count,_that.id);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CommentDto implements CommentDto {
  const _CommentDto({this.userName = '', this.parentUserName = '', this.userAvatar = '', this.comment = '', this.createAt = '', this.count, this.id});
  factory _CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

@override@JsonKey() final  String userName;
@override@JsonKey() final  String parentUserName;
@override@JsonKey() final  String userAvatar;
@override@JsonKey() final  String comment;
@override@JsonKey() final  String createAt;
@override final  int? count;
@override final  Object? id;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentDtoCopyWith<_CommentDto> get copyWith => __$CommentDtoCopyWithImpl<_CommentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentDto&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.parentUserName, parentUserName) || other.parentUserName == parentUserName)&&(identical(other.userAvatar, userAvatar) || other.userAvatar == userAvatar)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.id, id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,parentUserName,userAvatar,comment,createAt,count,const DeepCollectionEquality().hash(id));

@override
String toString() {
  return 'CommentDto(userName: $userName, parentUserName: $parentUserName, userAvatar: $userAvatar, comment: $comment, createAt: $createAt, count: $count, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CommentDtoCopyWith<$Res> implements $CommentDtoCopyWith<$Res> {
  factory _$CommentDtoCopyWith(_CommentDto value, $Res Function(_CommentDto) _then) = __$CommentDtoCopyWithImpl;
@override @useResult
$Res call({
 String userName, String parentUserName, String userAvatar, String comment, String createAt, int? count, Object? id
});




}
/// @nodoc
class __$CommentDtoCopyWithImpl<$Res>
    implements _$CommentDtoCopyWith<$Res> {
  __$CommentDtoCopyWithImpl(this._self, this._then);

  final _CommentDto _self;
  final $Res Function(_CommentDto) _then;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? parentUserName = null,Object? userAvatar = null,Object? comment = null,Object? createAt = null,Object? count = freezed,Object? id = freezed,}) {
  return _then(_CommentDto(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,parentUserName: null == parentUserName ? _self.parentUserName : parentUserName // ignore: cast_nullable_to_non_nullable
as String,userAvatar: null == userAvatar ? _self.userAvatar : userAvatar // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,createAt: null == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id ,
  ));
}


}


/// @nodoc
mixin _$NetworkResultDto {

@JsonKey(name: 'static') String get staticHost;@JsonKey(name: 'image') String get imageHost; List<String> get share; List<List<String>> get api; List<List<String>> get ads; String get hostComic; String get hostCartoon; String get hostNovel; int get dayDownloadsTotal; int get adsRewardDownloads; int get adsRewardDayShow; int get adsScreenShow; int get adsReadExpressShow; int get adsHomeSeconds; int get adsRestartSeconds; int get adsComicShow; int get adsCartoonShow; int get dayDownloads; int get vipDownloads; int get rewardDownloads; Object? get adsVipEnd; bool get adsStatSwitch; bool get adsStatSwitch2; int get adsRewardSeconds; bool get inMainland;
/// Create a copy of NetworkResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkResultDtoCopyWith<NetworkResultDto> get copyWith => _$NetworkResultDtoCopyWithImpl<NetworkResultDto>(this as NetworkResultDto, _$identity);

  /// Serializes this NetworkResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkResultDto&&(identical(other.staticHost, staticHost) || other.staticHost == staticHost)&&(identical(other.imageHost, imageHost) || other.imageHost == imageHost)&&const DeepCollectionEquality().equals(other.share, share)&&const DeepCollectionEquality().equals(other.api, api)&&const DeepCollectionEquality().equals(other.ads, ads)&&(identical(other.hostComic, hostComic) || other.hostComic == hostComic)&&(identical(other.hostCartoon, hostCartoon) || other.hostCartoon == hostCartoon)&&(identical(other.hostNovel, hostNovel) || other.hostNovel == hostNovel)&&(identical(other.dayDownloadsTotal, dayDownloadsTotal) || other.dayDownloadsTotal == dayDownloadsTotal)&&(identical(other.adsRewardDownloads, adsRewardDownloads) || other.adsRewardDownloads == adsRewardDownloads)&&(identical(other.adsRewardDayShow, adsRewardDayShow) || other.adsRewardDayShow == adsRewardDayShow)&&(identical(other.adsScreenShow, adsScreenShow) || other.adsScreenShow == adsScreenShow)&&(identical(other.adsReadExpressShow, adsReadExpressShow) || other.adsReadExpressShow == adsReadExpressShow)&&(identical(other.adsHomeSeconds, adsHomeSeconds) || other.adsHomeSeconds == adsHomeSeconds)&&(identical(other.adsRestartSeconds, adsRestartSeconds) || other.adsRestartSeconds == adsRestartSeconds)&&(identical(other.adsComicShow, adsComicShow) || other.adsComicShow == adsComicShow)&&(identical(other.adsCartoonShow, adsCartoonShow) || other.adsCartoonShow == adsCartoonShow)&&(identical(other.dayDownloads, dayDownloads) || other.dayDownloads == dayDownloads)&&(identical(other.vipDownloads, vipDownloads) || other.vipDownloads == vipDownloads)&&(identical(other.rewardDownloads, rewardDownloads) || other.rewardDownloads == rewardDownloads)&&const DeepCollectionEquality().equals(other.adsVipEnd, adsVipEnd)&&(identical(other.adsStatSwitch, adsStatSwitch) || other.adsStatSwitch == adsStatSwitch)&&(identical(other.adsStatSwitch2, adsStatSwitch2) || other.adsStatSwitch2 == adsStatSwitch2)&&(identical(other.adsRewardSeconds, adsRewardSeconds) || other.adsRewardSeconds == adsRewardSeconds)&&(identical(other.inMainland, inMainland) || other.inMainland == inMainland));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,staticHost,imageHost,const DeepCollectionEquality().hash(share),const DeepCollectionEquality().hash(api),const DeepCollectionEquality().hash(ads),hostComic,hostCartoon,hostNovel,dayDownloadsTotal,adsRewardDownloads,adsRewardDayShow,adsScreenShow,adsReadExpressShow,adsHomeSeconds,adsRestartSeconds,adsComicShow,adsCartoonShow,dayDownloads,vipDownloads,rewardDownloads,const DeepCollectionEquality().hash(adsVipEnd),adsStatSwitch,adsStatSwitch2,adsRewardSeconds,inMainland]);

@override
String toString() {
  return 'NetworkResultDto(staticHost: $staticHost, imageHost: $imageHost, share: $share, api: $api, ads: $ads, hostComic: $hostComic, hostCartoon: $hostCartoon, hostNovel: $hostNovel, dayDownloadsTotal: $dayDownloadsTotal, adsRewardDownloads: $adsRewardDownloads, adsRewardDayShow: $adsRewardDayShow, adsScreenShow: $adsScreenShow, adsReadExpressShow: $adsReadExpressShow, adsHomeSeconds: $adsHomeSeconds, adsRestartSeconds: $adsRestartSeconds, adsComicShow: $adsComicShow, adsCartoonShow: $adsCartoonShow, dayDownloads: $dayDownloads, vipDownloads: $vipDownloads, rewardDownloads: $rewardDownloads, adsVipEnd: $adsVipEnd, adsStatSwitch: $adsStatSwitch, adsStatSwitch2: $adsStatSwitch2, adsRewardSeconds: $adsRewardSeconds, inMainland: $inMainland)';
}


}

/// @nodoc
abstract mixin class $NetworkResultDtoCopyWith<$Res>  {
  factory $NetworkResultDtoCopyWith(NetworkResultDto value, $Res Function(NetworkResultDto) _then) = _$NetworkResultDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'static') String staticHost,@JsonKey(name: 'image') String imageHost, List<String> share, List<List<String>> api, List<List<String>> ads, String hostComic, String hostCartoon, String hostNovel, int dayDownloadsTotal, int adsRewardDownloads, int adsRewardDayShow, int adsScreenShow, int adsReadExpressShow, int adsHomeSeconds, int adsRestartSeconds, int adsComicShow, int adsCartoonShow, int dayDownloads, int vipDownloads, int rewardDownloads, Object? adsVipEnd, bool adsStatSwitch, bool adsStatSwitch2, int adsRewardSeconds, bool inMainland
});




}
/// @nodoc
class _$NetworkResultDtoCopyWithImpl<$Res>
    implements $NetworkResultDtoCopyWith<$Res> {
  _$NetworkResultDtoCopyWithImpl(this._self, this._then);

  final NetworkResultDto _self;
  final $Res Function(NetworkResultDto) _then;

/// Create a copy of NetworkResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? staticHost = null,Object? imageHost = null,Object? share = null,Object? api = null,Object? ads = null,Object? hostComic = null,Object? hostCartoon = null,Object? hostNovel = null,Object? dayDownloadsTotal = null,Object? adsRewardDownloads = null,Object? adsRewardDayShow = null,Object? adsScreenShow = null,Object? adsReadExpressShow = null,Object? adsHomeSeconds = null,Object? adsRestartSeconds = null,Object? adsComicShow = null,Object? adsCartoonShow = null,Object? dayDownloads = null,Object? vipDownloads = null,Object? rewardDownloads = null,Object? adsVipEnd = freezed,Object? adsStatSwitch = null,Object? adsStatSwitch2 = null,Object? adsRewardSeconds = null,Object? inMainland = null,}) {
  return _then(_self.copyWith(
staticHost: null == staticHost ? _self.staticHost : staticHost // ignore: cast_nullable_to_non_nullable
as String,imageHost: null == imageHost ? _self.imageHost : imageHost // ignore: cast_nullable_to_non_nullable
as String,share: null == share ? _self.share : share // ignore: cast_nullable_to_non_nullable
as List<String>,api: null == api ? _self.api : api // ignore: cast_nullable_to_non_nullable
as List<List<String>>,ads: null == ads ? _self.ads : ads // ignore: cast_nullable_to_non_nullable
as List<List<String>>,hostComic: null == hostComic ? _self.hostComic : hostComic // ignore: cast_nullable_to_non_nullable
as String,hostCartoon: null == hostCartoon ? _self.hostCartoon : hostCartoon // ignore: cast_nullable_to_non_nullable
as String,hostNovel: null == hostNovel ? _self.hostNovel : hostNovel // ignore: cast_nullable_to_non_nullable
as String,dayDownloadsTotal: null == dayDownloadsTotal ? _self.dayDownloadsTotal : dayDownloadsTotal // ignore: cast_nullable_to_non_nullable
as int,adsRewardDownloads: null == adsRewardDownloads ? _self.adsRewardDownloads : adsRewardDownloads // ignore: cast_nullable_to_non_nullable
as int,adsRewardDayShow: null == adsRewardDayShow ? _self.adsRewardDayShow : adsRewardDayShow // ignore: cast_nullable_to_non_nullable
as int,adsScreenShow: null == adsScreenShow ? _self.adsScreenShow : adsScreenShow // ignore: cast_nullable_to_non_nullable
as int,adsReadExpressShow: null == adsReadExpressShow ? _self.adsReadExpressShow : adsReadExpressShow // ignore: cast_nullable_to_non_nullable
as int,adsHomeSeconds: null == adsHomeSeconds ? _self.adsHomeSeconds : adsHomeSeconds // ignore: cast_nullable_to_non_nullable
as int,adsRestartSeconds: null == adsRestartSeconds ? _self.adsRestartSeconds : adsRestartSeconds // ignore: cast_nullable_to_non_nullable
as int,adsComicShow: null == adsComicShow ? _self.adsComicShow : adsComicShow // ignore: cast_nullable_to_non_nullable
as int,adsCartoonShow: null == adsCartoonShow ? _self.adsCartoonShow : adsCartoonShow // ignore: cast_nullable_to_non_nullable
as int,dayDownloads: null == dayDownloads ? _self.dayDownloads : dayDownloads // ignore: cast_nullable_to_non_nullable
as int,vipDownloads: null == vipDownloads ? _self.vipDownloads : vipDownloads // ignore: cast_nullable_to_non_nullable
as int,rewardDownloads: null == rewardDownloads ? _self.rewardDownloads : rewardDownloads // ignore: cast_nullable_to_non_nullable
as int,adsVipEnd: freezed == adsVipEnd ? _self.adsVipEnd : adsVipEnd ,adsStatSwitch: null == adsStatSwitch ? _self.adsStatSwitch : adsStatSwitch // ignore: cast_nullable_to_non_nullable
as bool,adsStatSwitch2: null == adsStatSwitch2 ? _self.adsStatSwitch2 : adsStatSwitch2 // ignore: cast_nullable_to_non_nullable
as bool,adsRewardSeconds: null == adsRewardSeconds ? _self.adsRewardSeconds : adsRewardSeconds // ignore: cast_nullable_to_non_nullable
as int,inMainland: null == inMainland ? _self.inMainland : inMainland // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkResultDto].
extension NetworkResultDtoPatterns on NetworkResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkResultDto value)  $default,){
final _that = this;
switch (_that) {
case _NetworkResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'static')  String staticHost, @JsonKey(name: 'image')  String imageHost,  List<String> share,  List<List<String>> api,  List<List<String>> ads,  String hostComic,  String hostCartoon,  String hostNovel,  int dayDownloadsTotal,  int adsRewardDownloads,  int adsRewardDayShow,  int adsScreenShow,  int adsReadExpressShow,  int adsHomeSeconds,  int adsRestartSeconds,  int adsComicShow,  int adsCartoonShow,  int dayDownloads,  int vipDownloads,  int rewardDownloads,  Object? adsVipEnd,  bool adsStatSwitch,  bool adsStatSwitch2,  int adsRewardSeconds,  bool inMainland)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkResultDto() when $default != null:
return $default(_that.staticHost,_that.imageHost,_that.share,_that.api,_that.ads,_that.hostComic,_that.hostCartoon,_that.hostNovel,_that.dayDownloadsTotal,_that.adsRewardDownloads,_that.adsRewardDayShow,_that.adsScreenShow,_that.adsReadExpressShow,_that.adsHomeSeconds,_that.adsRestartSeconds,_that.adsComicShow,_that.adsCartoonShow,_that.dayDownloads,_that.vipDownloads,_that.rewardDownloads,_that.adsVipEnd,_that.adsStatSwitch,_that.adsStatSwitch2,_that.adsRewardSeconds,_that.inMainland);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'static')  String staticHost, @JsonKey(name: 'image')  String imageHost,  List<String> share,  List<List<String>> api,  List<List<String>> ads,  String hostComic,  String hostCartoon,  String hostNovel,  int dayDownloadsTotal,  int adsRewardDownloads,  int adsRewardDayShow,  int adsScreenShow,  int adsReadExpressShow,  int adsHomeSeconds,  int adsRestartSeconds,  int adsComicShow,  int adsCartoonShow,  int dayDownloads,  int vipDownloads,  int rewardDownloads,  Object? adsVipEnd,  bool adsStatSwitch,  bool adsStatSwitch2,  int adsRewardSeconds,  bool inMainland)  $default,) {final _that = this;
switch (_that) {
case _NetworkResultDto():
return $default(_that.staticHost,_that.imageHost,_that.share,_that.api,_that.ads,_that.hostComic,_that.hostCartoon,_that.hostNovel,_that.dayDownloadsTotal,_that.adsRewardDownloads,_that.adsRewardDayShow,_that.adsScreenShow,_that.adsReadExpressShow,_that.adsHomeSeconds,_that.adsRestartSeconds,_that.adsComicShow,_that.adsCartoonShow,_that.dayDownloads,_that.vipDownloads,_that.rewardDownloads,_that.adsVipEnd,_that.adsStatSwitch,_that.adsStatSwitch2,_that.adsRewardSeconds,_that.inMainland);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'static')  String staticHost, @JsonKey(name: 'image')  String imageHost,  List<String> share,  List<List<String>> api,  List<List<String>> ads,  String hostComic,  String hostCartoon,  String hostNovel,  int dayDownloadsTotal,  int adsRewardDownloads,  int adsRewardDayShow,  int adsScreenShow,  int adsReadExpressShow,  int adsHomeSeconds,  int adsRestartSeconds,  int adsComicShow,  int adsCartoonShow,  int dayDownloads,  int vipDownloads,  int rewardDownloads,  Object? adsVipEnd,  bool adsStatSwitch,  bool adsStatSwitch2,  int adsRewardSeconds,  bool inMainland)?  $default,) {final _that = this;
switch (_that) {
case _NetworkResultDto() when $default != null:
return $default(_that.staticHost,_that.imageHost,_that.share,_that.api,_that.ads,_that.hostComic,_that.hostCartoon,_that.hostNovel,_that.dayDownloadsTotal,_that.adsRewardDownloads,_that.adsRewardDayShow,_that.adsScreenShow,_that.adsReadExpressShow,_that.adsHomeSeconds,_that.adsRestartSeconds,_that.adsComicShow,_that.adsCartoonShow,_that.dayDownloads,_that.vipDownloads,_that.rewardDownloads,_that.adsVipEnd,_that.adsStatSwitch,_that.adsStatSwitch2,_that.adsRewardSeconds,_that.inMainland);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NetworkResultDto implements NetworkResultDto {
  const _NetworkResultDto({@JsonKey(name: 'static') required this.staticHost, @JsonKey(name: 'image') required this.imageHost, required final  List<String> share, required final  List<List<String>> api, required final  List<List<String>> ads, required this.hostComic, required this.hostCartoon, required this.hostNovel, required this.dayDownloadsTotal, required this.adsRewardDownloads, required this.adsRewardDayShow, required this.adsScreenShow, required this.adsReadExpressShow, required this.adsHomeSeconds, required this.adsRestartSeconds, required this.adsComicShow, required this.adsCartoonShow, required this.dayDownloads, required this.vipDownloads, required this.rewardDownloads, this.adsVipEnd, required this.adsStatSwitch, required this.adsStatSwitch2, required this.adsRewardSeconds, required this.inMainland}): _share = share,_api = api,_ads = ads;
  factory _NetworkResultDto.fromJson(Map<String, dynamic> json) => _$NetworkResultDtoFromJson(json);

@override@JsonKey(name: 'static') final  String staticHost;
@override@JsonKey(name: 'image') final  String imageHost;
 final  List<String> _share;
@override List<String> get share {
  if (_share is EqualUnmodifiableListView) return _share;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_share);
}

 final  List<List<String>> _api;
@override List<List<String>> get api {
  if (_api is EqualUnmodifiableListView) return _api;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_api);
}

 final  List<List<String>> _ads;
@override List<List<String>> get ads {
  if (_ads is EqualUnmodifiableListView) return _ads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ads);
}

@override final  String hostComic;
@override final  String hostCartoon;
@override final  String hostNovel;
@override final  int dayDownloadsTotal;
@override final  int adsRewardDownloads;
@override final  int adsRewardDayShow;
@override final  int adsScreenShow;
@override final  int adsReadExpressShow;
@override final  int adsHomeSeconds;
@override final  int adsRestartSeconds;
@override final  int adsComicShow;
@override final  int adsCartoonShow;
@override final  int dayDownloads;
@override final  int vipDownloads;
@override final  int rewardDownloads;
@override final  Object? adsVipEnd;
@override final  bool adsStatSwitch;
@override final  bool adsStatSwitch2;
@override final  int adsRewardSeconds;
@override final  bool inMainland;

/// Create a copy of NetworkResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkResultDtoCopyWith<_NetworkResultDto> get copyWith => __$NetworkResultDtoCopyWithImpl<_NetworkResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NetworkResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkResultDto&&(identical(other.staticHost, staticHost) || other.staticHost == staticHost)&&(identical(other.imageHost, imageHost) || other.imageHost == imageHost)&&const DeepCollectionEquality().equals(other._share, _share)&&const DeepCollectionEquality().equals(other._api, _api)&&const DeepCollectionEquality().equals(other._ads, _ads)&&(identical(other.hostComic, hostComic) || other.hostComic == hostComic)&&(identical(other.hostCartoon, hostCartoon) || other.hostCartoon == hostCartoon)&&(identical(other.hostNovel, hostNovel) || other.hostNovel == hostNovel)&&(identical(other.dayDownloadsTotal, dayDownloadsTotal) || other.dayDownloadsTotal == dayDownloadsTotal)&&(identical(other.adsRewardDownloads, adsRewardDownloads) || other.adsRewardDownloads == adsRewardDownloads)&&(identical(other.adsRewardDayShow, adsRewardDayShow) || other.adsRewardDayShow == adsRewardDayShow)&&(identical(other.adsScreenShow, adsScreenShow) || other.adsScreenShow == adsScreenShow)&&(identical(other.adsReadExpressShow, adsReadExpressShow) || other.adsReadExpressShow == adsReadExpressShow)&&(identical(other.adsHomeSeconds, adsHomeSeconds) || other.adsHomeSeconds == adsHomeSeconds)&&(identical(other.adsRestartSeconds, adsRestartSeconds) || other.adsRestartSeconds == adsRestartSeconds)&&(identical(other.adsComicShow, adsComicShow) || other.adsComicShow == adsComicShow)&&(identical(other.adsCartoonShow, adsCartoonShow) || other.adsCartoonShow == adsCartoonShow)&&(identical(other.dayDownloads, dayDownloads) || other.dayDownloads == dayDownloads)&&(identical(other.vipDownloads, vipDownloads) || other.vipDownloads == vipDownloads)&&(identical(other.rewardDownloads, rewardDownloads) || other.rewardDownloads == rewardDownloads)&&const DeepCollectionEquality().equals(other.adsVipEnd, adsVipEnd)&&(identical(other.adsStatSwitch, adsStatSwitch) || other.adsStatSwitch == adsStatSwitch)&&(identical(other.adsStatSwitch2, adsStatSwitch2) || other.adsStatSwitch2 == adsStatSwitch2)&&(identical(other.adsRewardSeconds, adsRewardSeconds) || other.adsRewardSeconds == adsRewardSeconds)&&(identical(other.inMainland, inMainland) || other.inMainland == inMainland));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,staticHost,imageHost,const DeepCollectionEquality().hash(_share),const DeepCollectionEquality().hash(_api),const DeepCollectionEquality().hash(_ads),hostComic,hostCartoon,hostNovel,dayDownloadsTotal,adsRewardDownloads,adsRewardDayShow,adsScreenShow,adsReadExpressShow,adsHomeSeconds,adsRestartSeconds,adsComicShow,adsCartoonShow,dayDownloads,vipDownloads,rewardDownloads,const DeepCollectionEquality().hash(adsVipEnd),adsStatSwitch,adsStatSwitch2,adsRewardSeconds,inMainland]);

@override
String toString() {
  return 'NetworkResultDto(staticHost: $staticHost, imageHost: $imageHost, share: $share, api: $api, ads: $ads, hostComic: $hostComic, hostCartoon: $hostCartoon, hostNovel: $hostNovel, dayDownloadsTotal: $dayDownloadsTotal, adsRewardDownloads: $adsRewardDownloads, adsRewardDayShow: $adsRewardDayShow, adsScreenShow: $adsScreenShow, adsReadExpressShow: $adsReadExpressShow, adsHomeSeconds: $adsHomeSeconds, adsRestartSeconds: $adsRestartSeconds, adsComicShow: $adsComicShow, adsCartoonShow: $adsCartoonShow, dayDownloads: $dayDownloads, vipDownloads: $vipDownloads, rewardDownloads: $rewardDownloads, adsVipEnd: $adsVipEnd, adsStatSwitch: $adsStatSwitch, adsStatSwitch2: $adsStatSwitch2, adsRewardSeconds: $adsRewardSeconds, inMainland: $inMainland)';
}


}

/// @nodoc
abstract mixin class _$NetworkResultDtoCopyWith<$Res> implements $NetworkResultDtoCopyWith<$Res> {
  factory _$NetworkResultDtoCopyWith(_NetworkResultDto value, $Res Function(_NetworkResultDto) _then) = __$NetworkResultDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'static') String staticHost,@JsonKey(name: 'image') String imageHost, List<String> share, List<List<String>> api, List<List<String>> ads, String hostComic, String hostCartoon, String hostNovel, int dayDownloadsTotal, int adsRewardDownloads, int adsRewardDayShow, int adsScreenShow, int adsReadExpressShow, int adsHomeSeconds, int adsRestartSeconds, int adsComicShow, int adsCartoonShow, int dayDownloads, int vipDownloads, int rewardDownloads, Object? adsVipEnd, bool adsStatSwitch, bool adsStatSwitch2, int adsRewardSeconds, bool inMainland
});




}
/// @nodoc
class __$NetworkResultDtoCopyWithImpl<$Res>
    implements _$NetworkResultDtoCopyWith<$Res> {
  __$NetworkResultDtoCopyWithImpl(this._self, this._then);

  final _NetworkResultDto _self;
  final $Res Function(_NetworkResultDto) _then;

/// Create a copy of NetworkResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? staticHost = null,Object? imageHost = null,Object? share = null,Object? api = null,Object? ads = null,Object? hostComic = null,Object? hostCartoon = null,Object? hostNovel = null,Object? dayDownloadsTotal = null,Object? adsRewardDownloads = null,Object? adsRewardDayShow = null,Object? adsScreenShow = null,Object? adsReadExpressShow = null,Object? adsHomeSeconds = null,Object? adsRestartSeconds = null,Object? adsComicShow = null,Object? adsCartoonShow = null,Object? dayDownloads = null,Object? vipDownloads = null,Object? rewardDownloads = null,Object? adsVipEnd = freezed,Object? adsStatSwitch = null,Object? adsStatSwitch2 = null,Object? adsRewardSeconds = null,Object? inMainland = null,}) {
  return _then(_NetworkResultDto(
staticHost: null == staticHost ? _self.staticHost : staticHost // ignore: cast_nullable_to_non_nullable
as String,imageHost: null == imageHost ? _self.imageHost : imageHost // ignore: cast_nullable_to_non_nullable
as String,share: null == share ? _self._share : share // ignore: cast_nullable_to_non_nullable
as List<String>,api: null == api ? _self._api : api // ignore: cast_nullable_to_non_nullable
as List<List<String>>,ads: null == ads ? _self._ads : ads // ignore: cast_nullable_to_non_nullable
as List<List<String>>,hostComic: null == hostComic ? _self.hostComic : hostComic // ignore: cast_nullable_to_non_nullable
as String,hostCartoon: null == hostCartoon ? _self.hostCartoon : hostCartoon // ignore: cast_nullable_to_non_nullable
as String,hostNovel: null == hostNovel ? _self.hostNovel : hostNovel // ignore: cast_nullable_to_non_nullable
as String,dayDownloadsTotal: null == dayDownloadsTotal ? _self.dayDownloadsTotal : dayDownloadsTotal // ignore: cast_nullable_to_non_nullable
as int,adsRewardDownloads: null == adsRewardDownloads ? _self.adsRewardDownloads : adsRewardDownloads // ignore: cast_nullable_to_non_nullable
as int,adsRewardDayShow: null == adsRewardDayShow ? _self.adsRewardDayShow : adsRewardDayShow // ignore: cast_nullable_to_non_nullable
as int,adsScreenShow: null == adsScreenShow ? _self.adsScreenShow : adsScreenShow // ignore: cast_nullable_to_non_nullable
as int,adsReadExpressShow: null == adsReadExpressShow ? _self.adsReadExpressShow : adsReadExpressShow // ignore: cast_nullable_to_non_nullable
as int,adsHomeSeconds: null == adsHomeSeconds ? _self.adsHomeSeconds : adsHomeSeconds // ignore: cast_nullable_to_non_nullable
as int,adsRestartSeconds: null == adsRestartSeconds ? _self.adsRestartSeconds : adsRestartSeconds // ignore: cast_nullable_to_non_nullable
as int,adsComicShow: null == adsComicShow ? _self.adsComicShow : adsComicShow // ignore: cast_nullable_to_non_nullable
as int,adsCartoonShow: null == adsCartoonShow ? _self.adsCartoonShow : adsCartoonShow // ignore: cast_nullable_to_non_nullable
as int,dayDownloads: null == dayDownloads ? _self.dayDownloads : dayDownloads // ignore: cast_nullable_to_non_nullable
as int,vipDownloads: null == vipDownloads ? _self.vipDownloads : vipDownloads // ignore: cast_nullable_to_non_nullable
as int,rewardDownloads: null == rewardDownloads ? _self.rewardDownloads : rewardDownloads // ignore: cast_nullable_to_non_nullable
as int,adsVipEnd: freezed == adsVipEnd ? _self.adsVipEnd : adsVipEnd ,adsStatSwitch: null == adsStatSwitch ? _self.adsStatSwitch : adsStatSwitch // ignore: cast_nullable_to_non_nullable
as bool,adsStatSwitch2: null == adsStatSwitch2 ? _self.adsStatSwitch2 : adsStatSwitch2 // ignore: cast_nullable_to_non_nullable
as bool,adsRewardSeconds: null == adsRewardSeconds ? _self.adsRewardSeconds : adsRewardSeconds // ignore: cast_nullable_to_non_nullable
as int,inMainland: null == inMainland ? _self.inMainland : inMainland // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RequestIdResultDto {

 String get requestId;
/// Create a copy of RequestIdResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestIdResultDtoCopyWith<RequestIdResultDto> get copyWith => _$RequestIdResultDtoCopyWithImpl<RequestIdResultDto>(this as RequestIdResultDto, _$identity);

  /// Serializes this RequestIdResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestIdResultDto&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'RequestIdResultDto(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $RequestIdResultDtoCopyWith<$Res>  {
  factory $RequestIdResultDtoCopyWith(RequestIdResultDto value, $Res Function(RequestIdResultDto) _then) = _$RequestIdResultDtoCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$RequestIdResultDtoCopyWithImpl<$Res>
    implements $RequestIdResultDtoCopyWith<$Res> {
  _$RequestIdResultDtoCopyWithImpl(this._self, this._then);

  final RequestIdResultDto _self;
  final $Res Function(RequestIdResultDto) _then;

/// Create a copy of RequestIdResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestIdResultDto].
extension RequestIdResultDtoPatterns on RequestIdResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestIdResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestIdResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestIdResultDto value)  $default,){
final _that = this;
switch (_that) {
case _RequestIdResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestIdResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _RequestIdResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestIdResultDto() when $default != null:
return $default(_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId)  $default,) {final _that = this;
switch (_that) {
case _RequestIdResultDto():
return $default(_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId)?  $default,) {final _that = this;
switch (_that) {
case _RequestIdResultDto() when $default != null:
return $default(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RequestIdResultDto implements RequestIdResultDto {
  const _RequestIdResultDto({this.requestId = ''});
  factory _RequestIdResultDto.fromJson(Map<String, dynamic> json) => _$RequestIdResultDtoFromJson(json);

@override@JsonKey() final  String requestId;

/// Create a copy of RequestIdResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestIdResultDtoCopyWith<_RequestIdResultDto> get copyWith => __$RequestIdResultDtoCopyWithImpl<_RequestIdResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestIdResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestIdResultDto&&(identical(other.requestId, requestId) || other.requestId == requestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'RequestIdResultDto(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$RequestIdResultDtoCopyWith<$Res> implements $RequestIdResultDtoCopyWith<$Res> {
  factory _$RequestIdResultDtoCopyWith(_RequestIdResultDto value, $Res Function(_RequestIdResultDto) _then) = __$RequestIdResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$RequestIdResultDtoCopyWithImpl<$Res>
    implements _$RequestIdResultDtoCopyWith<$Res> {
  __$RequestIdResultDtoCopyWithImpl(this._self, this._then);

  final _RequestIdResultDto _self;
  final $Res Function(_RequestIdResultDto) _then;

/// Create a copy of RequestIdResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_RequestIdResultDto(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ComicSummary {

 String get id; String get title; String get cover; String? get subtitle; List<String> get tags; String? get description;
/// Create a copy of ComicSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicSummaryCopyWith<ComicSummary> get copyWith => _$ComicSummaryCopyWithImpl<ComicSummary>(this as ComicSummary, _$identity);

  /// Serializes this ComicSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,cover,subtitle,const DeepCollectionEquality().hash(tags),description);

@override
String toString() {
  return 'ComicSummary(id: $id, title: $title, cover: $cover, subtitle: $subtitle, tags: $tags, description: $description)';
}


}

/// @nodoc
abstract mixin class $ComicSummaryCopyWith<$Res>  {
  factory $ComicSummaryCopyWith(ComicSummary value, $Res Function(ComicSummary) _then) = _$ComicSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String cover, String? subtitle, List<String> tags, String? description
});




}
/// @nodoc
class _$ComicSummaryCopyWithImpl<$Res>
    implements $ComicSummaryCopyWith<$Res> {
  _$ComicSummaryCopyWithImpl(this._self, this._then);

  final ComicSummary _self;
  final $Res Function(ComicSummary) _then;

/// Create a copy of ComicSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? cover = null,Object? subtitle = freezed,Object? tags = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicSummary].
extension ComicSummaryPatterns on ComicSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicSummary value)  $default,){
final _that = this;
switch (_that) {
case _ComicSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ComicSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String cover,  String? subtitle,  List<String> tags,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicSummary() when $default != null:
return $default(_that.id,_that.title,_that.cover,_that.subtitle,_that.tags,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String cover,  String? subtitle,  List<String> tags,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ComicSummary():
return $default(_that.id,_that.title,_that.cover,_that.subtitle,_that.tags,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String cover,  String? subtitle,  List<String> tags,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ComicSummary() when $default != null:
return $default(_that.id,_that.title,_that.cover,_that.subtitle,_that.tags,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicSummary implements ComicSummary {
  const _ComicSummary({required this.id, required this.title, required this.cover, this.subtitle, final  List<String> tags = const [], this.description}): _tags = tags;
  factory _ComicSummary.fromJson(Map<String, dynamic> json) => _$ComicSummaryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String cover;
@override final  String? subtitle;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String? description;

/// Create a copy of ComicSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicSummaryCopyWith<_ComicSummary> get copyWith => __$ComicSummaryCopyWithImpl<_ComicSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,cover,subtitle,const DeepCollectionEquality().hash(_tags),description);

@override
String toString() {
  return 'ComicSummary(id: $id, title: $title, cover: $cover, subtitle: $subtitle, tags: $tags, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ComicSummaryCopyWith<$Res> implements $ComicSummaryCopyWith<$Res> {
  factory _$ComicSummaryCopyWith(_ComicSummary value, $Res Function(_ComicSummary) _then) = __$ComicSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String cover, String? subtitle, List<String> tags, String? description
});




}
/// @nodoc
class __$ComicSummaryCopyWithImpl<$Res>
    implements _$ComicSummaryCopyWith<$Res> {
  __$ComicSummaryCopyWithImpl(this._self, this._then);

  final _ComicSummary _self;
  final $Res Function(_ComicSummary) _then;

/// Create a copy of ComicSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? cover = null,Object? subtitle = freezed,Object? tags = null,Object? description = freezed,}) {
  return _then(_ComicSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PagedResult<T> {

 List<T> get items; int get total; int get pageSize;
/// Create a copy of PagedResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedResultCopyWith<T, PagedResult<T>> get copyWith => _$PagedResultCopyWithImpl<T, PagedResult<T>>(this as PagedResult<T>, _$identity);

  /// Serializes this PagedResult to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagedResult<T>&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,pageSize);

@override
String toString() {
  return 'PagedResult<$T>(items: $items, total: $total, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $PagedResultCopyWith<T,$Res>  {
  factory $PagedResultCopyWith(PagedResult<T> value, $Res Function(PagedResult<T>) _then) = _$PagedResultCopyWithImpl;
@useResult
$Res call({
 List<T> items, int total, int pageSize
});




}
/// @nodoc
class _$PagedResultCopyWithImpl<T,$Res>
    implements $PagedResultCopyWith<T, $Res> {
  _$PagedResultCopyWithImpl(this._self, this._then);

  final PagedResult<T> _self;
  final $Res Function(PagedResult<T>) _then;

/// Create a copy of PagedResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PagedResult].
extension PagedResultPatterns<T> on PagedResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagedResult<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagedResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagedResult<T> value)  $default,){
final _that = this;
switch (_that) {
case _PagedResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagedResult<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PagedResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  int total,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagedResult() when $default != null:
return $default(_that.items,_that.total,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  int total,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _PagedResult():
return $default(_that.items,_that.total,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  int total,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _PagedResult() when $default != null:
return $default(_that.items,_that.total,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PagedResult<T> implements PagedResult<T> {
  const _PagedResult(final  List<T> items, this.total, this.pageSize): _items = items;
  factory _PagedResult.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PagedResultFromJson(json,fromJsonT);

 final  List<T> _items;
@override List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int pageSize;

/// Create a copy of PagedResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedResultCopyWith<T, _PagedResult<T>> get copyWith => __$PagedResultCopyWithImpl<T, _PagedResult<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PagedResultToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagedResult<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,pageSize);

@override
String toString() {
  return 'PagedResult<$T>(items: $items, total: $total, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$PagedResultCopyWith<T,$Res> implements $PagedResultCopyWith<T, $Res> {
  factory _$PagedResultCopyWith(_PagedResult<T> value, $Res Function(_PagedResult<T>) _then) = __$PagedResultCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int total, int pageSize
});




}
/// @nodoc
class __$PagedResultCopyWithImpl<T,$Res>
    implements _$PagedResultCopyWith<T, $Res> {
  __$PagedResultCopyWithImpl(this._self, this._then);

  final _PagedResult<T> _self;
  final $Res Function(_PagedResult<T>) _then;

/// Create a copy of PagedResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? pageSize = null,}) {
  return _then(_PagedResult<T>(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChapterGroup {

 String get name; Map<String, String> get chapters;
/// Create a copy of ChapterGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterGroupCopyWith<ChapterGroup> get copyWith => _$ChapterGroupCopyWithImpl<ChapterGroup>(this as ChapterGroup, _$identity);

  /// Serializes this ChapterGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterGroup&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.chapters, chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(chapters));

@override
String toString() {
  return 'ChapterGroup(name: $name, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class $ChapterGroupCopyWith<$Res>  {
  factory $ChapterGroupCopyWith(ChapterGroup value, $Res Function(ChapterGroup) _then) = _$ChapterGroupCopyWithImpl;
@useResult
$Res call({
 String name, Map<String, String> chapters
});




}
/// @nodoc
class _$ChapterGroupCopyWithImpl<$Res>
    implements $ChapterGroupCopyWith<$Res> {
  _$ChapterGroupCopyWithImpl(this._self, this._then);

  final ChapterGroup _self;
  final $Res Function(ChapterGroup) _then;

/// Create a copy of ChapterGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? chapters = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterGroup].
extension ChapterGroupPatterns on ChapterGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterGroup value)  $default,){
final _that = this;
switch (_that) {
case _ChapterGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterGroup value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  Map<String, String> chapters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterGroup() when $default != null:
return $default(_that.name,_that.chapters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  Map<String, String> chapters)  $default,) {final _that = this;
switch (_that) {
case _ChapterGroup():
return $default(_that.name,_that.chapters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  Map<String, String> chapters)?  $default,) {final _that = this;
switch (_that) {
case _ChapterGroup() when $default != null:
return $default(_that.name,_that.chapters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterGroup implements ChapterGroup {
  const _ChapterGroup({required this.name, required final  Map<String, String> chapters}): _chapters = chapters;
  factory _ChapterGroup.fromJson(Map<String, dynamic> json) => _$ChapterGroupFromJson(json);

@override final  String name;
 final  Map<String, String> _chapters;
@override Map<String, String> get chapters {
  if (_chapters is EqualUnmodifiableMapView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_chapters);
}


/// Create a copy of ChapterGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterGroupCopyWith<_ChapterGroup> get copyWith => __$ChapterGroupCopyWithImpl<_ChapterGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterGroup&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._chapters, _chapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_chapters));

@override
String toString() {
  return 'ChapterGroup(name: $name, chapters: $chapters)';
}


}

/// @nodoc
abstract mixin class _$ChapterGroupCopyWith<$Res> implements $ChapterGroupCopyWith<$Res> {
  factory _$ChapterGroupCopyWith(_ChapterGroup value, $Res Function(_ChapterGroup) _then) = __$ChapterGroupCopyWithImpl;
@override @useResult
$Res call({
 String name, Map<String, String> chapters
});




}
/// @nodoc
class __$ChapterGroupCopyWithImpl<$Res>
    implements _$ChapterGroupCopyWith<$Res> {
  __$ChapterGroupCopyWithImpl(this._self, this._then);

  final _ChapterGroup _self;
  final $Res Function(_ChapterGroup) _then;

/// Create a copy of ChapterGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? chapters = null,}) {
  return _then(_ChapterGroup(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$ComicDetails {

 String get title; String get cover; String get description; List<String> get authors; List<String> get tags; String get updateTime; String get status; List<ChapterGroup> get chapterGroups; bool get isFavorite; String get uuid;
/// Create a copy of ComicDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicDetailsCopyWith<ComicDetails> get copyWith => _$ComicDetailsCopyWithImpl<ComicDetails>(this as ComicDetails, _$identity);

  /// Serializes this ComicDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicDetails&&(identical(other.title, title) || other.title == title)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.authors, authors)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.chapterGroups, chapterGroups)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,cover,description,const DeepCollectionEquality().hash(authors),const DeepCollectionEquality().hash(tags),updateTime,status,const DeepCollectionEquality().hash(chapterGroups),isFavorite,uuid);

@override
String toString() {
  return 'ComicDetails(title: $title, cover: $cover, description: $description, authors: $authors, tags: $tags, updateTime: $updateTime, status: $status, chapterGroups: $chapterGroups, isFavorite: $isFavorite, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class $ComicDetailsCopyWith<$Res>  {
  factory $ComicDetailsCopyWith(ComicDetails value, $Res Function(ComicDetails) _then) = _$ComicDetailsCopyWithImpl;
@useResult
$Res call({
 String title, String cover, String description, List<String> authors, List<String> tags, String updateTime, String status, List<ChapterGroup> chapterGroups, bool isFavorite, String uuid
});




}
/// @nodoc
class _$ComicDetailsCopyWithImpl<$Res>
    implements $ComicDetailsCopyWith<$Res> {
  _$ComicDetailsCopyWithImpl(this._self, this._then);

  final ComicDetails _self;
  final $Res Function(ComicDetails) _then;

/// Create a copy of ComicDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? cover = null,Object? description = null,Object? authors = null,Object? tags = null,Object? updateTime = null,Object? status = null,Object? chapterGroups = null,Object? isFavorite = null,Object? uuid = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chapterGroups: null == chapterGroups ? _self.chapterGroups : chapterGroups // ignore: cast_nullable_to_non_nullable
as List<ChapterGroup>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicDetails].
extension ComicDetailsPatterns on ComicDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicDetails value)  $default,){
final _that = this;
switch (_that) {
case _ComicDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ComicDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String cover,  String description,  List<String> authors,  List<String> tags,  String updateTime,  String status,  List<ChapterGroup> chapterGroups,  bool isFavorite,  String uuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicDetails() when $default != null:
return $default(_that.title,_that.cover,_that.description,_that.authors,_that.tags,_that.updateTime,_that.status,_that.chapterGroups,_that.isFavorite,_that.uuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String cover,  String description,  List<String> authors,  List<String> tags,  String updateTime,  String status,  List<ChapterGroup> chapterGroups,  bool isFavorite,  String uuid)  $default,) {final _that = this;
switch (_that) {
case _ComicDetails():
return $default(_that.title,_that.cover,_that.description,_that.authors,_that.tags,_that.updateTime,_that.status,_that.chapterGroups,_that.isFavorite,_that.uuid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String cover,  String description,  List<String> authors,  List<String> tags,  String updateTime,  String status,  List<ChapterGroup> chapterGroups,  bool isFavorite,  String uuid)?  $default,) {final _that = this;
switch (_that) {
case _ComicDetails() when $default != null:
return $default(_that.title,_that.cover,_that.description,_that.authors,_that.tags,_that.updateTime,_that.status,_that.chapterGroups,_that.isFavorite,_that.uuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicDetails implements ComicDetails {
  const _ComicDetails({required this.title, required this.cover, required this.description, required final  List<String> authors, required final  List<String> tags, required this.updateTime, required this.status, required final  List<ChapterGroup> chapterGroups, required this.isFavorite, required this.uuid}): _authors = authors,_tags = tags,_chapterGroups = chapterGroups;
  factory _ComicDetails.fromJson(Map<String, dynamic> json) => _$ComicDetailsFromJson(json);

@override final  String title;
@override final  String cover;
@override final  String description;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String updateTime;
@override final  String status;
 final  List<ChapterGroup> _chapterGroups;
@override List<ChapterGroup> get chapterGroups {
  if (_chapterGroups is EqualUnmodifiableListView) return _chapterGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapterGroups);
}

@override final  bool isFavorite;
@override final  String uuid;

/// Create a copy of ComicDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicDetailsCopyWith<_ComicDetails> get copyWith => __$ComicDetailsCopyWithImpl<_ComicDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicDetails&&(identical(other.title, title) || other.title == title)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._authors, _authors)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._chapterGroups, _chapterGroups)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.uuid, uuid) || other.uuid == uuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,cover,description,const DeepCollectionEquality().hash(_authors),const DeepCollectionEquality().hash(_tags),updateTime,status,const DeepCollectionEquality().hash(_chapterGroups),isFavorite,uuid);

@override
String toString() {
  return 'ComicDetails(title: $title, cover: $cover, description: $description, authors: $authors, tags: $tags, updateTime: $updateTime, status: $status, chapterGroups: $chapterGroups, isFavorite: $isFavorite, uuid: $uuid)';
}


}

/// @nodoc
abstract mixin class _$ComicDetailsCopyWith<$Res> implements $ComicDetailsCopyWith<$Res> {
  factory _$ComicDetailsCopyWith(_ComicDetails value, $Res Function(_ComicDetails) _then) = __$ComicDetailsCopyWithImpl;
@override @useResult
$Res call({
 String title, String cover, String description, List<String> authors, List<String> tags, String updateTime, String status, List<ChapterGroup> chapterGroups, bool isFavorite, String uuid
});




}
/// @nodoc
class __$ComicDetailsCopyWithImpl<$Res>
    implements _$ComicDetailsCopyWith<$Res> {
  __$ComicDetailsCopyWithImpl(this._self, this._then);

  final _ComicDetails _self;
  final $Res Function(_ComicDetails) _then;

/// Create a copy of ComicDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? cover = null,Object? description = null,Object? authors = null,Object? tags = null,Object? updateTime = null,Object? status = null,Object? chapterGroups = null,Object? isFavorite = null,Object? uuid = null,}) {
  return _then(_ComicDetails(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chapterGroups: null == chapterGroups ? _self._chapterGroups : chapterGroups // ignore: cast_nullable_to_non_nullable
as List<ChapterGroup>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Comment {

 String get userName; String get avatar; String get content; String get time; int? get replyCount; String? get id;
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCopyWith<Comment> get copyWith => _$CommentCopyWithImpl<Comment>(this as Comment, _$identity);

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comment&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.content, content) || other.content == content)&&(identical(other.time, time) || other.time == time)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,avatar,content,time,replyCount,id);

@override
String toString() {
  return 'Comment(userName: $userName, avatar: $avatar, content: $content, time: $time, replyCount: $replyCount, id: $id)';
}


}

/// @nodoc
abstract mixin class $CommentCopyWith<$Res>  {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) _then) = _$CommentCopyWithImpl;
@useResult
$Res call({
 String userName, String avatar, String content, String time, int? replyCount, String? id
});




}
/// @nodoc
class _$CommentCopyWithImpl<$Res>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._self, this._then);

  final Comment _self;
  final $Res Function(Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? avatar = null,Object? content = null,Object? time = null,Object? replyCount = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,replyCount: freezed == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Comment].
extension CommentPatterns on Comment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comment value)  $default,){
final _that = this;
switch (_that) {
case _Comment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comment value)?  $default,){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String avatar,  String content,  String time,  int? replyCount,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.userName,_that.avatar,_that.content,_that.time,_that.replyCount,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String avatar,  String content,  String time,  int? replyCount,  String? id)  $default,) {final _that = this;
switch (_that) {
case _Comment():
return $default(_that.userName,_that.avatar,_that.content,_that.time,_that.replyCount,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String avatar,  String content,  String time,  int? replyCount,  String? id)?  $default,) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.userName,_that.avatar,_that.content,_that.time,_that.replyCount,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Comment implements Comment {
  const _Comment({required this.userName, required this.avatar, required this.content, required this.time, this.replyCount, this.id});
  factory _Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

@override final  String userName;
@override final  String avatar;
@override final  String content;
@override final  String time;
@override final  int? replyCount;
@override final  String? id;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentCopyWith<_Comment> get copyWith => __$CommentCopyWithImpl<_Comment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comment&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.content, content) || other.content == content)&&(identical(other.time, time) || other.time == time)&&(identical(other.replyCount, replyCount) || other.replyCount == replyCount)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,avatar,content,time,replyCount,id);

@override
String toString() {
  return 'Comment(userName: $userName, avatar: $avatar, content: $content, time: $time, replyCount: $replyCount, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) = __$CommentCopyWithImpl;
@override @useResult
$Res call({
 String userName, String avatar, String content, String time, int? replyCount, String? id
});




}
/// @nodoc
class __$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? avatar = null,Object? content = null,Object? time = null,Object? replyCount = freezed,Object? id = freezed,}) {
  return _then(_Comment(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,replyCount: freezed == replyCount ? _self.replyCount : replyCount // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChapterImages {

 List<String> get images;
/// Create a copy of ChapterImages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterImagesCopyWith<ChapterImages> get copyWith => _$ChapterImagesCopyWithImpl<ChapterImages>(this as ChapterImages, _$identity);

  /// Serializes this ChapterImages to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterImages&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'ChapterImages(images: $images)';
}


}

/// @nodoc
abstract mixin class $ChapterImagesCopyWith<$Res>  {
  factory $ChapterImagesCopyWith(ChapterImages value, $Res Function(ChapterImages) _then) = _$ChapterImagesCopyWithImpl;
@useResult
$Res call({
 List<String> images
});




}
/// @nodoc
class _$ChapterImagesCopyWithImpl<$Res>
    implements $ChapterImagesCopyWith<$Res> {
  _$ChapterImagesCopyWithImpl(this._self, this._then);

  final ChapterImages _self;
  final $Res Function(ChapterImages) _then;

/// Create a copy of ChapterImages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? images = null,}) {
  return _then(_self.copyWith(
images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterImages].
extension ChapterImagesPatterns on ChapterImages {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterImages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterImages() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterImages value)  $default,){
final _that = this;
switch (_that) {
case _ChapterImages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterImages value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterImages() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterImages() when $default != null:
return $default(_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> images)  $default,) {final _that = this;
switch (_that) {
case _ChapterImages():
return $default(_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> images)?  $default,) {final _that = this;
switch (_that) {
case _ChapterImages() when $default != null:
return $default(_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterImages implements ChapterImages {
  const _ChapterImages(final  List<String> images): _images = images;
  factory _ChapterImages.fromJson(Map<String, dynamic> json) => _$ChapterImagesFromJson(json);

 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ChapterImages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterImagesCopyWith<_ChapterImages> get copyWith => __$ChapterImagesCopyWithImpl<_ChapterImages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterImagesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterImages&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'ChapterImages(images: $images)';
}


}

/// @nodoc
abstract mixin class _$ChapterImagesCopyWith<$Res> implements $ChapterImagesCopyWith<$Res> {
  factory _$ChapterImagesCopyWith(_ChapterImages value, $Res Function(_ChapterImages) _then) = __$ChapterImagesCopyWithImpl;
@override @useResult
$Res call({
 List<String> images
});




}
/// @nodoc
class __$ChapterImagesCopyWithImpl<$Res>
    implements _$ChapterImagesCopyWith<$Res> {
  __$ChapterImagesCopyWithImpl(this._self, this._then);

  final _ChapterImages _self;
  final $Res Function(_ChapterImages) _then;

/// Create a copy of ChapterImages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? images = null,}) {
  return _then(_ChapterImages(
null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
