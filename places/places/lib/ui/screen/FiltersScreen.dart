// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'dart:math';
import 'package:haversine_distance/haversine_distance.dart';

import 'package:places/ui/res/app_strings.dart';
import 'package:places/ui/res/app_theme.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

int filteredListLength = fillListItems(mocks).length;

List<String> fillListItems(List<Sight> value) {
  //Наполняем изначальными данными список мест
  List<String> filledList = [];
  for (var n in value) {
    if (isPlaceNear(
        RedSquare,
        Location(n.lat, n.lan),
        _FiltersScreenState.currentRangeValues.start,
        _FiltersScreenState.currentRangeValues.end)) {
      filledList.add(n.name);
    }
  }
  return filledList;
}

var Podolsk = Location(55.431134, 37.544992);
var RedSquare = Location(55.754840, 37.620881);
var SanktPetersburg = Location(59.929661, 30.345274);

final haversineDistance = HaversineDistance();

bool isPlaceNear(Location CheckPlace, Location CenterPlace, kmMin, kmMax) {
  final distanceInMeter =
      haversineDistance.haversine(CheckPlace, CenterPlace, Unit.METER);
  return (_FiltersScreenState.currentRangeValues.start <= distanceInMeter) &&
      (distanceInMeter <= _FiltersScreenState.currentRangeValues.end);
}

List<String> filteredMockList =
    fillListItems(mocks); //наполняем первично лист с учетом удаленности

filterOfItems() {
  List<String> filteredPlaces = [];

  for (int e = 0; e < mocks.length; e++) {
    if (((mocks[e].type == 'отель' && isHotel) ||
            (mocks[e].type == 'парк' && isPark) ||
            (mocks[e].type == 'ресторан' && isRestourant) ||
            (mocks[e].type == 'особое место' && isParticularPlace) ||
            (mocks[e].type == 'музей' && isMuseum) ||
            (mocks[e].type == 'кафе' && isCafe)) &&
        isPlaceNear(
            RedSquare,
            Location(mocks[e].lat, mocks[e].lan),
            _FiltersScreenState.currentRangeValues.start,
            _FiltersScreenState.currentRangeValues.end)) {
      filteredPlaces.add(mocks[e].name);
    }
    print(
        '${mocks[e].name}  расстояние до Красной площади =  ${haversineDistance.haversine(RedSquare, Location(mocks[e].lat, mocks[e].lan), Unit.METER).round()} м');
  }
  filteredMockList = filteredPlaces;
  filteredListLength = filteredMockList.length;
}

Widget isCheckedFilterItem(bool value) {
  return value
      ? Image(image: AssetImage('lib/ui/res/icons/tick_choice.png'))
      : Container();
}

bool isHotel = true,
    isRestourant = true,
    isParticularPlace = true,
    isPark = true,
    isMuseum = true,
    isCafe = true;
int _distanceMin = 100;
int _distanceMax = 10000;

class _FiltersScreenState extends State<FiltersScreen> {
  String _clickBack() {
    print('Back button clicked');
    return '';
  }

  static RangeValues currentRangeValues = const RangeValues(500, 8000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: _clickBack,
                child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image(
                        color: Theme.of(context).primaryColorLight,
                        image: AssetImage('lib/ui/res/icons/back.png'))),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    isHotel = true;
                    isPark = true;
                    isRestourant = true;
                    isMuseum = true;
                    isParticularPlace = true;
                    isCafe = true;
                    currentRangeValues = const RangeValues(100, 10000);
                    filterOfItems();
                  });
                },
                child: const Text(AppStrings.clearFilter,
                    style: AppTypography.textGreen16),
              ),
            ],
          )),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(AppStrings.categoties,
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                )
                // ),
                ),
          ),
          Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 24),
                        child: Column(
                          children: [
                            Container(
                              child: InkWell(
                                onTap: () {},
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isHotel = !isHotel;
                                      filterOfItems();
                                    });
                                  },
                                  //isHotel = !isHotel;

                                  child: Stack(
                                    //фильтр Отелей
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              'lib/ui/res/icons/Hotel.png')),
                                      isCheckedFilterItem(isHotel),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Отель',
                              style: AppTypography.textText12regular,
                            ),
                            SizedBox(
                                height:
                                    40), //добавляем разделитель между строками
                            InkWell(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPark = !isPark;
                                    filterOfItems();
                                  });
                                },
                                child: Stack(
                                  // фильтр парков
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'lib/ui/res/icons/Park.png')),
                                    isCheckedFilterItem(isPark),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Парк',
                              style: AppTypography.textText12regular,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 22, right: 22),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isRestourant = !isRestourant;
                                    filterOfItems();
                                  });
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'lib/ui/res/icons/Restourant.png')),
                                    isCheckedFilterItem(isRestourant)
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Ресторан',
                              style: AppTypography.textText12regular,
                            ),
                            SizedBox(
                                height:
                                    40), //добавляем разделитель между строками
                            InkWell(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMuseum = !isMuseum;
                                    filterOfItems();
                                  });
                                },
                                child: Stack(
                                  // фильтр музея
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'lib/ui/res/icons/Museum.png')),
                                    isCheckedFilterItem(isMuseum)
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Музей',
                              style: AppTypography.textText12regular,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 18, right: 25),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isParticularPlace = !isParticularPlace;
                                    filterOfItems();
                                  });
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'lib/ui/res/icons/Particular_place.png')),
                                    isCheckedFilterItem(isParticularPlace)
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Особое место',
                              style: AppTypography.textText12regular,
                            ),
                            SizedBox(
                                height:
                                    40), //добавляем разделитель между строками
                            InkWell(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isCafe = !isCafe;
                                    filterOfItems();
                                  });
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'lib/ui/res/icons/Cafe.png')),
                                    isCheckedFilterItem(isCafe)
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Кафе',
                              style: AppTypography.textText12regular,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 56),
                  Row(
                    children: [
                      Text('Расстояние',
                          style: AppTypography.textText16Regular),
                      Spacer(),
                      Text(
                          'от ${currentRangeValues.start.round()} до ${currentRangeValues.end.round()} м.',
                          style: AppTypography.textText16Regular)
                    ],
                  ),
                ],
              )),
          RangeSlider(
              values: currentRangeValues,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              max: 10000,
              min: 100,
              divisions: 100,
              onChanged: (RangeValues values) {
                setState(() {
                  currentRangeValues = values;
                });
                filterOfItems();
              }),
          Spacer(),
          SizedBox(
            height: 48,
            width: 328,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  print(filteredMockList);
                },
                child: Text(
                  'Показать ($filteredListLength)',
                  style: AppTypography.textText14bold,
                )),
          )
        ],
      ),
    );
  }
}
