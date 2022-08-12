import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
            children: [Text('Хочу посетить'), Text('Посещенные места')]),
      ),
    );
  }
}
