// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeApi> _$pokeApiComputed;

  @override
  PokeApi get pokeApi =>
      (_$pokeApiComputed ??= Computed<PokeApi>(() => super.pokeApi,
              name: '_PokeApiStoreBase.pokeApi'))
          .value;
  Computed<Pokemon> _$pokemonComputed;

  @override
  Pokemon get pokemon =>
      (_$pokemonComputed ??= Computed<Pokemon>(() => super.pokemon,
              name: '_PokeApiStoreBase.pokemon'))
          .value;

  final _$_pokeApiAtom = Atom(name: '_PokeApiStoreBase._pokeApi');

  @override
  PokeApi get _pokeApi {
    _$_pokeApiAtom.reportRead();
    return super._pokeApi;
  }

  @override
  set _pokeApi(PokeApi value) {
    _$_pokeApiAtom.reportWrite(value, super._pokeApi, () {
      super._pokeApi = value;
    });
  }

  final _$_pokemonAtom = Atom(name: '_PokeApiStoreBase._pokemon');

  @override
  Pokemon get _pokemon {
    _$_pokemonAtom.reportRead();
    return super._pokemon;
  }

  @override
  set _pokemon(Pokemon value) {
    _$_pokemonAtom.reportWrite(value, super._pokemon, () {
      super._pokemon = value;
    });
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  Pokemon getPokemon({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPokemon(Pokemon p) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.selectPokemon');
    try {
      return super.selectPokemon(p);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color getColor() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getColor');
    try {
      return super.getColor();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeApi: ${pokeApi},
pokemon: ${pokemon}
    ''';
  }
}
