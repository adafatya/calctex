import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beta Calculator"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/materi');
              },
              child: Column(
                children: [
                  Icon(Icons.book),
                  Text("Materi")
                ],
              )
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/kalku');
              },
              child: Column(
                children: [
                  Icon(Icons.calculate),
                  Text("Kalkulator")
                ]
              )
          )
        ]
      ),
    );
  }
}
