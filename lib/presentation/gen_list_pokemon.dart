import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:pokedex/data/pokemon_data.dart';
import 'package:pokedex/domain/pokemon_model.dart';
import 'package:pokedex/presentation/pokemon_card.dart';
import 'package:pokedex/presentation/pokemon_screen_controller.dart';

const int cataleg = 1351;
const int pag = 20;

class GeneracioListScreen extends StatefulWidget {
   final int generacio; final bool estaActiva;
  const GeneracioListScreen ({super.key, required this.generacio, required this.estaActiva});

  @override
  State<GeneracioListScreen> createState() => _GeneracioListScreenState(); 
}

class _GeneracioListScreenState extends State<GeneracioListScreen>{
  final PokemonScreenController controller = PokemonScreenController();
  late Future<PokemonPage>? pokemon;
  final _repositori = GenRepositori();
  final _scroll = ScrollController();
  final List<Pokemon> _pokemons = [];
  
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
      final page = await _repositori.getGeneracio(gen: widget.generacio, limit: 25, skip: _skip);

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

  int canvi(String a) {
    if(a == 'Primera'){ return 1;
    }else{ if(a == 'Segona'){ return 2;
      }else{ if(a == 'Primera'){ return 3;
        }else{ if(a == 'Primera'){ return 4;
          }else{ if(a == 'Cinquena'){ return 5;
            }else{ if(a == 'Sisena'){ return 6;
              }else{ if(a == 'Setena'){ return 7;
                }else{ if(a == 'Vuitena'){ return 8;
                  }else{ if(a == 'Novena'){ return 9; 
                    }else{
                      return 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
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
      body:RefreshIndicator(
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
 