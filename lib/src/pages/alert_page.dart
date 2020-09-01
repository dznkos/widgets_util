import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          onPressed: () => _mostrarAlert(context),
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.adb ),
        onPressed: (){
            Navigator.pop(context);
        },
      ),

    );
  }

  void _mostrarAlert(BuildContext context){
     showDialog(
         context: context,
         barrierDismissible: false,
         builder: (context) {

           return AlertDialog(
             shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
             title: Text('Alerta emergente'),
             content: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text('Eliminar objeto?'),
                 FloatingActionButton(
                   child: Icon( Icons.close),
                   onPressed: () {
                      Navigator.of(context).pop();
                   },
                 )
               ],
             ),
           );

         },
     );

  }

}
