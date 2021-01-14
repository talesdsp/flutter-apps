import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/store/pokeapiv2_store.dart';
import 'package:pokedex/widgets/circular_progress_about.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  PokeApiV2Store _pokeApiV2Store;
  PokeApiStore _pokeApiStore;
  @override
  void initState() {
    super.initState();
    _pokeApiV2Store = getIt.get<PokeApiV2Store>();
    _pokeApiStore = getIt.get<PokeApiStore>();
  }

  @override
  Widget build(BuildContext context) {
    Specie _specie;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Descrição',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              _specie = _pokeApiV2Store.specie;
              return SizedBox(
                height: 70,
                child: SingleChildScrollView(
                  child: _specie != null
                      ? Text(
                          _specie.flavorTextEntries
                              .where((item) => item.language.name == 'en')
                              .first
                              .flavorText
                              .replaceAll('\n', ' ')
                              .replaceAll('\f', ' ')
                              .replaceAll('POKéMON', 'Pokémon'),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      : CircularProgressAbout(),
                ),
              );
            }),
            SizedBox(
              height: 10,
            ),
            Text(
              'Biologia',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Observer(builder: (context) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Altura',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          _pokeApiStore.pokemon.height,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Peso',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          _pokeApiStore.pokemon.weight,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
