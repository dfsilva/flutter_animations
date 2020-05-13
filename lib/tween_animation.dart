import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExemploTweenAnimation extends StatefulWidget {
  @override
  _ExemploTweenAnimationState createState() => _ExemploTweenAnimationState();
}

class _ExemploTweenAnimationState extends State<ExemploTweenAnimation>
    with SingleTickerProviderStateMixin {

  Duration _duration = Duration(seconds: 3);
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: _duration
    );
    _animation = Tween(begin: 0.0, end: 100000).animate(_controller);
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
        title: Text("Tween Animation"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("R\$${_animation.value.toStringAsFixed(2)}"),
            RaisedButton(
              child: Text("Animar"),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
