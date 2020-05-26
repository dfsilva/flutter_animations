import 'package:animacoes/animated_container.dart';
import 'package:animacoes/animations_builder.dart';
import 'package:animacoes/custom_tween.dart';
import 'package:animacoes/fade_animation.dart';
import 'package:animacoes/page_route_animation.dart';
import 'package:animacoes/tween_animation.dart';
import 'package:animacoes/tween_sequence.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animacoes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            ListTile(
              title: Text("Container Animado"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => ExemploAnimatedContainer()));
              },
            ),
            ListTile(
              title: Text("Page Route Animation"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder<SlideTransition>(
                        pageBuilder: (_, __, ___) => PageRouteAnimation(),
                        transitionsBuilder: (context, anim, secondAnim, child) {
                          var tween = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero);
                          var curve = CurveTween(curve: Curves.ease);
                          return SlideTransition(
                            position: anim.drive(curve).drive(tween),
                            child: child,
                          );
                        }));
              },
            ),
            ListTile(
              title: Text("Tween Animation"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => ExemploTweenAnimation()));
              },
            ),
            ListTile(
              title: Text("Animation Builder"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => AnimationBuilderWidget()));
              },
            ),
            ListTile(
              title: Text("Sequence Tween"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => TweenSequenceWidget()));
              },
            ),
            ListTile(
              title: Text("Custom Tween"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => CustomTweenWidget()));
              },
            ),
            ListTile(
              title: Text("Fade Transition"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => ExemploFadeTransition()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
