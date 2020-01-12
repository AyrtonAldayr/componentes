import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRgdxulc_b4Gd3PBUDttBv5ZKtRQfO9XyMHYvcVsYhZDts-K75C'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: CircleAvatar(
              child: Text('SL'),
              //backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
    );
  }

}