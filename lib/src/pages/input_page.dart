import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre ='';
  String _email ='';
  String _fecha = '';

  String _opcionSeleccionada = 'Perú';

  List<String> _poderes = ['Perú', 'Brasil','Puerto Rico','Rusia','EEUU','Argentina','Italia'];

  TextEditingController _inputFieldDateController = new TextEditingController();

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
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
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
        labelText: 'Password',
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

  Widget _crearFecha( BuildContext context) {

    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((grado) {
      lista.add( DropdownMenuItem(
        child: Text(grado),
        value: grado,
      ));
    });
    return lista;
}

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 35.0),
        Expanded(
          child: DropdownButton<String>(
              value: _opcionSeleccionada,
              items: getOpcionesDropdown(),
              onChanged: (value) {
                setState(() {
                  _opcionSeleccionada = value;
                });
              },
          ),
        ),
      ],
    );

  }



  Widget _crearPersona() {
    return ListTile(
      title: Text('Bienvenido: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2017),
        lastDate: new DateTime(2021),
        locale: Locale('es', 'ES')
    );
    if (picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }








}


