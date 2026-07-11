import 'package:flutter/material.dart';

import '../domain/pokemon_model.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key, required this.pokemon});

  final PokemonData pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(pokemon.imagePath, width: 72, height: 72),
                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pokemon.name, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: pokemon.color.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        pokemon.type,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: pokemon.color.withValues(alpha: 0.95),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Poke2Card extends StatelessWidget {
  const Poke2Card({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: pokemon.color.withValues(alpha:0.3),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        hoverColor: pokemon.color.withValues(alpha: 0.5),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.network(pokemon.imageUrl, width: 120, height: 120),
                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(pokemon.name, style: theme.textTheme.titleLarge),
                ),
            ],
          ),
        ),
      ),
    );
  }
}