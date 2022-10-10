import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:places/ui/res/app_strings.dart';

class settingsScreen extends StatefulWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text(AppStrings.appTitleSettings,
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColorLight,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    height: 1)),
          )),
    );
  }
}
