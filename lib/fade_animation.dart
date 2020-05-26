import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExemploFadeTransition extends StatefulWidget {
  @override
  _ExemploFadeTransitionState createState() => _ExemploFadeTransitionState();
}

class _ExemploFadeTransitionState extends State<ExemploFadeTransition> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: FadeTransition(
                opacity: _animation,
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 300,
                ),
              ),
            ),
            RaisedButton(
              child: Text("Animar"),
              onPressed: () {
                _controller.forward().then((value) => _controller.reverse());
              },
            )
          ],
        ),
      ),
    );
  }
}
