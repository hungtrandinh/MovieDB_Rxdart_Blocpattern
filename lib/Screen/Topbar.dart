import 'package:flutter/material.dart';
import 'package:movie_traninhhung/Widgets/casts.dart';
import 'package:movie_traninhhung/Widgets/genre.dart';
import 'package:movie_traninhhung/Widgets/now_playing.dart';
import 'package:movie_traninhhung/Widgets/top_rate.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyTopBar();
  }
}

class MyTopBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateMyTopBar();
  }
}

class StateMyTopBar extends State<MyTopBar> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          backgroundColor: Color(0xFF151C26), primaryColor: Color(0xFF151C26)),
      home: Scaffold(
        backgroundColor: Color(0xFF151C26),
        appBar: AppBar(
          title: Text(
            "MovieApp",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: Text("Trần Đình Hùng"),
                  accountEmail: Text("tdhung.18it4@vku.udn.com")),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.ac_unit_rounded),
                    SizedBox(
                      height: 20,
                    ),
                    Text("trần đình hùng")
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Sự kiện 1"),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Sự kien 2"),
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Nowplaying(),
            Genre(),
            Cast(
              id: 28,
            ),
            TopRate()
          ],
        ),
      ),
    );
  }
}
