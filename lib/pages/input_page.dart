import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _emil = '';
  String _password = '';
  String _fecha = '';
  List<String> _poderes = ['volar', 'rayos', 'fuerza'];
  String _opcionSeleccionada = 'volar';

  TextEditingController _inputFileFecha = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Primer Input',
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        counter: Text('Numero de caracteres: ${_nombre.length}'),
        //prefixIcon: Icon(Icons.access_alarms),
      ),
      obscureText: false,
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Este es el Eamil $_emil'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        //prefixIcon: Icon(Icons.access_alarms),
      ),
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (valor) {
        setState(() {
          _emil = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_outline),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        //prefixIcon: Icon(Icons.access_alarms),
      ),
      obscureText: true,
      onChanged: (valor) {
        setState(() {
          _emil = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Fecha de Nacimiento',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        //prefixIcon: Icon(Icons.access_alarms),
      ),
      controller: _inputFileFecha,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(new DateTime.now().year),
      lastDate: new DateTime(2035),
      locale: Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFileFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) => {
          lista.add(DropdownMenuItem(
            child: Text(poder),
            value: poder,
          ))
        });
    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
              items: getOpciones(),
              value: _opcionSeleccionada,
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              }),
        ),
      ],
    );
  }
}
