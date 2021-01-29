import 'package:flutter/material.dart';

const kWhitePokeball = "assets/images/pokeball.png";
const kBlackPokeball = "assets/images/pokeball_dark.png";

const kPokeApiUrl =
    "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

const kPokeapiv2URL = 'https://pokeapi.co/api/v2/pokemon/'; //Nome do Pokemon
const kPokeapiv2EspeciesURL = 'https://pokeapi.co/api/v2/pokemon-species/';

final Map<String, Color> kMapColors = {
  'Normal': Colors.brown[400],
  'Fire': Colors.red,
  'Water': Colors.blue,
  'Grass': Colors.green,
  'Electric': Colors.amber,
  'Ice': Colors.cyanAccent[400],
  'Fighting': Colors.orange,
  'Poison': Colors.purple,
  'Ground': Colors.orange[300],
  'Flying': Colors.indigo[200],
  'Psychic': Colors.pink,
  'Bug': Colors.lightGreen[500],
  'Rock': Colors.grey,
  'Ghost': Colors.indigo[400],
  'Dark': Colors.brown,
  'Dragon': Colors.indigo[800],
  'Steel': Colors.blueGrey,
  'Fairy': Colors.pinkAccent[100],
};
