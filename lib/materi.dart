import 'package:flutter/material.dart';

class Materi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beta Calculator"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Persamaan Kuadrat"),
            onTap: (){
              Navigator.pushNamed(context, "/qe");
            },
          )
        ],
      )
    );
  }
}