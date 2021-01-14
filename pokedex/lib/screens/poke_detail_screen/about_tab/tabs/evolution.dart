import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/widgets/cached_image.dart';

class Evolution extends StatefulWidget {
  @override
  _EvolutionState createState() => _EvolutionState();
}

class _EvolutionState extends State<Evolution> {
  PokeApiStore _pokeApiStore = getIt.get<PokeApiStore>();

  Widget resizePokemon(Widget widget) {
    return SizedBox(height: 80, width: 80, child: widget);
  }

  List<Widget> getEvolucao(Pokemon pokemon) {
    List<Widget> _list = [];
    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((f) {
        _list.add(resizePokemon(cachedImage(id: f.num, suffix: '-evo')));
        _list.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        _list.add(Icon(Icons.keyboard_arrow_down));
      });
    }
    _list.add(resizePokemon(
        cachedImage(id: _pokeApiStore.pokemon.num, suffix: "-evo")));
    _list.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          _pokeApiStore.pokemon.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (pokemon.nextEvolution != null) {
      _list.add(Icon(Icons.keyboard_arrow_down));
      pokemon.nextEvolution.forEach((f) {
        _list.add(resizePokemon(cachedImage(id: f.num, suffix: "-evo")));
        _list.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        if (pokemon.nextEvolution.last.name != f.name) {
          _list.add(Icon(Icons.keyboard_arrow_down));
        }
      });
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          Pokemon pokemon = _pokeApiStore.pokemon;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getEvolucao(pokemon),
            ),
          );
        }),
      ),
    );
  }
}
