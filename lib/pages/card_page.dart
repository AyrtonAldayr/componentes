import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          _carTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _carTipo2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _carTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.phone_android,
              color: Colors.brown,
            ),
            title: Text('El titulo de una Card'),
            subtitle: Text(
                'El subtitulo se puede utilizar como una pequeña descripción/El subtitulo se puede utilizar como una pequeña descripción/El subtitulo se puede utilizar como una pequeña descripción/El subtitulo se puede utilizar como una pequeña descripción/El subtitulo se puede utilizar como una pequeña descripción/'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _carTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR2OcBiVwslW7EAkL7Mub_Zk_iCGSKRfY_roMsKP9gV11KBSVil'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200.0,
            fit: BoxFit.cover,
          ),
          /*Image(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR2OcBiVwslW7EAkL7Mub_Zk_iCGSKRfY_roMsKP9gV11KBSVil')),*/
          Container(
              padding: EdgeInsets.all(10.0), child: Text('No tengo ni idea'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: card,
      ),
    );
  }
}
