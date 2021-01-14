import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/store/pokeapi_store.dart';

class CircularProgressAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              getIt.get<PokeApiStore>().getColor(),
            ),
          ),
        ),
      ),
    );
  }
}
