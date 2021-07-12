import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_traninhhung/Bloc/mymovie_listgenre.dart';

import 'package:movie_traninhhung/Model/popurlar_reponse.dart';
import 'package:movie_traninhhung/Widgets/movie_by_genre.dart';

class Genre_listWidget extends StatefulWidget {
  final List<Popular> populars;
  Genre_listWidget({Key key, @required this.populars}) : super(key: key);
  @override
  StatGenre createState() => StatGenre(populars);
}

class StatGenre extends State<Genre_listWidget>
    with SingleTickerProviderStateMixin {
  final List<Popular> populars;
  StatGenre(this.populars);
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: populars.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        mymovie_genre..dranstream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: DefaultTabController(
        length: populars.length,
        child: Scaffold(
          backgroundColor: Color(0xFF151C26),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: AppBar(
                bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.yellow,
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    labelColor: Colors.yellow,
                    tabs: populars.map((Popular popular) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 15, top: 15),
                        child: Text(
                          popular.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList()),
              )),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: populars.map((Popular popular) {
              return MovieByGrene(
                id: popular.id,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
