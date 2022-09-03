import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/app_theme.dart';

class TopIconWidget extends StatelessWidget {
  final dynamic status, listIndex;

  const TopIconWidget({Key? key, required this.status, required this.listIndex})
      : super(key: key);

  Widget _topIconRow() {
    switch (listIndex) {
      case SightListIndex.mainList: //общий список
        //print('Список общий');
        return const Image(
            // ignore: unnecessary_const
            image: const AssetImage('lib/ui/res/icons/heart_icon.png'),
            color: AppColors.lightGrey);
      case SightListIndex.planList:
        // список хотелок
        //print('Список хотелок');
        switch (status) {
          case SightStatus.sightNoPlans:
            break;

          case SightStatus
              .sightToVisit: // вид карточки в списке "Хочу посетить"
            return Row(children: const [
              Image(
                  image: AssetImage('lib/ui/res/icons/calendar.png'),
                  color: AppColors.lightGrey),
              Image(
                  image: AssetImage('lib/ui/res/icons/cancel.png'),
                  color: AppColors.lightGrey)
            ]);

          case SightStatus.sightVisited: // вид карточк в списке "посетил"
            return Row(children: const [
              Image(image: AssetImage('lib/ui/res/icons/way.png')),
              Image(
                  image: AssetImage('lib/ui/res/icons/cancel.png'),
                  color: AppColors.lightGrey)
            ]);
        }
    }
    throw '';
  }

  @override
  Widget build(BuildContext context) {
    return _topIconRow();
  }
}

class BottomColumn extends StatelessWidget {
  final dynamic listIndex;
  final Sight sight;
  const BottomColumn({Key? key, required this.sight, required this.listIndex})
      : super(key: key);

  Widget _bottomColumnData() {
    switch (listIndex) {
      case SightListIndex.mainList:
        return Text(sight.details,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14));
      case SightListIndex.planList:
        switch (sight.status) {
          case SightStatus.sightToVisit:
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Запланировано на 01.01.23\n',
                      style: TextStyle(color: Colors.green)),
                  Text('Закрыто до 09:00')
                ]);
          case SightStatus.sightVisited:
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Цель достигнута 20.08.22\n'),
                  Text('открыто круглосуточно')
                ]);
        }
    }
    throw '';
  }

  @override
  Widget build(BuildContext context) {
    return _bottomColumnData();
  }
}

class SightCard extends StatelessWidget {
  final Sight sight;
  // ignore: prefer_typing_uninitialized_variables
  final listIndex;
  const SightCard({
    Key? key,
    required this.sight,
    required this.listIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 2,
        child: Container(
          margin: const EdgeInsets.all(15),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            //color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                  //flex: 1,
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      child: Stack(clipBehavior: Clip.none, children: [
                        SizedBox(
                            width: double.infinity,
                            child: Image(
                                image: AssetImage(sight.img),
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),

                                    //child
                                  );
                                })),
                        Row(children: [
                          Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.topLeft,
                              child: Text(sight.type,
                                  style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          const Spacer(),
                          Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.topRight,
                              child:

                                  // смотрим в каком мы списке и отображаем нужные иконки справа сверху
                                  Row(
                                children: [
                                  TopIconWidget(
                                    listIndex: listIndex,
                                    status: sight.status,
                                  )
                                  //_topIconRow(),
                                ],
                              ))
                        ])
                      ]))),
              Flexible(
                  //flex: 1,
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      //height: double.infinity,
                      width: double.infinity,
                      color: AppColors.lightGrey,
                      child: Column(children: [
                        SizedBox(
                            height: 25,
                            width: double.infinity,
                            child: Text(sight.name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: double.infinity,

                            //тут будет кастомная колонка отрисованная от выбранного списка
                            child: BottomColumn(
                                sight: sight, listIndex: listIndex)),
                      ])))
            ],
          ),
        ));
  }
}
