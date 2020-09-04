import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  bool _estadoCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _crearSlider(),
            Expanded(
                child: _crearImagen()
            ),
            _crearCheckbox(),
            _crearSwitch(),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Container(
          padding: EdgeInsets.all(25.0) ,
          child: Slider(
              activeColor: Colors.amber,
              divisions: 100,
              label: _valorSlider.round().toString(),
              value: _valorSlider,
              min: 0,
              max: 400,
              onChanged: (_estadoCheck) ? null : (value) {
                setState(() {
                  _valorSlider = value;
                });
              },
          ),
    );
  }

  Widget _crearImagen() {
    return  Image(
      height: _valorSlider,
      width : _valorSlider,
      fit: BoxFit.contain,
      image: AssetImage('assets/madre.jpg'),
    );
  }

  Widget _crearCheckbox() {

    return CheckboxListTile(
            title: Text('Bloquear Slider'),
            value: _estadoCheck,
            onChanged: (value) {
              setState(() {
                _estadoCheck = value;
              });
            },
          );

    /*
    Checkbox(
            value: _estadoCheck,
            onChanged: (value) {
              setState(() {
                _estadoCheck = value;
              });
            },
    );
    */

  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _estadoCheck,
      onChanged: (value) {
        setState(() {
          _estadoCheck = value;
        });
      },
    );
  }


}
