//import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/app_theme.dart';
import 'package:places/ui/screen/sight_card.dart';

class VisitingScreen extends StatefulWidget {
  VisitingScreen({Key? key}) : super(key: key);
  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectIndex = 1;
  int listIndex = 1;

  List<Widget> list =
      mocks.map((mock) => SightCard(sight: mock, listIndex: 1)).toList();

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          final TabController _controller = DefaultTabController.of(context)!;

          _controller.addListener(() {
            if (!_controller.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
              listIndex = _controller.index + 1;
            }
          });
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 52,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(52.0),
                child: Center(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: AppColors.lightGrey,
                  ),
                  child: TabBar(
                      onTap: (index) {},
                      controller: _controller,
                      unselectedLabelColor: AppColors.darkGrey,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: AppColors.darkButton),
                      tabs: [
                        Container(
                            decoration: BoxDecoration(
                                // color: AppColors.darkButton,
                                borderRadius: BorderRadius.circular(45)),
                            child: Center(child: Text(AppStrings.tabPlanned))),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45)),
                          child: Center(child: Text(AppStrings.tabVisited)),
                        )
                      ]),
                )),
                // child: ,
              ),
              title: Center(
                child: Text(
                  AppStrings.titleScreenFavorite,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            body: TabBarView(controller: _controller, children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SightCard(sight: mocks[0], listIndex: listIndex),
                    SightCard(sight: mocks[1], listIndex: listIndex)
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SightCard(sight: mocks[2], listIndex: listIndex),
                  ],
                ),
              ),
            ]),
          );
        }));
  }
}
