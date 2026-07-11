import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/application/app_router.dart';

//import 'package:pokedex/presentation/home_screen.dart';
//import 'package:pokedex/presentation/pokemon_screen.dart';

@RoutePage()
class CarregaPantalla extends StatefulWidget{
  const CarregaPantalla({super.key});

  @override
  State<CarregaPantalla> createState() => _CarregaPantalla();
}


class _CarregaPantalla extends State<CarregaPantalla> with TickerProviderStateMixin{

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: const Offset(0, 0),
    end: const Offset(0, 2),
  ).animate(
      CurvedAnimation(parent: _controlador, curve: Curves.bounceOut),
    ); 

  late final AnimationController _controlador = AnimationController(
    vsync: this, 
    duration: const Duration(seconds: 2),
  );

  late final AnimationController _opacitatC = AnimationController(
    vsync: this, 
    duration: const Duration(milliseconds: 800),
  )..repeat(reverse: true);

  late final Animation<double> _opacitat = Tween<double>(begin: 0.35, end: 1.0)
    .animate(
      CurvedAnimation(parent: _opacitatC, curve: Curves.easeInOut),
    );

  @override
  void initState(){
    super.initState();
    _controlador.repeat();
    Future.delayed(const Duration(seconds: 30), () {
      if (!mounted) return;
      /* Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const PokemonScreen(estaActiva: true)));*/
      context.router.replace(LlistaRoute());
    });
  }


  @override
  void dispose(){
    _controlador.dispose();
    _opacitatC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                position: _animation, 
                child: RotationTransition(
                  turns: _controlador,
                  child: Image.asset('assets/images/pokeball.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(height: 144),
              FadeTransition(
                opacity: _opacitat,
                child: Text(
                'Carregant...',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ), 
    );
  }
}