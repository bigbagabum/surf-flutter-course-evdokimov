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
      body: Center(
          child: TextField(
              decoration: InputDecoration(
        hintText: 'нажмите чтобы появилась клавиатура',
      ))),
      resizeToAvoidBottomInset: false,
    );
  }
}
