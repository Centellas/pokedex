import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:pokedex/data/pokemon_data.dart';
import 'package:pokedex/domain/pokemon_model.dart';
import 'package:pokedex/presentation/pokemon_card.dart';
import 'package:pokedex/presentation/pokemon_screen_controller.dart';

const int cataleg = 1351;
const int pag = 20;

class TipusListScreen extends StatefulWidget {
  final String type; final bool estaActiva;
  const TipusListScreen({super.key, required this.type, required this.estaActiva});

  @override
  State<TipusListScreen> createState() => _TipusListScreenState(); 
}

class _TipusListScreenState extends State<TipusListScreen>{
  final _repositori = TypeRepositori();
  final _scroll = ScrollController();
  final TipusScreenController controller = TipusScreenController();
  final List<Pokemon> _pokemons = [];
  late Future<PokemonPage>? pokemon;

  int _skip = 0;
  bool _loading = false;
  bool _hasMore = true;
  String? _error;

  void _onScroll() {
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
      _loadNext();
    }
  }

  Future<void> fetchPokemon(String type, int limit, int skip) async {
    pokemon = controller.fetchPokemons(type, limit, skip);
  }

  Future<void> _loadNext() async {
    if (_loading || !_hasMore) return;
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final page = await _repositori.getType(type: widget.type, limit: 25, skip: _skip);

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
    Future.delayed(const Duration(seconds:60),(){
    });
    _scroll.addListener(_onScroll);
    if(widget.estaActiva){
      _loadNext();
    }
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
     