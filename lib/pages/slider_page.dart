import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderPage'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBok(),
            _crearSwitcher(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        value: _valorSlider,
        max: 400.0,
        min: 10.0,
        label: 'Tamaño de la imagen',
        //divisions: 20,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearImagen() {
    /*return Image(
      image: NetworkImage(
          'https://goyoman.files.wordpress.com/2010/11/batman-and-ironman-cross-over.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );*/
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(
          'https://goyoman.files.wordpress.com/2010/11/batman-and-ironman-cross-over.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBok() {
/*
    return Checkbox(value: _bloquearCheck, onChanged: (valor){
      setState(() {
        _bloquearCheck = valor;
      });
    });*/
    return CheckboxListTile(
        title: Text('Bloquear Slider con CheckBox'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSwitcher() {
    return SwitchListTile(
        title: Text('Bloquear Slider con Switcher'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
