import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  static const routeName='/explore';
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("the Unviersity home")),
    );
  }
}