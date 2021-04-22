// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:calctex/qe.dart';
import 'package:flutter/material.dart';
import 'catEX.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Beta Calculator",
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/materi': (context) => PKuadrat(),
        '/kalku': (context) => Kalkulator(),
      },
    );
  }
}