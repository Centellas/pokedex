import 'package:flutter/material.dart';

import '../data/pokemon_data.dart'; //'../data/poke_data.dart';
import '../presentation/pokemon_card.dart';//'../widgets/poke_card.dart';

class ProvaScreen extends StatelessWidget {
  const ProvaScreen({super.key, required this.title});

  final String title;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Pokedex Demo')), 
      body: Center(child:ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PokeCard(pokemon: pokes.first),
          PokeCard(pokemon: pokes[4]),
          PokeCard(pokemon: pokes[5]),
          PokeCard(pokemon: pokes[1]),
          PokeCard(pokemon: pokes[2]),
          PokeCard(pokemon: pokes[3]),
          PokeCard(pokemon: pokes[6]),
        ],
      ),
      ),
      drawer:Drawer(child: Column(children: [Text('Drawer')])),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label:'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label:'Llista'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),    
    );
  }
}