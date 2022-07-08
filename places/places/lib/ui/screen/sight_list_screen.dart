// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        //elevation: 0,

        backgroundColor: Colors.white10,
        title: Text("Список\nинтересных местов",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 32, color: Color.fromARGB(255, 214, 38, 38))),
      ),
      body: Center(
          child: TextField(
              decoration: InputDecoration(
        hintText: 'нажмите чтобы появилась клавиатура',
      ))),
      resizeToAvoidBottomInset: false,
    );
  }
}
