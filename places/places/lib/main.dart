import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/app_assets.dart';

import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter Demo',
        //theme: ThemeData.dark(),
        //    primarySwatch: Colors.blue,
        // ),
        theme: darkTheme,
        //theme: lightTheme,

        //   home: VisitingScreen());
        //home: const SightListScreen());
        //home: SightDetails(sight: mocks[0]));
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screenSelected = <Widget>[
    const SightListScreen(),
    const VisitingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screenSelected.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 1.0,
          unselectedItemColor: Theme.of(context).secondaryHeaderColor,
          selectedItemColor: Theme.of(context).primaryColorLight,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.iconList),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AppAssets.iconHeartFull),
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
