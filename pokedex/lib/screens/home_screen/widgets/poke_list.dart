import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/common/utils.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/poke_detail_screen/poke_detail_screen.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/widgets/cached_image.dart';
import 'package:pokedex/widgets/pokemon_types.dart';
import 'package:pokedex/widgets/white_pokeball.dart';

class PokeList extends StatefulWidget {
  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  PokeApiStore pokemonStore;

  @override
  void initState() {
    super.initState();

    pokemonStore = getIt.get<PokeApiStore>();
    if (pokemonStore.pokeApi == null) {
      pokemonStore.fetchPokemonList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    final landscapeColumnCount = screenSize > 850.0
        ? 5
        : screenSize > 560
            ? 4
            : 3;

    final isPortraitDevice =
        MediaQuery.of(context).orientation == Orientation.portrait;

    int gridCount = isPortraitDevice ? 2 : landscapeColumnCount;

    return Expanded(
      flex: 1,
      child: Container(
        child: Observer(
          name: 'PokeList@Observer',
          builder: (BuildContext context) {
            return (pokemonStore?.pokeApi == null)
                ? Center(child: CircularProgressIndicator())
                : AnimationLimiter(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(12),
                      addAutomaticKeepAlives: true,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridCount,
                      ),
                      itemCount: pokemonStore.pokeApi.pokemon.length,
                      itemBuilder: (context, index) {
                        Pokemon pokemon = pokemonStore.getPokemon(index: index);
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 905),
                          columnCount: gridCount,
                          child: ScaleAnimation(
                            child: PokeItem(
                              types: pokemon.type,
                              index: index,
                              name: pokemon.name,
                              id: pokemon.num,
                            ),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class PokeItem extends StatelessWidget {
  final String name;
  final int index;

  final String id;
  final List<String> types;

  const PokeItem({
    Key key,
    this.name,
    this.index,
    this.id,
    this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokeDetailScreen(
              index: index,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              //alignment: Alignment.bottomRight,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontFamily: 'Google',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemonTypes(types: types, py: 5),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: whitePokeball(id: id),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: cachedImage(id: id),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Utils.getColorType(type: types[0]).withOpacity(.7),
                Utils.getColorType(type: types[0]),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
