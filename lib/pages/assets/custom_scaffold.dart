import 'package:flutter/material.dart';
import '../../drawer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomScaffold extends StatelessWidget {

  final Widget body;
  final String title;
  CustomScaffold({this.body, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text(title),
     ),
     body: body,
     drawer: SideMenu(),
    );
  }
}