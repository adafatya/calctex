import 'package:catex/catex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Arithmatic extends StatefulWidget {
  @override
  _ArithmaticState createState() => _ArithmaticState();
}

class _ArithmaticState extends State<Arithmatic> {
  Widget ans = Text("Tekan tombol Coba");

  final uxController = TextEditingController();
  final uyController = TextEditingController();
  final xController = TextEditingController();
  final yController = TextEditingController();
  final zController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baris Aritmatika"),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue, width: 5)),
            child: Column(
              children: [
                Text(
                    "Baris aritmatika memiliki bentuk umum sebagai berikut"),
                CaTeX(r"U_1,U_2,U_3,.....,U_N"),
                Text(
                    "Dimana masing masing sukunya memiliki selisih b untuk suku yang berdekatan"),
                Text(
                    """Berikut adalah penyelsaian untuk permasalahan deret aritmatika """),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
            child: Column(
              children: [
                CaTeX(r'U_X,...,U_Y,...,U_Z'),
                Row(
                  children: [
                    Text("Nilai Ux = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: uxController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Nilai x = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: xController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Nilai Uy = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: uyController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Nilai y = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: yController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),                
                Row(
                  children: [
                    Text("Nilai z = "),
                    Container(
                      width: 25,
                      child: TextField(
                        controller: zController,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        arithmaticA();
                      });
                    },
                    child: Text("Solve")),
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
                    child: Text("Materi penyelsaian",
                        style: TextStyle(fontSize: 18))),
                CaTeX(r"Diketahui  U_x = 10 dan x=3"),
                CaTeX(r"U_y= 24 dan y=10"),
                CaTeX(r"\text z=6"),
                CaTeX(r"maka b = (U_y-U_x)/(y-x)"), //note to aufa tulung gawenen per dadi neng ngisor e
                CaTeX(r"b= (24-10)/(10-3)"),//note to aufa tulung gawenen per dadi neng ngisor e
                CaTeX(r"b= 2"),
                CaTeX(r"U_z = (x-z)*b + ux"),
                CaTeX(r"U_z= (-3)*2+10"),
                CaTeX(r"U_z= 4"),
                
              ],
            ),
          )
        ],
      ),
    );
  }

  void arithmaticA() {
    if (uxController.text.isEmpty ||
        uyController.text.isEmpty ||
        xController.text.isEmpty || 
        yController.text.isEmpty||
        zController.text.isEmpty) {
      alert("Harap isi semua nilai");
      return;
    }

    int ux = int.parse(uxController.text);
    int uy = int.parse(uyController.text);
    int x = int.parse(xController.text);
    int y = int.parse(yController.text);
    int z = int.parse(zController.text);
    

  //x == nomor suku pertama yang diketahui dan y ada nomor suku kedua yang diketahui 
  //ux merupakan nilai suku pertama dan uy merupakan nilai suku kedua
  // sedangkan z merupakan nomor suku ketiga 
  //yang dicari adalah uz
  //b merupakan beda nilai tiap suku

    double b = (uy-ux)/(y-x);
    double uz = b*(z-x) + ux;


    List<Widget> arithmaticlist = []; // note to aufa iki maune 'x' terus tak ganti dadi arithmaticlist
  //catex e bingung
    arithmaticlist.add(CaTeX("($ux),....,($uy),....,uz"));
    arithmaticlist.add(CaTeX("x = ($x) , y= ($y) , z= ($z)"));
    arithmaticlist.add(CaTeX("($b)= (($uy)-($ux))/(($y)-($x))"));
    arithmaticlist.add(CaTeX("U_z = ($b) *(($x)-($z))+ ($ux)"));
    arithmaticlist.add(CaTeX("U_z = ($uz)"));
  // step e gur ngene

    
    ans = Column(mainAxisAlignment: MainAxisAlignment.center, children: arithmaticlist);
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
