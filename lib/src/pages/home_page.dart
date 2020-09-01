
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes App'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    // menuProvider.cargarData();

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {

        return ListView(
          children: _listaItems( snapshot.data , context),
        );
      },
    );

    /*return ListView(
      children: _listaItems(),
    );*/
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach( ( e ) {

      final widgetTemp = ListTile(
        title: Text( e['texto']),
        leading: getIcon( e['icon']) ,
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.indigo),
        onTap: () {
          Navigator.pushNamed(context, e['ruta']);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());

    });

    return opciones;
  }

}
