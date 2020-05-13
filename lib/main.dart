import 'package:animacoes/animated_container.dart';
import 'package:animacoes/page_route_animation.dart';
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
                          final tween = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero);
                          final curve = CurveTween(curve: Curves.ease);
                          return SlideTransition(
                            position: anim.drive(curve).drive(tween),
                            child: child,
                          );
                        }));
              },
            )
          ],
        ),
      ),
    );
  }
}
