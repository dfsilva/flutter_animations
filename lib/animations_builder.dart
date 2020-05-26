import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationBuilderWidget extends StatefulWidget {
  @override
  _AnimationBuilderWidgetState createState() => _AnimationBuilderWidgetState();
}

class _AnimationBuilderWidgetState extends State<AnimationBuilderWidget> with SingleTickerProviderStateMixin {
  Duration duration = Duration(milliseconds: 800);
  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    animation = ColorTween(begin: Colors.deepPurple, end: Colors.green).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationBuilder"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
                decoration: BoxDecoration(color: animation.value),
                padding: EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    if (controller.status == AnimationStatus.completed) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                  },
                  child: Text("TROCAR A COR"),
                ));
          },
        ),
      ),
    );
  }
}
