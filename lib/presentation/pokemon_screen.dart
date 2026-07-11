import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';

import 'package:pokedex/data/pokemon_data.dart';
import 'package:pokedex/domain/pokemon_model.dart';
import 'package:pokedex/presentation/pokemon_card.dart';
import 'package:pokedex/presentation/pokemon_screen_controller.dart';



const int cataleg = 1351;
const int pag = 20;

@RoutePage()
class PokemonScreen extends StatefulWidget {
  //final bool estaActiva;
  
  const PokemonScreen ({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState(); 
}

class _PokemonScreenState extends State<PokemonScreen>{
  final _repositori = PokemonRepositori();
  final _scroll = ScrollController();
  final PokemonScreenController controller = PokemonScreenController();
  final List<Pokemon> _pokemons = [];
  late Future<Pokemon> pokemon;

  int _skip = 0;
  bool _loading = false;
  bool _hasMore = true;
  String? _error;

  void _onScroll() {
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
      _loadNext();
    }
  }

  Future<void> _loadNext() async {
    if (_loading || !_hasMore) return;
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final page = await _repositori.getPokemons(limit: 25, skip: _skip);

      setState(() {
        _pokemons.addAll(page.pokemons);
        _skip += pag;
        _hasMore = _skip < cataleg;
      });
    } on DioException catch (e) {
      if (!mounted) return;
      final status = e.response?.statusCode;
      _error = status != null
          ? 'HTTP $status'
          : 'Error de xarxa: ${e.message ?? e}';
    } catch (e) {
      if (!mounted) return;
      _error = 'Error de xarxa: $e';
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _pokemons.clear();
      _skip = 0;
      _hasMore = true;
      _error = null;
    });
    await _loadNext();
  }

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    _loadNext();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          controller: _scroll, 
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemCount: _pokemons.length + 1,
          itemBuilder: (context, i){
            if (i == _pokemons.length){
              if (_error != null) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(_error!, textAlign: TextAlign.center),
                );
              }
              if (_loading) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (!_hasMore){
                return const Padding(
                padding: EdgeInsets.all(16),
                child: Text('— Fi de la llista —', textAlign: TextAlign.center),
                );
              }
            }
            final item = _pokemons[i];
            return SizedBox(
              width: double.infinity,
              height: 200,
              child: Poke2Card(pokemon: item),
            );
            },
          ),
        ),
      );
  }
}
     