import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/common/utils.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/poke_detail_screen/about_tab/tabs/about.dart';
import 'package:pokedex/screens/poke_detail_screen/about_tab/tabs/evolution.dart';
import 'package:pokedex/screens/poke_detail_screen/about_tab/tabs/status.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/store/pokeapiv2_store.dart';

class AboutTab extends StatefulWidget {
  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PokeApiStore _pokemonStore;
  PokeApiV2Store _pokemonV2Store;
  ReactionDisposer _disposer;
  Color color;
  Debouncer<Pokemon> _debouncer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
    _pokemonStore = getIt.get<PokeApiStore>();
    _pokemonV2Store = getIt.get<PokeApiV2Store>();

    _debouncer = Debouncer<Pokemon>(Duration(milliseconds: 300));

    _disposer = reaction<Pokemon>(
      (f) => _pokemonStore.pokemon,
      _debouncer.setValue,
    );

    _debouncer.values.listen((r) {
      _pokemonV2Store.getInfoPokemon(_pokemonStore.pokemon.id.toString());
      _pokemonV2Store.getInfoSpecie(_pokemonStore.pokemon.id.toString());

      // _pageController.animateToPage(0,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: null,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Observer(builder: (context) {
            color = Utils.getColorType(type: _pokemonStore.pokemon.type[0]);

            return TabBar(
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              controller: _tabController,
              labelStyle: TextStyle(
                //up to your taste
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: color,
              unselectedLabelColor: Color(0xff5f6368),
              isScrollable: true,
              indicator: MD2Indicator(
                indicatorHeight: 3,
                indicatorColor: color,
                indicatorSize: MD2IndicatorSize.normal,
              ),
              tabs: <Widget>[
                Tab(
                  text: "Sobre",
                ),
                Tab(
                  text: "Evolução",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            );
          }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: PageView(
          onPageChanged: (index) {
            _tabController.animateTo(index,
                duration: Duration(milliseconds: 300));
          },
          controller: _pageController,
          children: <Widget>[
            About(),
            Evolution(),
            Status(),
          ],
        ),
      ),
    );
  }
}
