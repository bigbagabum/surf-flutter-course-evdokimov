//import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/app_theme.dart';
import 'package:places/ui/screen/sight_card.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
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
            body: TabBarView(children: [
              Column(
                children: [
                  SightCard(sight: mocks[0]),
                  SightCard(sight: mocks[2])
                ],
              ),
              Column(
                children: [
                  SightCard(sight: mocks[1]),
                ],
              ),
            ]),
          )),
    );
  }
}
