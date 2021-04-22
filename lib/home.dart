import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beta Calculator"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 150)),
            Container(
              height: 100,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/materi');
                },
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Icon(Icons.book, size: 50),
                    Text("Materi")
                  ],
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Container(
              height: 100,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/kalku');
                },
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Icon(Icons.calculate, size: 50),
                    Text("Kalkulator")
                  ],
                )
              ),
            ),
          ]
        ),
      )
    );
  }
}
