import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: <Widget>[
          _cardTipo1(),
          SizedBox( height: 25.0,),
          _cardTipo2(),
        ],
      ),
    );
  }

  _cardTipo1() {
     return Card(
       elevation: 20.0,
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0) ),
       child: Column(
         children: [
           ListTile(
             title: Text('Card Numero 1, Agregada'),
             subtitle: Text('aqui ingresar el subtitulo'),
             leading: Icon( Icons.accessibility, color: Colors.indigo),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               FlatButton(
                   child: Text('Cancelar'),
                   onPressed: () {

                   },
               ),
               FlatButton(
                 child: Text('OK'),
                 onPressed: () {

                 },
               ),
             ],
           )
         ],
       ),
     );
  }

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(placeholder: AssetImage('assets/loading_x.gif'),
            image: NetworkImage('https://culturainquieta.com/images/Ver%C3%B3nica/Atardeceres/atardecer_culturainquieta6.jpg'),
            fadeInDuration: Duration( milliseconds: 200),
            height: 320.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Atardecer Playa')
          ),
        ],
      ),
    );

  }


}
