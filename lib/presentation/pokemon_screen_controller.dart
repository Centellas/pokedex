import 'package:pokedex/data/pokemon_data.dart';

import '../domain/pokemon_model.dart';

class PokemonScreenController {
  final PokemonRepositori pokemonRepo = PokemonRepositori();
  /*
  Future<List<Pokemon>> fetchPokemon(int total, int limit, int skip) async {
    return await pokemonRepo.getPokemons(limit, skip ).pokemons;
  }
  */
  
  Future<PokemonPage> fetchPokemons(int limit, int skip) async {
    
    return await pokemonRepo.getPokemons(limit:limit, skip:skip);
  }
  
}

class TipusScreenController {
  final TypeRepositori pokemonRepo = TypeRepositori();

  Future<PokemonPage> fetchPokemons(String type, int limit, int skip) async {
    
    return await pokemonRepo.getType(type:type, limit:limit, skip: skip);
  }
}

class GeneracioScreenController {
  final GenRepositori pokemonRepo = GenRepositori();
  
  Future<PokemonPage> fetchGeneration(int gen, int limit, int skip) async {
  
    return await pokemonRepo.getGeneracio(gen:gen, limit:limit, skip:skip);
  }
  /*Future<Pokemon> fetchPokemons() async {
    return await pokemonRepo.getPokemon();
  }*/
}