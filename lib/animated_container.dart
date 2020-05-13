import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExemploAnimatedContainer extends StatefulWidget {
  @override
  _ExemploAnimatedContainerState createState() => _ExemploAnimatedContainerState();
}

class _ExemploAnimatedContainerState extends State<ExemploAnimatedContainer> {
  Color _cor;
  double _raioBorda;
  double _margem;

  @override
  void initState() {
    super.initState();
    _cor = Colors.deepPurple;
    _raioBorda = 10.0;
    _margem = 5;
  }

  _alterarContainer() {
    setState(() {
      _margem = Random().nextDouble() * 65;
      _cor = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
      _raioBorda = Random().nextDouble() * 65;
    });
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
              child: SizedBox(
                width: 200,
                height: 200,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(_margem),
                  decoration: BoxDecoration(color: _cor, borderRadius: BorderRadius.circular(_raioBorda)),
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Alterar"),
              onPressed: () => _alterarContainer(),
            )
          ],
        ),
      ),
    );
  }
}
