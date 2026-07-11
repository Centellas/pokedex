import 'package:flutter/material.dart';

import '../data/pokemon_data.dart'; //'../data/poke_data.dart';
import '../presentation/pokemon_card.dart';//'../widgets/poke_card.dart';

class CardLayoutScreen extends StatelessWidget {
  const CardLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card composada')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          PokeCard(pokemon: pokes.first),
          PokeCard(pokemon: pokes[2]),
          PokeCard(pokemon: pokes[3]),
        ],
      ),
    );
  }
}