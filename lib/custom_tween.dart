import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String lorenIpsum = '''
It is a long established fact that a reader will be distracted by the 
readable content of a page when looking at its layout. The point of using 
Lorem Ipsum is that it has a more-or-less normal distribution of letters, 
as opposed to using 'Content here, content here', making it look like 
readable English. Many desktop publishing packages and web page editors 
now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' 
will uncover many web sites still in their infancy. Various versions 
have evolved over the years, sometimes by accident, sometimes on purpose 
(injected humour and the like).

There are many variations of passages of Lorem Ipsum available, 
but the majority have suffered alteration in some form, by injected humour, 
or randomised words which don't look even slightly believable. 
If you are going to use a passage of Lorem Ipsum, you need to be sure 
there isn't anything embarrassing hidden in the middle of text. 
All the Lorem Ipsum generators on the Internet tend to repeat predefined 
chunks as necessary, making this the first true generator on the Internet. 
It uses a dictionary of over 200 Latin words, combined with a handful of 
model sentence structures, to generate Lorem Ipsum which looks reasonable. 
The generated Lorem Ipsum is therefore always free from repetition, injected humour, 
or non-characteristic words etc.
''';

class DigitacaoTween extends Tween<String> {
  DigitacaoTween({String begin = '', String end}) : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var localCorte = (end.length * t).round();
    return end.substring(0, localCorte);
  }
}

class CustomTweenWidget extends StatefulWidget {
  @override
  _CustomTweenWidgetState createState() => _CustomTweenWidgetState();
}

class _CustomTweenWidgetState extends State<CustomTweenWidget> with SingleTickerProviderStateMixin {
  Duration duration = Duration(seconds: 5);
  AnimationController controller;
  Animation<String> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    animation = DigitacaoTween(end: lorenIpsum).animate(controller);
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
        body: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RaisedButton(
                onPressed: () {
                  if (controller.status == AnimationStatus.completed) {
                    controller.reverse().whenComplete(() {
                      setState(() {});
                    });
                  } else {
                    controller.forward().whenComplete(() {
                      setState(() {});
                    });
                  }
                },
                child: Text("Regerar Texto"),
              ),
              Expanded(
                  child: Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (_, __) {
                          return Text('${animation.value}', style: TextStyle(fontSize: 16));
                        },
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
