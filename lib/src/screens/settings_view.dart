import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_datapersistence/models/settings_model.dart';
import 'package:flutter_datapersistence/src/widget/slide_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final _emailController = TextEditingController(text: "");
  final _nameController = TextEditingController(text: "");
  //SliderWidget sliderVolumencontrol = SliderWidget(title: ,)
  bool _isDarkThema = false;
  double _volumentMultimedia = 50.0;
  double _volumentTono = 50.0;
  double _volumentAlarma = 50.0;
  double _volumentLlamada = 50.0;
  double _volumentMensaje = 50.0;
  bool _modoSilencio = false;
  bool _noMolestar = false;
  bool _vibrarModoSilencio = false;

  ///Metodo para Obtener el valor que tenemos guarddo en el localstored
  void onGetPreferences() async {
    try {
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
    } catch (e) {
      throw Exception("Not implementation error");
    }
  }

/*libero los recursos cuando salga de la vista,
 aunque nos hace falta  este  programa de una sola vista....
 es solo por buena cultura.
 */
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    onGetPreferences();
    super.initState();
  }

  onSetState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuracion"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SwitchListTile(
            title: const Text('Dart thema'),
            value: _isDarkThema,
            onChanged: (value) {
              setState(() {
                _isDarkThema = value;
              });
            },
          ),
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      "Cuenta",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "por favor escriba un nombre",
                          labelText: "Nombre"),
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "por favor digite el email",
                          labelText: "Email"),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              )),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Sonido y Vibración",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SliderWidget(
                  title: "Multimedia",
                  icon: Icons.music_note,
                  value: _volumentMultimedia,
                  onChanged: (value) {
                    setState(() {
                      _volumentMultimedia = value;
                    });
                  },
                ),
                SliderWidget(
                  title: "Tono",
                  icon: Icons.volume_down,
                  value: _volumentTono,
                  onChanged: (value) {
                    setState(() {
                      _volumentTono = value;
                    });
                  },
                ),
                SliderWidget(
                  title: "Alarma",
                  icon: Icons.alarm,
                  value: _volumentAlarma,
                  onChanged: (value) {
                    setState(() {
                      _volumentAlarma = value;
                    });
                  },
                ),
                SliderWidget(
                  title: "LLamada",
                  icon: Icons.call,
                  value: _volumentLlamada,
                  onChanged: (value) {
                    setState(() {
                      _volumentLlamada = value;
                    });
                  },
                ),
                SliderWidget(
                  title: "Mensajes",
                  icon: Icons.message,
                  value: _volumentMensaje,
                  onChanged: (value) {
                    setState(() {
                      _volumentMensaje = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Modo silencio'),
                  value: _modoSilencio,
                  onChanged: (value) {
                    setState(() {
                      _modoSilencio = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vibrar en modo silencio'),
                  value: _vibrarModoSilencio,
                  onChanged: (value) {
                    setState(() {
                      _vibrarModoSilencio = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('No Molestar'),
                  value: _noMolestar,
                  onChanged: (value) {
                    setState(() {
                      _noMolestar = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onSavePreferences,
        tooltip: "Save data",
        child: const Icon(Icons.save),
      ),
    );
  }

  ///Metodo para guardar el valor en nuestro localstored
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
}
