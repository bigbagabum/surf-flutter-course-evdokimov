// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SightListScreenRich extends StatefulWidget {
  const SightListScreenRich({Key? key}) : super(key: key);

  @override
  State<SightListScreenRich> createState() => _SightListScreenRichState();
}

class _SightListScreenRichState extends State<SightListScreenRich> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(16, 64, 0, 0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
                children: const <TextSpan>[
                  TextSpan(text: "C", style: TextStyle(color: Colors.green)),
                  TextSpan(text: "писок\n"),
                  TextSpan(text: "и", style: TextStyle(color: Colors.yellow)),
                  TextSpan(text: "нтересных мест"),
                ],
              ),
            )));
  }
}

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 72.0,
        backgroundColor: Colors.white10,
        title: Text("Список\nинтересных мест",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
