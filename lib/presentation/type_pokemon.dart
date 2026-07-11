import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:pokedex/presentation/type_list_pokemon.dart';

@RoutePage()
class TipusScreen extends StatefulWidget {
  const TipusScreen ({super.key});

  @override
  State<TipusScreen> createState() => _TipusScreenState(); 
}

class _TipusScreenState extends State<TipusScreen>{
  final _formKey = GlobalKey<FormState>();
  static const _tipus = ['normal', 'fighting', 'flying', 'poison', 'ground',
  'rock', 'bug', 'ghost', 'steel', 'fire','water','grass','electric','psychic',
  'ice', 'dragon', 'dark','fairy', 'stellar', 'unknown'];
  
  String type = 'unknown';// = 'normal';
  bool actiu = false;

  
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
                        for (final r in _tipus)
                          DropdownMenuItem(
                            value: r, 
                            child: Text(r),
                          ),
                      ],
                       onChanged: (String? nouValor) {
                        setState(() {
                          if (nouValor!=null){
                            type = nouValor;
                            actiu = true;
                          } // Guardem la resposta!
                        });
                      },
                     // selectedItemBuilder: fetchPokemons(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Text ('Hola $type, Hola $actiu'),
            TipusListScreen(type: type, estaActiva: actiu),
          ],
        ),
      ),
    );
  }
}
     