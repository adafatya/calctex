import 'package:catex/catex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class PKuadrat extends StatefulWidget {
  @override
  _PKuadratState createState() => _PKuadratState();
}

class _PKuadratState extends State<PKuadrat> {
  Widget ans = Text("Tekan tombol Coba");

  final aController = TextEditingController();
  final bController = TextEditingController();
  final cController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persamaan Kuadrat"),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 5)),
            child: Column(
              children: [
                Text(
                    "Persamaan kuadrat merupakan persamaan yang memiliki bentuk umum"),
                CaTeX(r"ax^2+bx+c = 0"),
                Text(
                    "Akar-akar persamaan kuadrat dapat dicari dengan menggunakan rumus abc"),
                Text(
                    """Berikut langkah-langkah untuk mencari akar persamaan menggunakan rumus abc"""),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
            child: Column(
              children: [
                CaTeX(r'\text{Cari akar } ax^2+bx+c = 0'),
                Row(
                  children: [
                    Text("Nilai a = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: aController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Nilai b = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: bController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Nilai c = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: cController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        abc();
                      });
                    },
                    child: Text("Coba")),
                ans
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 5)),
            child: Column(
              children: [
                Center(
                    child: Text("Pembuktian rumus abc",
                        style: TextStyle(fontSize: 18))),
                CaTeX(r"\text{bagi kedua ruas dengan }a"),
                CaTeX(
                    r"\frac {a} {a} x^2 + \frac b a x +\frac c a = \frac 0 a"),
                CaTeX(r"\text{kurangi kedua ruas dengan }\frac c a"),
                CaTeX(r"x^2 + \frac b a x = \frac {-c} a,"),
                CaTeX(r"\text{jumlahkan kedua ruas dengan }(\frac b {2a})^2"),
                CaTeX(
                    r"x^2 + \frac b a x + (\frac b {2a})^2 = \frac {-c} a + (\frac b {2a})^2"),
                CaTeX(r"(x + \frac b {2a})^2 = \frac {b^2-4ac} {4a^2}"),
                CaTeX(r"\text{akar kuadratkan kedua ruas}"),
                CaTeX(r"x + \frac b {2a} = \pm \frac {\sqrt{b^2-4ac}} {2a}"),
                CaTeX(r"\text{kurangi kedua ruas dengan }\frac b {2a}"),
                CaTeX(r"x = \frac {-b \pm \sqrt{b^2-4ac}} {2a}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  void abc() {
    if (aController.text.isEmpty ||
        bController.text.isEmpty ||
        cController.text.isEmpty) {
      alert("Harap isi semua nilai a b c");
      return;
    }

    int a = int.parse(aController.text);
    int b = int.parse(bController.text);
    int c = int.parse(cController.text);

    int d = pow(b, 2) - 4 * a * c;

    if (a == 0) {
      alert("Bukan persamaan kuadrat!");
      return;
    } else if (d < 0) {
      alert("Akar imajiner!");
      return;
    }

    List<Widget> x = [];

    x.add(CaTeX("($a)x^2+($b)x+($c)=0"));
    x.add(CaTeX(r"\text{Cari nilai D dimana } D = b^2-4ac"));
    x.add(CaTeX("D = ($b)^2-4($a)($c)"));
    x.add(CaTeX("D = $d"));
    x.add(CaTeX("x = \\frac \{-($b)\\pm\\sqrt\{$d\}\}\{2*$a\}"));

    List<Widget> x1 = [];
    List<Widget> x2 = [];

    if (sqrt(d) == sqrt(d).truncate()) {
      x1.add(CaTeX("x_1 = \\frac \{${-b + sqrt(d)}\} ${2 * a}"));
      x1.add(CaTeX("x_1 = ${(-b + sqrt(d)) / (2 * a)}"));
      x2.add(CaTeX("x_2 = \\frac \{${-b - sqrt(d).truncate()}\} ${2 * a}"));
      x2.add(CaTeX("x_2 = ${(-b - sqrt(d)) / (2 * a)}"));
    } else {
      x1.add(CaTeX("x_1 = \\frac \{-($b)+\\sqrt\{$d\}\}\{${2 * a}\}"));
      x2.add(CaTeX("x_2 = \\frac \{-($b)-\\sqrt\{$d\}\}\{${2 * a}\}"));
      int temp = -1;
      for (int i = sqrt(d).truncate(); i > 1 && temp == -1; i--)
        if (d % (i * i) == 0) temp = i;
      if (temp != -1) {
        x1.add(CaTeX(
            "x_1 = \\frac \{-($b)+$temp\\sqrt\{${d ~/ pow(temp, 2)}\}\}\{${2 * a}\}"));
        x2.add(CaTeX(
            "x_2 = \\frac \{-($b)-$temp\\sqrt\{${d ~/ pow(temp, 2)}\}\}\{${2 * a}\}"));
      }
    }

    x.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: x1,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Padding(padding: EdgeInsets.only(right: 8)),
        Column(
          children: x2,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    ));

    ans = Column(mainAxisAlignment: MainAxisAlignment.center, children: x);
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
