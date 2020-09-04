import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


  List<int> _listaNumeros = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {

    return ListView.builder(
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, index) {
          final pos = _listaNumeros[index];
          
          return FadeInImage(
              fadeInDuration: Duration(milliseconds: 1500),
              placeholder: AssetImage('assets/loading_x.gif'),
              image: NetworkImage('https://picsum.photos/500/300/?image=$pos')
              
          );
        },
    );

  }

}
