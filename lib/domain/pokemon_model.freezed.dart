// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pokemon {

 int get id; String get name;@JsonKey(name: 'types', fromJson: _typeFromJson) String get type;@JsonKey(name: 'sprites', fromJson: _imageUrlFromJson) String get imageUrl;@JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false) Color get color;
/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonCopyWith<Pokemon> get copyWith => _$PokemonCopyWithImpl<Pokemon>(this as Pokemon, _$identity);

  /// Serializes this Pokemon to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pokemon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,imageUrl,color);

@override
String toString() {
  return 'Pokemon(id: $id, name: $name, type: $type, imageUrl: $imageUrl, color: $color)';
}


}

/// @nodoc
abstract mixin class $PokemonCopyWith<$Res>  {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) _then) = _$PokemonCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'types', fromJson: _typeFromJson) String type,@JsonKey(name: 'sprites', fromJson: _imageUrlFromJson) String imageUrl,@JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false) Color color
});




}
/// @nodoc
class _$PokemonCopyWithImpl<$Res>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._self, this._then);

  final Pokemon _self;
  final $Res Function(Pokemon) _then;

/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? imageUrl = null,Object? color = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [Pokemon].
extension PokemonPatterns on Pokemon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pokemon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pokemon value)  $default,){
final _that = this;
switch (_that) {
case _Pokemon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pokemon value)?  $default,){
final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'types', fromJson: _typeFromJson)  String type, @JsonKey(name: 'sprites', fromJson: _imageUrlFromJson)  String imageUrl, @JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false)  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.imageUrl,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'types', fromJson: _typeFromJson)  String type, @JsonKey(name: 'sprites', fromJson: _imageUrlFromJson)  String imageUrl, @JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false)  Color color)  $default,) {final _that = this;
switch (_that) {
case _Pokemon():
return $default(_that.id,_that.name,_that.type,_that.imageUrl,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'types', fromJson: _typeFromJson)  String type, @JsonKey(name: 'sprites', fromJson: _imageUrlFromJson)  String imageUrl, @JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false)  Color color)?  $default,) {final _that = this;
switch (_that) {
case _Pokemon() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.imageUrl,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pokemon implements Pokemon {
  const _Pokemon({required this.id, required this.name, @JsonKey(name: 'types', fromJson: _typeFromJson) required this.type, @JsonKey(name: 'sprites', fromJson: _imageUrlFromJson) required this.imageUrl, @JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false) required this.color});
  factory _Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'types', fromJson: _typeFromJson) final  String type;
@override@JsonKey(name: 'sprites', fromJson: _imageUrlFromJson) final  String imageUrl;
@override@JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false) final  Color color;

/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonCopyWith<_Pokemon> get copyWith => __$PokemonCopyWithImpl<_Pokemon>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pokemon&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,imageUrl,color);

@override
String toString() {
  return 'Pokemon(id: $id, name: $name, type: $type, imageUrl: $imageUrl, color: $color)';
}


}

/// @nodoc
abstract mixin class _$PokemonCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$PokemonCopyWith(_Pokemon value, $Res Function(_Pokemon) _then) = __$PokemonCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'types', fromJson: _typeFromJson) String type,@JsonKey(name: 'sprites', fromJson: _imageUrlFromJson) String imageUrl,@JsonKey(readValue: _readTypes, fromJson: _colorFromTypes, includeToJson: false) Color color
});




}
/// @nodoc
class __$PokemonCopyWithImpl<$Res>
    implements _$PokemonCopyWith<$Res> {
  __$PokemonCopyWithImpl(this._self, this._then);

  final _Pokemon _self;
  final $Res Function(_Pokemon) _then;

/// Create a copy of Pokemon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? imageUrl = null,Object? color = null,}) {
  return _then(_Pokemon(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}


/// @nodoc
mixin _$PokemonPage {

 List<Pokemon> get pokemons; int get total; int get nextOffset; bool get hasMore;
/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonPageCopyWith<PokemonPage> get copyWith => _$PokemonPageCopyWithImpl<PokemonPage>(this as PokemonPage, _$identity);

  /// Serializes this PaginationProductsPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonPage&&const DeepCollectionEquality().equals(other.pokemons, pokemons)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pokemons),total);

@override
String toString() {
  return 'PaginationProductsPage(products: $pokemons, total: $total)';
}


}

/// @nodoc
abstract mixin class $PokemonPageCopyWith<$Res>  {
  factory $PokemonPageCopyWith(PokemonPage value, $Res Function(PokemonPage) _then) = _$PokemonPageCopyWithImpl;
@useResult
$Res call({
 List<Pokemon> pokemons, int total, int nextOffset, bool hasMore
});




}
/// @nodoc
class _$PokemonPageCopyWithImpl<$Res>
    implements $PokemonPageCopyWith<$Res> {
  _$PokemonPageCopyWithImpl(this._self, this._then);

  final PokemonPage _self;
  final $Res Function(PokemonPage) _then;

/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemons = null,Object? total = null,Object? nextOffset= null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
pokemons: null == pokemons ? _self.pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int, nextOffset: null == nextOffset ? _self.nextOffset : nextOffset
as int, hasMore: null == hasMore ? _self.hasMore : hasMore 
as bool,

  ));
}

}


/// Adds pattern-matching-related methods to [PokemonPage].
extension PokemonPagePatterns on PokemonPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonPage value)  $default,){
final _that = this;
switch (_that) {
case _PokemonPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonPage value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Pokemon> pokemons,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonPage() when $default != null:
return $default(_that.pokemons,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Pokemon> pokemons,  int total)  $default,) {final _that = this;
switch (_that) {
case _PokemonPage():
return $default(_that.pokemons,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Pokemon> pokemons,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PokemonPage() when $default != null:
return $default(_that.pokemons,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonPage implements PokemonPage {
  const _PokemonPage({required final List<Pokemon> pokemons, required this.total, required this.nextOffset, required this.hasMore}): _pokemons = pokemons;
  factory _PokemonPage.fromJson(Map<String, dynamic> json) => _$PokemonPageFromJson(json);

 final  List<Pokemon> _pokemons;
@override List<Pokemon> get pokemons {
  if (_pokemons is EqualUnmodifiableListView) return _pokemons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pokemons);
}

@override final int total;
@override final int nextOffset;
@override final bool hasMore;

/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonPageCopyWith<_PokemonPage> get copyWith => __$PokemonPageCopyWithImpl<_PokemonPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonPage&&const DeepCollectionEquality().equals(other._pokemons, _pokemons)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pokemons),total);

@override
String toString() {
  return 'PokemonsPage(products: $pokemons, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PokemonPageCopyWith<$Res> implements $PokemonPageCopyWith<$Res> {
  factory _$PokemonPageCopyWith(_PokemonPage value, $Res Function(_PokemonPage) _then) = __$PokemonPageCopyWithImpl;
@override @useResult
$Res call({
 List<Pokemon> pokemons, int total, int nextOffset, bool hasMore
});




}
/// @nodoc
class __$PokemonPageCopyWithImpl<$Res>
    implements _$PokemonPageCopyWith<$Res> {
  __$PokemonPageCopyWithImpl(this._self, this._then);

  final _PokemonPage _self;
  final $Res Function(_PokemonPage) _then;

/// Create a copy of PaginationProductsPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemons = null,Object? total = null, Object? nextOffset= null,Object? hasMore = null, }) {
  return _then(_PokemonPage(
pokemons: null == pokemons ? _self._pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int, nextOffset: null == nextOffset ? _self.nextOffset : nextOffset
as int, hasMore: null == hasMore ? _self.hasMore : hasMore
as bool,
  ));
}


}


// dart format on