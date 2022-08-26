// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/res/app_theme.dart';

// класс AppBar наследник от PrefferedSizeWidget

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: AppSize.toolBarSize,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          AppStrings.appTitle,
          textAlign: TextAlign.left,
          style: AppTypography.textText32Bold,
        ));
  }

  @override
  // // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppSize.appBarHeight);
}

class SightListScreen extends StatefulWidget {
  static const listIndex = 0;

  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: mocks
              .map((mock) =>
                  SightCard(sight: mock, listIndex: SightListScreen.listIndex))
              .toList(),
        )));
  }
}
