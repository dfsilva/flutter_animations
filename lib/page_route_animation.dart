import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageRouteAnimation extends StatefulWidget {
  @override
  _PageRouteAnimationState createState() => _PageRouteAnimationState();
}

class _PageRouteAnimationState extends State<PageRouteAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageRouteAnimation"),
      ),
      body: Center(),
    );
  }
}
