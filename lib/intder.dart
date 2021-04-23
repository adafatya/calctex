import 'package:catex/catex.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class IntDer extends StatefulWidget {
  @override
  _IntDerState createState() => _IntDerState();
}

class _IntDerState extends State<IntDer> {
  Widget ans = Text("Tekan tombol Coba");

  final fxController = TextEditingController();
  final nController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turunan dan Integral Tak Tentu Dasar"),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 5)),
            child: Column(
              children: [
                Text(
                    "Turunan atau Derivatif dalam ilmu kalkulus merupakan pengukuran terhadap bagaimana fungsi berubah seiring perubahan nilai masukan. Secara umum, turunan menyatakan bagaimana suatu fungsi berubah akibat perubahan variabel; contohnya, turunan dari posisi sebuah benda bergerak terhadap waktu adalah kecepatan sesaat objek tersebut (wikipedia)."),
                CaTeX(
                    r"""\text{Turunan dari f(x) dinotasikan sebagai : f'(x) atau }
                \frac d {dx} f(x)"""),
                Text(
                    """Integral tak tentu atau antiturunan atau antiderivatif adalah suatu bentuk operasi pengintegralan suatu fungsi yang menghasilkan suatu fungsi baru. Fungsi ini belum memiliki nilai pasti (berupa variabel) sehingga cara pengintegralan yang menghasilkan fungsi tak tentu ini disebut "integral tak tentu" (wikipedia)."""),
                CaTeX(
                    r"""\text{Integral tak tentu dari f(x) dinotasikan sebagai : }
                \int f(x)"""),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
            child: Column(
              children: [
                CaTeX(r"\text{Cari y' dan } \int y \text{ dari } y = f(x)^n"),
                Row(
                  children: [
                    Text("f(x) = "),
                    Expanded(child: TextField(controller: fxController))
                  ],
                ),
                Row(
                  children: [
                    Text("n = "),
                    Expanded(
                        child: TextField(
                            controller: nController,
                            keyboardType: TextInputType.text))
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        intDer();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CaTeX(r"\frac d {dx} a.f(x)^n = (a)(n)(f'(x))(f(x))^{n-1}"),
                CaTeX(
                    r"\int a.f(x)^n dx = (a)\frac 1 {(n+1)(f'(x))} f(x)^{n+1} + C"),
                CaTeX(r"\frac d {dx} sin(x) = cos(x)"),
                CaTeX(r"\frac d {dx} cos(x) = -sin(x)"),
                CaTeX(r"frac d {dx} e^{nx} = ne^{nx}"),
                CaTeX(r"\int \frac 1 x = ln(x) + C"),
                
              ],
            ),
          )
        ],
      ),
    );
  }

  void intDer() {
    if (fxController.text.isEmpty || nController.text.isEmpty) {
      alert("Harap isi fx dan n");
      return;
    }

    Parser p = Parser();
    Expression fx = p.parse(fxController.text);
    fx = fx.simplify();
    String dfx = fx.derive('x').simplify().toString();
    int n = int.parse(nController.text);
    Expression ndfx = p.parse("$n*($dfx)");
    while (ndfx.simplify().toString() != ndfx.toString())
      ndfx = ndfx.simplify();

    List<Widget> x = [];

    x.add(CaTeX(r"\frac d {dx} f(x) = " + dfx));
    x.add(CaTeX("y' = ($n) $dfx ${fx.toString()}^${n - 1}"));
    x.add(CaTeX("y' = ${ndfx.toString()} ${fx.toString()}^${n - 1}"));
    x.add(CaTeX(
        "\\int y = \\frac 1 \{(${n + 1}) $dfx\} ${fx.toString()}^${n + 1} + C"));
    ndfx = p.parse("${n + 1}*($dfx)");
    while (ndfx.simplify().toString() != ndfx.toString())
      ndfx = ndfx.simplify();
    x.add(CaTeX(
        "\\int y = \\frac 1 \{${ndfx.toString()}\} ${fx.toString()}^${n + 1} + C"));

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
