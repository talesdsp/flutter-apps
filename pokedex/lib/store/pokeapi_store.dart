import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/common/constants.dart';
import 'package:pokedex/common/utils.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/http.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeApi _pokeApi;

  @computed
  PokeApi get pokeApi => _pokeApi;

  @action
  Pokemon getPokemon({int index}) {
    return _pokeApi.pokemon[index];
  }

  @observable
  Pokemon _pokemon;

  @computed
  Pokemon get pokemon => _pokemon;

  @action
  void selectPokemon(Pokemon p) {
    _pokemon = p;
  }

  @action
  void fetchPokemonList() {
    loadPokeApi().then((pokeList) {
      _pokeApi = pokeList;
    });
  }

  Future<PokeApi> loadPokeApi() async {
    var json = await HttpProvider.get<PokeApi>(
      kPokeApiUrl,
      (e) => PokeApi.fromJson(e),
      "Error loading list @PokeApi",
    );

    return json;
  }

  @action
  Color getColor() {
    return Utils.getColorType(type: _pokemon.type[0]);
  }
}
