import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras: ${ _nombre.length }'),
        hintText: 'Ingrese su nombres',
        labelText: '',
        helperText: 'Solo ingresar nombres',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle ),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
          //print( _nombre );
        });
      },
    );
  }

  Widget _crearPersona() {

    return ListTile(
      title: Text('Bienvenido => $_nombre'),

    );

  }

}


