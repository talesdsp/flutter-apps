import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/screens/home_screen/home_screen.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/store/pokeapiv2_store.dart';

final GetIt getIt = GetIt.I;
void main() {
  getIt.registerSingleton<PokeApiStore>(PokeApiStore());
  getIt.registerSingleton<PokeApiV2Store>(PokeApiV2Store());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
