import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../application/app_router.dart';



@RoutePage()
class LlistaScreen extends StatelessWidget {
  //final bool estaActiva;
  
  const LlistaScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AutoTabsScaffold(
        routes: const [
          PokemonRoute(),
          TipusRoute(),
          GenRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          return NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.list_outlined),
                selectedIcon: const Icon(Icons.list),
                label: 'Pokemons',
              ),
              NavigationDestination(
                icon: const Icon(Icons.light_outlined),
                selectedIcon: const Icon(Icons.light),
                label: 'Tipus',
              ),
              NavigationDestination(
                icon: const Icon(Icons.map_outlined),
                selectedIcon: const Icon(Icons.map),
                label: 'Generació',
              ),
            ],
          );
        },
        appBarBuilder: (context, tabsRouter) {
          final title = switch (tabsRouter.activeIndex) {
            0 => 'Pokemons',
            1 => 'Tipus',
            2 => 'Generació',
            _ => 'Pokedex',
          };
          return AppBar(
            title: Text(title),
          );
        },
      ),
    );
  }
}