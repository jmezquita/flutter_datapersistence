import 'dart:convert';

List<Settings> settingsFromJson(String str) =>
    List<Settings>.from(json.decode(str).map((x) => Settings.fromJson(x)));

String settingsToJson(List<Settings> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Settings {
  String email;
  String name;
  bool darkThema;
  double volumeMultimedia;
  double volumeTono;
  double volumeAlarma;
  double volumeLlamada;
  double volumentMensaje;
  bool modoSilencio;
  bool vibrarModoSilencio;
  bool noMolestar;

  Settings(
      {this.email = '',
      this.name = '',
      this.darkThema = false,
      this.volumeMultimedia = 50,
      this.volumeTono = 50,
      this.volumeAlarma = 50,
      this.volumeLlamada = 50,
      this.volumentMensaje=50,
      this.modoSilencio = false,
      this.vibrarModoSilencio = false,
      this.noMolestar = false});

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        darkThema: json["darkThema"] ?? false,
        volumeMultimedia: json["volumeMultimedia"]??50.0,
        volumeTono: json["volumeTono"] ?? 50.0,
        volumeAlarma: json["volumeAlarma"] ?? 50.0,
        volumeLlamada: json["volumeLlamada"] ?? 50.0,
        volumentMensaje:json["volumentMensaje"]??50.0,
        modoSilencio: json["modoSilencio"] ?? false,
        vibrarModoSilencio: json["vibrarModoSilencio"] ?? false,
        noMolestar: json["noMolestar"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "darkThema": darkThema,
        "volumeMultimedia": volumeMultimedia,
        "volumeTono": volumeTono,
        "volumeAlarma": volumeAlarma,
        "volumeLlamada": volumeLlamada,
        "modoSilencio": modoSilencio,
        "vibrarModoSilencio": vibrarModoSilencio,
        "noMolestar": noMolestar,
      };
}



/*

class Photos {
    Photos({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
*/