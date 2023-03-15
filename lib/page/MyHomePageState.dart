// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:tugas5/main.dart';
import 'package:tugas5/page/Convert.dart';
import 'package:tugas5/page/Input.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void konversiSuhu() {
    setState(() {
      _inputUser = double.parse(myController.text);
      _reamur = (_inputUser - 273.15) * 0.8;
      _kelvin = 273.15 + _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Input(myController: myController),
              Container(
                decoration: const BoxDecoration(color: Colors.amberAccent),
                margin: const EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          decoration:
                              const BoxDecoration(color: Colors.cyanAccent),
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Suhu Dalam Kelvin",
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          decoration:
                              const BoxDecoration(color: Colors.lightGreen),
                          child: Text(_kelvin.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 20)),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          decoration:
                              const BoxDecoration(color: Colors.cyanAccent),
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text("Suhu dalam Reamur",
                              style: TextStyle(fontSize: 14)),
                        ),
                        Container(
                          decoration:
                              const BoxDecoration(color: Colors.lightGreen),
                          child: Text(
                            _reamur.toStringAsFixed(2),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Convert(konvertHandler: konversiSuhu),
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
