import 'package:auto_route/auto_route.dart';
import 'package:pokedex/presentation/home_app_screen.dart';

import '../presentation/usuari_screen.dart';
import '../presentation/carga_screen.dart';
import '../presentation/home_screen.dart';
import '../presentation/map_screen.dart';
import '../presentation/pokemon_screen.dart';
import '../presentation/pokemon_list_screen.dart';
import '../presentation/type_pokemon.dart';
import '../presentation/gen_pokemon.dart';

part 'app_router.g.dart';

@AutoRouterConfig(generateForDir: ['lib/presentation', 'lib/application'])
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CarregaRoute.page, initial: true, path: '/loading'),
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(page: CasaRoute.page, path: 'home', initial: true),
            AutoRoute(page: MapaRoute.page, path: 'mapa'),
            AutoRoute(
              page: LlistaRoute.page, 
              path: 'llista',
              children: [
                AutoRoute(page: PokemonRoute.page, path: 'pokemon', initial: true),
                AutoRoute(page: TipusRoute.page, path: 'tipus'),
                AutoRoute(page: GenRoute.page, path: 'generacio'),
              ]),
            AutoRoute(page: UsuariRoute.page, path: 'usuari'),
          ],
        ),
      ];
}