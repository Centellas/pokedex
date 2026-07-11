import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon_model.dart';

const pokes = <PokemonData>[
  PokemonData(
    id: 1,
    name: 'Bulbasaur',
    type: 'Grass / Poison',
    imagePath: 'assets/images/1.png',
    color: Color(0xFF78C850),
  ),
  PokemonData(
    id: 4,
    name: 'Charmander',
    type: 'Fire',
    imagePath: 'assets/images/4.png',
    color: Color(0xFFF08030),
  ),
  PokemonData(
    id: 7,
    name: 'Squirtle',
    type: 'Water',
    imagePath: 'assets/images/7.png',
    color: Color(0xFF6890F0),
  ),
  PokemonData(
    id: 25,
    name: 'Pikachu',
    type: 'Electric',
    imagePath: 'assets/images/25.png',
    color: Color(0xFFF8D030),
  ),
   PokemonData(
    id: 2,
    name: 'Ivysaur',
    type: 'Grass / Poison',
    imagePath: 'assets/images/2.png',
    color: Color(0xFF4E8234),
  ),
  PokemonData(
    id: 3,
    name: 'Venusaur',
    type: 'Grass / Poison',
    imagePath: 'assets/images/3.png',
    color: Color(0xFF4E8234),
  ),
  PokemonData(
    id: 39,
    name: 'Jigglypuff',
    type: 'Normal / Fairy',
    imagePath: 'assets/images/39.png',
    color: Color(0xFFEE99AC),
  ),
];

enum PokemonType {
  normal('Normal'),
  fire('Foc'),
  water('Aigua'),
  electric('Elèctric'),
  grass('Planta'),
  ice('Gel'),
  fighting('Lluita'),
  poison('Verí'),
  ground('Terra'),
  flying('Vol'),
  psychic('Psíquic'),
  bug('Insecte'),
  rock('Roca'),
  ghost('Fantasma'),
  dragon('Drac'),
  dark('Fosc'),
  steel('Acer'),
  fairy('Fada'),
  unknown('Desconegut');

  const PokemonType(this.label);

  final String label;

  static PokemonType fromApi(String raw) {
    final key = raw.toLowerCase().trim();
    for (final t in PokemonType.values) {
      if (t.name == key) return t;
    }
    return PokemonType.unknown;
  }
}

class PokemonBatchPage {
  const PokemonBatchPage({
    required this.pokemons,
    required this.nextOffset,
    required this.hasMore,
  });

  final List<Pokemon> pokemons;
  final int nextOffset;
  final bool hasMore;
}

class PokemonRepositori{
  PokemonRepositori({Dio? dio}) 
  : _dio = 
      dio ??
      Dio(
        BaseOptions(
          baseUrl: 'https://pokeapi.co/api/v2/',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );

  final Dio _dio;
/*Future<Pokemon> getPokemon() async{
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/16');
    return Pokemon.fromJson(response.data);
  }*/

  
  int _extractIdFromUrl(String url) {
    final segments = Uri.parse(url).pathSegments.where((s) => s.isNotEmpty);
    return int.parse(segments.last);
  }

  Future<PokemonPage> getPokemons({
    required int limit,
    required int skip,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/pokemon',
      queryParameters: {'limit': limit, 'skip': skip},
    );

    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida',
      );
    }
    
    final results = (data['results'] as List<dynamic>? ?? [])
        .cast<Map<String, dynamic>>();
    final nextUrl = data['next'] as String?;

    final futures = results.map((entry) {
      final url = entry['url'] as String;
      final id = _extractIdFromUrl(url);
      return fetchById(id);
    });

    final pokemons = await Future.wait(futures);
    return PokemonPage(
      pokemons: pokemons,
      total: pokemons.length,
      nextOffset: skip + results.length,
      hasMore: nextUrl != null && nextUrl.isNotEmpty,
    );
  }

   Future<Pokemon> fetchById(int id) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/pokemon/$id',
    );
    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida per al Pokémon $id',
      );
    }
    return _parsePokemon(data);
  }

  void close() => _dio.close();

  Pokemon _parsePokemon(Map<String, dynamic> data) {
    final id = (data['id'] as num).toInt();
    final name = _capitalize(data['name'] as String);

    final types = (data['types'] as List<dynamic>).cast<Map<String, dynamic>>();
    final firstType = types.isNotEmpty
        ? PokemonType.fromApi(
            (types.first['type'] as Map<String, dynamic>)['name'] as String,
          )
        : PokemonType.unknown;

    final sprites = data['sprites'] as Map<String, dynamic>?;
    final imageUrl = 
      (sprites?['front_default'] as String?) ?? 
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    final color = colorPerTipus(firstType.toString());

    return Pokemon(
      id: id,
      name: name,
      type: firstType.toString(),
      imageUrl: imageUrl,
      color: color,
    );
  }

  Color colorPerTipus(String typeName) {
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
  
   String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
}

class TypeRepositori{
   TypeRepositori({Dio? dio}) 
  : _dio = 
      dio ??
      Dio(
        BaseOptions(
          baseUrl: 'https://pokeapi.co/api/v2/',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );

  final Dio _dio;
  /*Future<Pokemon> getPokemon() async{
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/16');
    return Pokemon.fromJson(response.data);
  }*/

  
  int _extractIdFromUrl(String url) {
    final segments = Uri.parse(url).pathSegments.where((s) => s.isNotEmpty);
    return int.parse(segments.last);
  }

  Future<PokemonPage> getType({
    required String type,
    required int limit,
    required int skip,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/type/$type',
      queryParameters: {'limit': limit, 'skip': skip},
    );

    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida',
      );
    }
    
    final results = (data['results'] as List<dynamic>? ?? [])
        .cast<Map<String, dynamic>>();
    final nextUrl = data['next'] as String?;

    final futures = results.map((entry) {
      final url = entry['url'] as String;
      final id = _extractIdFromUrl(url);
      return fetchById(id);
    });

    final pokemons = await Future.wait(futures);
    return PokemonPage(
      pokemons: pokemons,
      total: pokemons.length,
      nextOffset: skip + results.length,
      hasMore: nextUrl != null && nextUrl.isNotEmpty,
    );
  }

   Future<Pokemon> fetchById(int id) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/pokemon/$id',
    );
    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida per al Pokémon $id',
      );
    }
    return _parsePokemon(data);
  }

  void close() => _dio.close();

  Pokemon _parsePokemon(Map<String, dynamic> data) {
    final id = (data['id'] as num).toInt();
    final name = _capitalize(data['name'] as String);

    final types = (data['types'] as List<dynamic>).cast<Map<String, dynamic>>();
    final firstType = types.isNotEmpty
        ? PokemonType.fromApi(
            (types.first['type'] as Map<String, dynamic>)['name'] as String,
          )
        : PokemonType.unknown;

    final sprites = data['sprites'] as Map<String, dynamic>?;
    final imageUrl = 
      (sprites?['front_default'] as String?) ?? 
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    final color = colorPerTipus(firstType.toString());

    return Pokemon(
      id: id,
      name: name,
      type: firstType.toString(),
      imageUrl: imageUrl,
      color: color,
    );
  }

  Color colorPerTipus(String typeName) {
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
  
   String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  Future<Tipus> getTipus(/*String type*/) async{
    //final response = await Dio().get('https://pokeapi.co/api/v2/type/$type/');
    final response = await Dio().get('https://pokeapi.co/api/v2/type/normal/');
    return Tipus.fromJson(response.data);
  }

  Future</*List<*/Pokemon>/*>*/ getPokemons(Tipus p) async{
    //final List<Pokemon> poke
    //for (final r in p.pokemon)
    final int n = p.pokemon.first.id; 
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$n');
    return Pokemon.fromJson(response.data);
  }
}

class GenRepositori{
  GenRepositori({Dio? dio}) 
  : _dio = 
      dio ??
      Dio(
        BaseOptions(
          baseUrl: 'https://pokeapi.co/api/v2/generation',
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );

  final Dio _dio;
/*Future<Pokemon> getPokemon() async{
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/16');
    return Pokemon.fromJson(response.data);
  }*/

  
  int _extractIdFromUrl(String url) {
    final segments = Uri.parse(url).pathSegments.where((s) => s.isNotEmpty);
    return int.parse(segments.last);
  }

  Future<PokemonPage> getGeneracio({
    required int gen,
    required int limit,
    required int skip,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/$gen',
      queryParameters: {'limit': limit, 'skip': skip},
    );

    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida',
      );
    }
    
    final results = (data['results'] as List<dynamic>? ?? [])
        .cast<Map<String, dynamic>>();
    final nextUrl = data['next'] as String?;

    final futures = results.map((entry) {
      final url = entry['url'] as String;
      final id = _extractIdFromUrl(url);
      return fetchById(id);
    });

    final pokemons = await Future.wait(futures);
    return PokemonPage(
      pokemons: pokemons,
      total: pokemons.length,
      nextOffset: skip + results.length,
      hasMore: nextUrl != null && nextUrl.isNotEmpty,
    );
  }

   Future<Pokemon> fetchById(int id) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '/pokemon/$id',
    );
    final data = res.data;
    if (data == null) {
      throw DioException(
        requestOptions: res.requestOptions,
        message: 'Resposta buida per al Pokémon $id',
      );
    }
    return _parsePokemon(data);
  }

  void close() => _dio.close();

  Pokemon _parsePokemon(Map<String, dynamic> data) {
    final id = (data['id'] as num).toInt();
    final name = _capitalize(data['name'] as String);

    final types = (data['types'] as List<dynamic>).cast<Map<String, dynamic>>();
    final firstType = types.isNotEmpty
        ? PokemonType.fromApi(
            (types.first['type'] as Map<String, dynamic>)['name'] as String,
          )
        : PokemonType.unknown;

    final sprites = data['sprites'] as Map<String, dynamic>?;
    final imageUrl = 
      (sprites?['front_default'] as String?) ?? 
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    final color = colorPerTipus(firstType.toString());

    return Pokemon(
      id: id,
      name: name,
      type: firstType.toString(),
      imageUrl: imageUrl,
      color: color,
    );
  }

  Color colorPerTipus(String typeName) {
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
  
   String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
  Future<Pokemon> getPokemon(int gen) async{
    final response = await Dio().get('https://pokeapi.co/api/v2/generation/$gen');
    return Pokemon.fromJson(response.data.pokemon);
  }
}