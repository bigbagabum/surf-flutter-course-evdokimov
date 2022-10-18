// ignore: file_names
import 'package:flutter/material.dart';

import 'package:places/ui/res/app_strings.dart';
import 'package:places/ui/res/app_theme.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

int _distanceMin = 100;
int _distanceMax = 10000;

class _FiltersScreenState extends State<FiltersScreen> {
  String _clickBack() {
    print('Back button clicked');
    return '';
  }

  RangeValues _currentRangeValues = const RangeValues(500, 8000);

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
              const Text(AppStrings.clearFilter,
                  style: AppTypography.textGreen16),
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
                            Image(
                                image:
                                    AssetImage('lib/ui/res/icons/Hotel.png')),
                            Text(
                              'Отель',
                              style: AppTypography.textText12regular,
                            ),
                            SizedBox(
                                height:
                                    40), //добавляем разделитель между строками
                            Image(
                                image: AssetImage('lib/ui/res/icons/Park.png')),
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
                            Image(
                                image: AssetImage(
                                    'lib/ui/res/icons/Restourant.png')),
                            Text(
                              'Ресторан',
                              style: AppTypography.textText12regular,
                            ),
                            SizedBox(
                                height:
                                    40), //добавляем разделитель между строками
                            Image(
                                image:
                                    AssetImage('lib/ui/res/icons/Museum.png')),
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
                            Image(
                                image: AssetImage(
                                    'lib/ui/res/icons/Particular_place.png')),
                            Text(
                              'Особое место',
                              style: AppTypography.textText12regular,
                            ),
                            SizedBox(
                                height:
                                    40), //добавляем разделитель между строками
                            Image(
                                image: AssetImage('lib/ui/res/icons/Cafe.png')),
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
                          'от ${_currentRangeValues.start.round().toString()} до ${_currentRangeValues.end.round().toString()} м.',
                          style: AppTypography.textText16Regular)
                    ],
                  ),
                ],
              )),
          RangeSlider(
              values: _currentRangeValues,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              max: 10000,
              min: 100,
              divisions: 10,
              // labels: RangeLabels(
              //   _currentRangeValues.start.round().toString(),
              //   _currentRangeValues.end.round().toString(),
              // ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              }),
          Spacer(),
          //ElevatedButton(onPressed: setState(() {}), child: Text('Показать'))
        ],
      ),
    );
  }
}
