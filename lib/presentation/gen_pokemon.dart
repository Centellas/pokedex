import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:pokedex/presentation/gen_list_pokemon.dart';

@RoutePage()
class GeneracioScreen extends StatefulWidget {
  const GeneracioScreen ({super.key});

  @override
  State<GeneracioScreen> createState() => _GeneracioScreenState(); 
}

class _GeneracioScreenState extends State<GeneracioScreen>{

  final _formKey = GlobalKey<FormState>();
  static const _generacio = ['Primera', 'Segona', 'Tercera', 'Quarta', 'Cinquena',
  'Sisena', 'Setena', 'Vuitena', 'Novena'];
  String? _genera;
  int gen = 1;
  bool actiu = false;

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

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            FormField<String>(
              validator: (v) => v == null ? 'Tria un tipus.' : null,
              builder: (state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Tipus',
                    border: const OutlineInputBorder(),
                    errorText: state.errorText,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Selecciona'),
                      value: state.value,
                      items: [
                        for (final r in _generacio)
                          DropdownMenuItem(
                            value: r, 
                           // onTap: fetchPokemons(r),
                            child: Text(r),
                          ),
                      ],
                      onChanged: (String? nouValor) {
                        setState(() {
                          if (nouValor!=null){
                            gen=canvi(nouValor);
                            _genera = nouValor;
                            actiu = true;
                          } // Guardem la resposta!
                        });
                      },
                      //onChanged: state.didChange,
                     // selectedItemBuilder: fetchPokemons(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Text ('Hola $_genera, Hola $gen, $actiu'),
            GeneracioListScreen(generacio: gen, estaActiva: actiu),
          ],
        ),
      ),
    );
  }
}
 