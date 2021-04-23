import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  Widget ans = Text("Tekan tombol Hitung");

  Future fetchResult(String q) async {
    Map<String, String> query = {
      "expr": q,
    };
    var result = await http.get(Uri.https("api.mathjs.org", "v4", query));
    var encodedJsonData = json.encode(result.body);
    var jsonData = json.decode(encodedJsonData);

    print(jsonData);

    return jsonData;
  }

  final qController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator menggunakan api mathjax"),
      ),
      body: Column(
        children: [
          Row(children: [Expanded(child: TextField(controller: qController))]),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  calc();
                });
              },
              child: Text("Hitung")),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(width: 5, color: Colors.blue)
            ),
            child: ans,
          )
        ],
      ),
    );
  }

  void calc() {
    ans = FutureBuilder(
        future: fetchResult(qController.text),
        builder: (context, snapshot) {
          if (snapshot.data == null) return Text("Loading...");
          else return Text("Hasil = "+snapshot.data, style: TextStyle(fontSize: 18));
        });
  }

  void alert(String err) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(err, style: TextStyle(fontSize: 25)),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
