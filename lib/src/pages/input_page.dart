import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre ='';
  String _email ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
        });
      },
    );
  }
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Email',
        helperText: 'Email',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email ),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );

  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Password',
        helperText: 'Password',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock ),
      ),
      onChanged: (value) {
        setState(() {
          //_password = value;
        });
      },
    );

  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Bienvenido: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }





}


