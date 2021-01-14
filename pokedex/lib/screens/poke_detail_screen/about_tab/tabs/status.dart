import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/pokemonv2.dart';
import 'package:pokedex/store/pokeapiv2_store.dart';
import 'package:pokedex/widgets/circular_progress_about.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  PokeApiV2Store _pokeApiV2Store;

  @override
  void initState() {
    super.initState();
    _pokeApiV2Store = getIt.get<PokeApiV2Store>();
  }

  List<int> getStatusPokemon(PokeApiV2 pokeApiV2) {
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    pokeApiV2.stats.forEach((f) {
      sum = sum + f.baseStat;
      switch (f.stat.name) {
        case 'speed':
          list[0] = f.baseStat;
          break;
        case 'special-defense':
          list[1] = f.baseStat;
          break;
        case 'special-attack':
          list[2] = f.baseStat;
          break;
        case 'defense':
          list[3] = f.baseStat;
          break;
        case 'attack':
          list[4] = f.baseStat;
          break;
        case 'hp':
          list[5] = f.baseStat;
          break;
      }
    });
    list[6] = sum;

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Container(
          alignment: Alignment.topCenter,
          child: Observer(builder: (context) {
            return _pokeApiV2Store.pokeApiV2 == null
                ? SizedBox(
                    height: 110,
                    child: CircularProgressAbout(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Velocidade',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sp. Def',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sp. Atq',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Defesa',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Ataque',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'HP',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Observer(builder: (context) {
                          List<int> _list =
                              getStatusPokemon(_pokeApiV2Store.pokeApiV2);
                          return Column(
                            children: <Widget>[
                              Text(
                                _list[0].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _list[1].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _list[2].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _list[3].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _list[4].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _list[5].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _list[6].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                        SizedBox(
                          width: 10,
                        ),
                        Observer(builder: (context) {
                          List<int> _list =
                              getStatusPokemon(_pokeApiV2Store.pokeApiV2);

                          const _barWidth = 130;
                          const _totalWidth = _barWidth * 6;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              StatusBar(
                                widthFactor: _list[0] / _barWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StatusBar(
                                widthFactor: _list[1] / _barWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StatusBar(
                                widthFactor: _list[2] / _barWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StatusBar(
                                widthFactor: _list[3] / _barWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StatusBar(
                                widthFactor: _list[4] / _barWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StatusBar(
                                widthFactor: _list[5] / _barWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StatusBar(
                                widthFactor: _list[6] / _totalWidth,
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final double widthFactor;

  const StatusBar({Key key, this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * .5,
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey[300],
          ),
          child: FractionallySizedBox(
            widthFactor: this.widthFactor > 1 ? 1 : this.widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                gradient: RadialGradient(
                  colors: this.widthFactor >= 1
                      ? [Colors.yellowAccent, Colors.yellow[800]]
                      : this.widthFactor >= 0.75
                          ? [Colors.greenAccent, Colors.teal[400]]
                          : this.widthFactor > 0.5
                              ? [Colors.green[400], Colors.teal[400]]
                              : this.widthFactor > 0.35
                                  ? [Colors.yellow[700], Colors.yellow[800]]
                                  : [Colors.redAccent, Colors.red],
                  radius: 50,
                ),
                shape: StadiumBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
