import 'package:flutter/material.dart';
import 'custom_assets/custom_scaffold.dart';
import '../buttons/swipe_button.dart';
import 'package:one_punch_man_workout/preferences_controller.dart';
import 'package:one_punch_man_workout/size_config.dart';
import 'package:one_punch_man_workout/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
        future: PreferencesController.getHeroName(),
        builder: (context, snapshot) {
          final heroName = snapshot.data;
          return SafeArea(
              child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Theme.of(context).backgroundColor,
            drawer: SideMenu(),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Align prevents the child container of occupying all width
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: RaisedButton(
                          child: Icon(Icons.clear_all),
                          onPressed: () =>
                              _scaffoldKey.currentState.openDrawer(),
                          color: Theme.of(context).backgroundColor,
                        ),
                      )),
                  Text("Welcome back $heroName !"),
                  Image.asset(
                    'assets/images/mainpage-bw.png',
                    height: SizeConfig.blockSizeVertical * 60,
                    width: SizeConfig.blockSizeHorizontal * 40,
                  ),
                  RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/exercise/register'),
                    child: Text("Register your exercise!"),
                  ),
                  ////
                  Container(
                    // vai ter um box wrapped with a gesture detector
                    color: Colors.black,
                    height: 100.0,
                    width: 100.0,
                    child: SwipingButton(
                      text: "Swipe to exercise!",
                      onSwipeCallback: () =>
                          Navigator.of(context).pushNamed('/exercise/register'),
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
