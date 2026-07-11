//import 'dart:collection';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

String _typeFromJson(List<dynamic> types) =>
    types.first['type']['name'] as String;

String _imageUrlFromJson(Map<String, dynamic> sprites) {
  final other = sprites['other'] as Map<String, dynamic>?;
  final artwork = other?['official-artwork'] as Map<String, dynamic>?;
  return artwork?['front_default'] as String? ??
      sprites['front_default'] as String;
}

Object? _readTypes(Object? json, String key) => (json as Map)['types'];

Color _colorFromTypes(List<dynamic> types) =>
    _colorForType(types.first['type']['name'] as String);


class Tipus{
  Tipus({
    required this.nom,
    required this.pokemon,
  });

  final String nom;
  final List<Pokemon> pokemon;

  factory Tipus.fromJson(Map<String, dynamic> json) {
    return Tipus(
      nom: json['name'] as String,
      pokemon: (json['pokemon'] as List<dynamic>).cast<Pokemon>(),
    );
  }

  Map<String, dynamic> toJson() => {
    'nom': nom,
    'pokemon': pokemon,
  };
}

@freezed
abstract class Pokemon with _$Pokemon{
  const factory Pokemon({
    required int id,
    required String name,
    @JsonKey(name: 'types', fromJson: _typeFromJson)
    required String type,
    @JsonKey(name: 'sprites', fromJson: _imageUrlFromJson)
    required String imageUrl,
    @JsonKey(
      readValue: _readTypes,
      fromJson: _colorFromTypes,
      includeToJson: false,
    )
    required Color color,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@freezed
abstract class PokemonPage with _$PokemonPage {
  const factory PokemonPage({
    required List<Pokemon> pokemons,
    required int total,
    required int nextOffset,
    required bool hasMore,
  }) = _PokemonPage;

  factory PokemonPage.fromJson(Map<String, dynamic> json) =>
      _$PokemonPageFromJson(json);
}

Color _colorForType(String typeName) {
  return switch (typeName) {
    'grass' => const Color(0xFF78C850),
    'poison' => const Color(0xFFA33EA1),
    'fire' => const Color(0xFFF08030),
    'water' => const Color(0xFF6890F0),
    'electric' => const Color(0xFFF8D030),
    'psychic' => const Color(0xFFF85888),
    'ice' => const Color(0xFF98D8D8),
    'dragon' => const Color(0xFF7038F8),
    'dark' => const Color(0xFF705848),
    'fairy' => const Color(0xFFEE99AC),
    'normal' => const Color(0xFFA8A878),
    'fighting' => const Color(0xFFC03028),
    'flying' => const Color(0xFFA890F0),
    'ground' => const Color(0xFFE0C068),
    'rock' => const Color(0xFFB8A038),
    'bug' => const Color(0xFFA8B820),
    'ghost' => const Color(0xFF705898),
    'steel' => const Color(0xFFB8B8D0),
    _ => const Color(0xFFA8A878),
  };
}

class PokemonData {
  const PokemonData({
    required this.id,
    required this.name,
    required this.type,
    required this.imagePath,
    required this.color,
  });

  final int id;
  final String name;
  final String type;
  final String imagePath;
  final Color color;
}

