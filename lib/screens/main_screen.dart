import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_zwo_zwo_app/model/todo.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TodoListe tl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tl = new TodoListe();
    tl.data = new List.generate(100, (index) {
      return TodoEntry(
          beschreibung: "Eintrag nummer ${index}", titel: "der titel ${index}");
    });
  }

  Future<TodoListe> _loadJsonFile() async {
    String inhalt = await DefaultAssetBundle.of(context)
        .loadString("assets/meinetodos.json");
    return todoListeFromJson(inhalt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste mit Todos"),
        ),
        body: FutureBuilder<TodoListe>(
          future: _loadJsonFile(),
          // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<TodoListe> snapshot) {
            if (snapshot.hasData) {
              return _buildInhalt();
            } else if (snapshot.hasError) {
            } else {}
            return Container();
          },
        ));
  }

  Widget _buildInhalt() {
    return Container(
        child: ListView.builder(
            itemCount: tl.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(tl.data[index].titel),
                      Text(tl.data[index].beschreibung)
                    ],
                  ),
                ),
              );
            }));
  }
}
