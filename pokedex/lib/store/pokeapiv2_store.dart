import 'package:mobx/mobx.dart';
import 'package:pokedex/common/constants.dart';
import 'package:pokedex/models/pokemonv2.dart';
import 'package:pokedex/models/specie.dart';
import 'package:pokedex/services/http.dart';

part 'pokeapiv2_store.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {
  @observable
  Specie specie;

  @observable
  PokeApiV2 pokeApiV2;

  @action
  Future<void> getInfoPokemon(String numPokemon) async {
    final json = await HttpProvider.get<PokeApiV2>(kPokeapiv2URL + numPokemon,
        (e) => PokeApiV2.fromJson(e), "Error loading info @PokeApiV2");

    pokeApiV2 = json;
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    final json = await HttpProvider.get(
      kPokeapiv2EspeciesURL + numPokemon,
      (e) => Specie.fromJson(e),
      "Error loading specie @Specie",
    );

    specie = json;
  }
}
