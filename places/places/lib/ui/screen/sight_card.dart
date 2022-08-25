import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/app_theme.dart';

Widget topIconRow(int listIndex, status) {
  if (listIndex == 0) {
    // 0 - общий список. 1 - планирую посетить, 2 - посетил
    return AppImage.heart_img_light;
  } else {
    if (status == 1) {
      //0 - ни к чему не относится карточка, 1 - хотел бы посетить, 2 - посетил
      return Row(children: [AppImage.calendar_light, AppImage.cancel_light]);
    } else {
      return Row(children: [AppImage.calendar_light, AppImage.cancel_light]);
    }
  }
}

class SightCard extends StatelessWidget {
  final Sight? sight;
  final int listIndex;
  const SightCard({Key? key, required this.sight, required this.listIndex})
      : super(key: key);

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
                        Container(
                            width: double.infinity,
                            child: Image(
                                image: AssetImage(sight!.img),
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
                              child: Text(sight!.type,
                                  style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))),
                          // const Spacer(),
                          Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.topRight,
                              child:
                                  // смотрим в каком мы списке и отображаем нужные иконки справа сверху
                                  topIconRow(listIndex, sight?.status))
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
                        Container(
                            height: 42,
                            width: double.infinity,
                            child: Text(sight!.name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold))),
                        Container(
                            width: double.infinity,
                            height: 20,
                            child: Text(sight!.details,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14))),
                      ])))
            ],
          ),
        ));
  }
}
