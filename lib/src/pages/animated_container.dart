import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainderPage extends StatefulWidget {
  @override
  _AnimatedContainderPageState createState() => _AnimatedContainderPageState();
}

class _AnimatedContainderPageState extends State<AnimatedContainderPage> {

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadiusGeo = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadiusGeo,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.format_size),
        onPressed: () {
          _cambiarForma();
        },
      ),
    );

  }

  void _cambiarForma() {

    final random = Random();
    setState(() {
      _width = random.nextInt(200).toDouble();
      _height = random.nextInt(200).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
          1);

      _borderRadiusGeo = BorderRadius.circular( random.nextInt(100).toDouble());
    });

  }
}
