# flutter datapersistence

 Este proyecto muestra la forma más fácil de hacer uso de la persistencia de dato local usando **SharedPreferences**. Aunque el proyecto en principio es solo mostrar el uso SharedPreferences cabe mencionar que esta bien estructurado y que maneja un modelo de dato **Json** para intectaractual con el local store. A todo esto, muestra como crear un **custom Widget** con parámetros y eventos mostrando así la reutilización de código. Espero que les gustes



  ## Widget Personalizado

```dart
  
  ///Método para obtener el valor que tenemos guardado en el localStored

import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final ValueChanged<double>? onChanged;
  final String title;
  final double value;
  final IconData? icon;

  const SliderWidget(
      {Key? key, this.title = "", this.value = 50.0, this.icon, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _value = value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Icon(icon,
          size: 28,
          color: Colors.black45,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 22),
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black26)),
            ),
            Slider(
              //slider volumen multimedia
              value: _value,
              max: 100,
              divisions: 100,
              label: _value.round().toString(),
              onChanged: (double value) {
                _value = value;
                onChanged!(value);
              },
            ),
          ],
        )),
      ],
    );
  }
}
```


  ## Método obtener los datos

```dart
  
  ///Método para obtener el valor que tenemos guardado en el localStored
  void onGetPreferences() async {
    Settings _settings = Settings();

    SharedPreferences _spref = await SharedPreferences.getInstance();
    String jsonString = _spref.getString('settings') ?? '';

    if (jsonString.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      _settings = Settings.fromJson(json);
      _emailController.text = _settings.email;
      _isDarkThema = _settings.darkThema;
      _volumentMultimedia = _settings.volumeMultimedia;
      _nameController.text = _settings.name;
      _volumentTono = _settings.volumeTono;
      _volumentAlarma = _settings.volumeAlarma;
      _volumentLlamada = _settings.volumeLlamada;
      _modoSilencio = _settings.modoSilencio;
      _noMolestar = _settings.noMolestar;
      _volumentMensaje = _settings.volumentMensaje;
      _vibrarModoSilencio = _settings.vibrarModoSilencio;
      onSetState();
    }
  }
 ```

## Método para guardar

```dart

import 'package:shared_preferences/shared_preferences.dart';

  ///Método para guardar el valor en nuestro localstored
  Future onSavePreferences() async {
    try {
      Settings _stetting = Settings(
          email: _emailController.text,
          name: _nameController.text,
          darkThema: _isDarkThema,
          volumeMultimedia: _volumentMultimedia,
          volumeTono: _volumentTono,
          volumeAlarma: _volumentAlarma,
          volumeLlamada: _volumentLlamada,
          modoSilencio: _modoSilencio,
          noMolestar: _noMolestar,
          volumentMensaje: _volumentMensaje,
          vibrarModoSilencio: _vibrarModoSilencio);

      SharedPreferences _sPref = await SharedPreferences.getInstance();
      String user = jsonEncode(Settings.fromJson(_stetting.toJson()));
      _sPref.setString('settings', user);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Información guardada"),
          duration: Duration(milliseconds: 1500),
          backgroundColor: Color(0xFF4268D3),
        ),
      );
    } catch (error) {
      throw Exception("Not implementation error");
    }
  }
  ```
  
  
