import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../application/app_router.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  bool _wasInBackground = false;
 
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _wasInBackground = true;
    } else if (state == AppLifecycleState.resumed && _wasInBackground) {
      _wasInBackground = false;
      _benvingut();
    }
  }

  Future _benvingut() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Benvingut de nou'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('D\'acord'),
          ),
        ],
      ),
    );
  }

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).textTheme;

    return AutoTabsScaffold(
      routes: const [
        CasaRoute(),
        MapaRoute(),
        LlistaRoute(),
        UsuariRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: [
             NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: 'Inici',
            ),
            NavigationDestination(
              icon: const Icon(Icons.map_outlined),
              selectedIcon: const Icon(Icons.map),
              label: 'Mapa',
            ),
            NavigationDestination(
              icon: const Icon(Icons.list_outlined),
              selectedIcon: const Icon(Icons.list),
              label: 'Llista',
            ),
            NavigationDestination(
              icon: const Icon(Icons.person_2_outlined),
              selectedIcon: const Icon(Icons.person),
              label: 'Usuari',
            ),
          ],
        );
      },
      appBarBuilder: (context, tabsRouter) {
        final title = switch (tabsRouter.activeIndex) {
          0 => 'Casa',
          1 => 'Mapa',
          2 => 'Llista',
          3 => 'Usuari',
          _ => 'Pokedex',
        };
        return AppBar(
          title: Text(title),
        );
      },
    );
  }
}
    /*  Scaffold(
      appBar: AppBar(title: const Text('Pokedex'), backgroundColor: Color.fromRGBO(168, 4, 62, 1)), 
      body:IndexedStack(
        index: _index,
        children: [
          HAppScreen(),
          MapScreen(), 
          CarregaPantalla(), 
          UsuariScreen(),
          ],
      ),
      drawer:Drawer(child: Column(children: [Text('Drawer')])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Color.fromARGB(128, 2, 72, 138),
        unselectedItemColor: Color.fromRGBO(2, 72, 138, 0.5) ,
        onTap: (index) => setState(() => _index = index ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'App'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label:'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label:'Llista'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}*/