import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TweenSequenceWidget extends StatefulWidget {
  @override
  _TweenSequenceWidgetState createState() => _TweenSequenceWidgetState();
}

class _TweenSequenceWidgetState extends State<TweenSequenceWidget> with SingleTickerProviderStateMixin {
  Duration duration = Duration(milliseconds: 1200);
  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();

    final List<TweenSequenceItem> tweens = <TweenSequenceItem<Color>>[];

    tweens.add(TweenSequenceItem(tween: ColorTween(begin: Colors.deepOrange, end: Colors.deepPurple), weight: 1/4));
    tweens.add(TweenSequenceItem(tween: ColorTween(begin: Colors.deepPurple, end: Colors.yellow), weight: 1/4));
    tweens.add(TweenSequenceItem(tween: ColorTween(begin: Colors.yellow, end: Colors.green), weight: 1/4));
    tweens.add(TweenSequenceItem(tween: ColorTween(begin: Colors.green, end: Colors.blue), weight: 1/4));

    controller = AnimationController(vsync: this, duration: duration);
    animation = TweenSequence(tweens).animate(controller);
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
        title: Text("Tween Sequence"),
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
