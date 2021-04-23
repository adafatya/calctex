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
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.blue),
              boxShadow: [BoxShadow(color: Colors.blue[400])]
            ),
            child: ListTile(
              title: Text("Persamaan Kuadrat",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sans serif",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)
                      ),
              onTap: (){
                Navigator.pushNamed(context, "/qe");
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.blue),
              boxShadow: [BoxShadow(color: Colors.blue[400])]
            ),
            child: ListTile(
              title: Text("Turunan dan Integral Tak Tentu Dasar",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sans serif",
                        fontWeight: FontWeight.bold,
                        fontSize: 20)
                      ),
              onTap: (){
                Navigator.pushNamed(context, "/intder");
              },
            ),
          )
        ],
      )
    );
  }
}