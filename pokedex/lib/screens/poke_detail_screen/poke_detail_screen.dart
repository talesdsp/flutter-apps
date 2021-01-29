import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/common/utils.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/poke_detail_screen/about_tab/about_tab.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/store/pokeapiv2_store.dart';
import 'package:pokedex/widgets/cached_image.dart';
import 'package:pokedex/widgets/pokemon_types.dart';
import 'package:pokedex/widgets/white_pokeball.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailScreen extends StatefulWidget {
  final int index;

  PokeDetailScreen({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  _PokeDetailScreenState createState() => _PokeDetailScreenState();
}

class _PokeDetailScreenState extends State<PokeDetailScreen> {
  Pokemon _pokemon;
  PokeApiStore _pokemonStore;
  PokeApiV2Store _pokemonV2Store;

  double _progress, _multiple, _opacity, _opacityTitleAppBar;
  Throttle<SheetState> throttle;

  @override
  void initState() {
    super.initState();

    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;

    throttle = Throttle<SheetState>(Duration(milliseconds: 16));

    _pokemonStore = getIt.get<PokeApiStore>();
    _pokemonV2Store = getIt.get<PokeApiV2Store>();

    _pokemon = _pokemonStore.getPokemon(index: this.widget.index);
    _pokemonStore.selectPokemon(_pokemon);

    _pokemonV2Store.getInfoPokemon(_pokemon.id.toString());
    _pokemonV2Store.getInfoSpecie(_pokemon.id.toString());
  }

  @override
  dispose() {
    _pokemonStore.selectPokemon(null);
    super.dispose();
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper)
      return 1.0;
    else if (progress < lower) return 0.0;

    return ((progress - lower) / upper - lower).clamp(0.0, 1.0);
  }

  bool isPortraitDevice;

  double animatedPaddingRule(index) {
    if (index == (_pokemon.id - 1))
      return 0;
    else
      return isPortraitDevice ? 50 : 40;
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;
    isPortraitDevice =
        MediaQuery.of(context).orientation == Orientation.portrait;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: Observer(
          name: "Poke@Observer",
          builder: (context) {
            _pokemon = _pokemonStore.pokemon;
            Color color = Utils.getColorType(type: _pokemon.type[0]);

            return SafeArea(
              top: false,
              bottom: true,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      color.withOpacity(.7),
                      color,
                    ],
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      elevation: 0,
                      iconTheme: IconThemeData(color: Colors.white),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      actions: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear,
                      top: (MediaQuery.of(context).size.height - paddingTop) *
                              0.12 -
                          _progress *
                              ((MediaQuery.of(context).size.height -
                                      paddingTop) *
                                  0.060),
                      left: 20 +
                          _progress *
                              (MediaQuery.of(context).size.height * 0.060),
                      child: Text(
                        _pokemon.name,
                        style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 38 -
                              _progress *
                                  (MediaQuery.of(context).size.height * 0.016),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear,
                      top: (MediaQuery.of(context).size.height + paddingTop) *
                              0.16 +
                          20,
                      left: 20,
                      right: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: pokemonTypes(
                                types: _pokemon.type,
                                px: 5,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '#' + _pokemon.num.toString(),
                              style: TextStyle(
                                fontFamily: 'Google',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SlidingSheet(
                      listener: (state) {
                        setState(() {
                          _progress = state.progress;
                          _multiple = 1.0 - interval(.0, .4, _progress);
                          _opacity = _multiple;
                          _opacityTitleAppBar = interval(.6, .88, _progress);
                        });
                      },
                      cornerRadius: 30,
                      snapSpec: const SnapSpec(
                        snap: true,
                        snappings: [.6, .88],
                        positioning: SnapPositioning.relativeToAvailableSpace,
                      ),
                      builder: (context, state) {
                        return Container(
                          color: Colors.white,
                          height: (MediaQuery.of(context).size.height) -
                              (MediaQuery.of(context).size.height) * 0.12,
                          child: Center(
                            child: AboutTab(),
                          ),
                        );
                      },
                    ),
                    IgnorePointer(
                      ignoring: _opacityTitleAppBar == 1,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.linear,
                        opacity: _opacity,
                        child: AnimatedPadding(
                          curve: Curves.linear,
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.height +
                                        paddingTop) *
                                    0.25 -
                                _progress * 50,
                          ),
                          child: SizedBox(
                            height: isPortraitDevice ? 200 : 140,
                            child: PageView.builder(
                              controller: PageController(
                                initialPage: widget.index,
                                viewportFraction: isPortraitDevice ? .4 : .3,
                                keepPage: false,
                              ),
                              onPageChanged: (index) {
                                _pokemonStore.selectPokemon(
                                    _pokemonStore.getPokemon(index: index));
                              },
                              itemCount: _pokemonStore.pokeApi.pokemon.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    LoopAnimation(
                                      tween: Tween(begin: 0.0, end: 360.0),
                                      duration: Duration(seconds: 200),
                                      builder: (context, _, value) {
                                        return Transform.rotate(
                                          angle: value,
                                          alignment: Alignment.center,
                                          child: whitePokeball(
                                            id: _pokemon.num,
                                            size: 270,
                                            opacity: index == (_pokemon.id - 1)
                                                ? .2
                                                : 0,
                                          ),
                                        );
                                      },
                                    ),
                                    AnimatedPadding(
                                      padding: EdgeInsets.all(
                                          animatedPaddingRule(index)),
                                      duration: Duration(milliseconds: 360),
                                      curve: Curves.easeOut,
                                      child: cachedImage(
                                        id: _pokemonStore
                                            .getPokemon(index: index)
                                            .num,
                                        size: isPortraitDevice
                                            ? size.width / 2.6
                                            : size.height / 3,
                                        color: index == (_pokemon.id - 1)
                                            ? null
                                            : Colors.black.withOpacity(.4),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
