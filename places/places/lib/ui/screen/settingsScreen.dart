import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:places/ui/res/app_strings.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
            height: 50,
            width: double.infinity,
            //color: Colors.amber,
            child: Row(
              children: [
                Text(
                  AppStrings.darkTheme,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).primaryColorLight,
                    fontFamily: "Roboto",
                  ),
                ),
                const Divider(),
                //const Spacer(),
                CupertinoSwitch(
                    value: myTheme.isBlack,
                    //value: isBlack,
                    onChanged: (bool? value) {
                      setState(() {
                        //isChecked = value!;
                        myTheme.isBlack = value!;
                      });
                      context.read<myTheme>().changeTheme(myTheme.isBlack);
                      //myTheme().changeTheme(isBlack);
                    })
              ],
            ),
          ),
          Container(
              height: 1,
              width: double.infinity,
              color: Color.fromRGBO(124, 126, 146, 0.3),
              margin: const EdgeInsets.only(left: 16, right: 16)),
          Container(
              padding: const EdgeInsets.only(left: 5.0, right: 30.0),
              height: 50,
              width: double.infinity,
              //color: Colors.amber,
              child: Row(
                children: [
                  Text(
                    AppStrings.openTutorial,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColorLight,
                      fontFamily: "Roboto",
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      print('Open tutorial icon clicked');
                    },
                    child: const Image(
                        image: AssetImage('lib/ui/res/icons/information.png')),
                  ),
                ],
              )),
          Container(
              height: 1,
              width: double.infinity,
              color: Color.fromRGBO(124, 126, 146, 0.3),
              margin: const EdgeInsets.only(left: 16, right: 16)),
        ],
      ),
    );
  }
}
