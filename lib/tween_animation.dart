import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExemploTweenAnimation extends StatefulWidget {
  @override
  _ExemploTweenAnimationState createState() => _ExemploTweenAnimationState();
}

class _ExemploTweenAnimationState extends State<ExemploTweenAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 10))
      ..addListener(() {
        setState(() {});
      });
    _animation = Tween(begin: 0.0, end: 100000.0).animate(_controller);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("R\$${_animation.value.toStringAsFixed(2)}", style: TextStyle(fontSize: 40)),
            ),
            RaisedButton(
              child: Text("Animar"),
              onPressed: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
