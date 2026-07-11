// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pokemon _$PokemonFromJson(Map<String, dynamic> json) => _Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: _typeFromJson(json['types'] as List),
  imageUrl: _imageUrlFromJson(json['sprites'] as Map<String, dynamic>),
  color: _colorFromTypes(_readTypes(json, 'color') as List),
);

Map<String, dynamic> _$PokemonToJson(_Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'types': instance.type,
  'sprites': instance.imageUrl,
  'color': instance.color,
};

_PokemonPage _$PokemonPageFromJson(
  Map<String, dynamic> json,
) => _PokemonPage(
  pokemons: (json['pokemons'] as List<dynamic>)
      .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  nextOffset: (json['nextOffset'] as num).toInt(),
  hasMore: (json['hasMore'] as bool),

);

Map<String, dynamic> _$PokemonPageToJson(
  _PokemonPage instance,
) => <String, dynamic>{
  'pokemons': instance.pokemons, 
  'total': instance.total, 
  'nextOffset': instance.nextOffset, 
  'hasMore': instance.hasMore, 
  };
