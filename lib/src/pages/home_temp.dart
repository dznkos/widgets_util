import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );

  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (var opt in opciones){
      final tempWidget = ListTile(
        title: Text( opt ),
      );

      lista.add( tempWidget );
      lista.add( Divider( color: Colors.amber, ) );

    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {

    return opciones.map(( item ){
      return Column(
        children: [
          ListTile(
             title: Text( item + '!'),
             subtitle: Text('texto de subtitulo'),
             leading: Icon( Icons.account_balance_wallet),
             trailing: Icon(Icons.arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

  }


}
