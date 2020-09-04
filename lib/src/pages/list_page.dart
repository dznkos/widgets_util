import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent)
      {
        fetchData();
        //_agregar10();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ]
      ),

    );
  }

  Widget _crearLista() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, index) {
          final pos = _listaNumeros[index];
          
        return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$pos')
        );
        },
    );

  }

  void _agregar10(){
    for (var i = 1; i < 10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {  });
  }

  Future fetchData() async{
    setState((){});
    _isLoading = true;
    final duration = new Duration(seconds: 2);

    return new Timer( duration, respuestaHTTP);
  }

  void respuestaHTTP(){
      _isLoading = false;

      _scrollController.animateTo(
          _scrollController.position.pixels + 100,
          curve: Curves.fastOutSlowIn,
          duration: Duration( milliseconds: 250 )
      );

      _agregar10();
    }

  Widget _crearLoading(){
    if ( _isLoading )
    {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox( height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
