import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [          
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://info7rm.blob.core.windows.net.optimalcdn.com/images/2016/11/10/518514_denzel_washington.jpg'),
              radius: 22.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 6.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.indigo,
            ),
          )
        ],
      ),
      body: Container(
        //padding: EdgeInsets.all(20),
        color: Colors.black,
        child: FadeInImage(
                placeholder: AssetImage('assets/loading_best.gif'),
                image: NetworkImage('https://arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/ZIH37E4DB5EDDCFYFXHGI5EBDU.jpg'),
                height: 300,
                fadeInDuration: Duration(milliseconds: 2800)
              ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adb ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),*/
      
    );
  }
}
