// To parse this JSON data, do
//
//     final todoListe = todoListeFromJson(jsonString);

import 'dart:convert';

TodoListe todoListeFromJson(String str) => TodoListe.fromJson(json.decode(str));

String todoListeToJson(TodoListe data) => json.encode(data.toJson());

class TodoListe {
  TodoListe({
    this.data = const [],
  });

  List<TodoEntry> data;

  factory TodoListe.fromJson(Map<String, dynamic> json) => TodoListe(
    data: List<TodoEntry>.from(json["data"].map((x) => TodoEntry.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TodoEntry {
  TodoEntry({
    this.titel = "der leere titel",
    this.beschreibung = "die leere beschreibung",
  });

  String titel;
  String beschreibung;

  factory TodoEntry.fromJson(Map<String, dynamic> json) => TodoEntry(
    titel: json["titel"],
    beschreibung: json["beschreibung"],
  );

  Map<String, dynamic> toJson() => {
    "titel": titel,
    "beschreibung": beschreibung,
  };
}
