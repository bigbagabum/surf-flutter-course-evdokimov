import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/app_theme.dart';

class SightDetails extends StatelessWidget {
  final Sight? sight;
  const SightDetails({Key? key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Stack(children: [
                    Container(
                        height: double.infinity,
                        child: Image(
                            image: AssetImage(sight!.img),
                            fit: BoxFit.fitHeight,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),

                                //child
                              );
                            })),
                    Container(
                        margin: const EdgeInsets.only(left: 16, top: 36),
                        child: AppImage.back_light),
                  ])),
              const SizedBox(
                height: 5,
                width: double.infinity,
              ),
              Container(
                  //height: 400,
                  width: double.infinity,
                  color: Colors.white,
                  margin: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            child: Text(
                              sight!.name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            )),
                        Row(children: [
                          Container(
                              child: Text(
                            sight!.type,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'Roboto'),
                          )),
                          Container(
                              margin: const EdgeInsets.only(left: 16.0),
                              child: const Text('открыто 24 часа',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 124, 126, 146))))
                        ]),
                        Container(
                            height: 72,
                            margin:
                                const EdgeInsets.only(top: 24.0, bottom: 24),
                            child: SingleChildScrollView(
                                child: Text(sight!.details,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      color: Colors.black,
                                    )))),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Container(
                                height: 48,
                                width: 328,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.green),
                                child: Center(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: AppImage.way_light),
                                      const Text('ПОСТРОИТЬ МАРШРУТ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              color: Colors.white))
                                    ])))),
                        Container(
                            alignment: Alignment.center,
                            child: Container(
                                width: 328,
                                height: 1,
                                color: Color.fromRGBO(124, 126, 146, 0.56))),
                        Row(
                          children: [
                            Container(
                                width: 164,
                                height: 40,
                                alignment: Alignment.center,
                                child: Row(children: [
                                  AppImage.calendar_dark,
                                  const Text(
                                    'Запланировать',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 58, 63, 91)),
                                  )
                                ])),
                            Container(
                                width: 164,
                                height: 40,
                                alignment: Alignment.center,
                                child: Row(children: [
                                  Container(child: AppImage.heart_img_dark),
                                  const Text('В избранное',
                                      style: TextStyle(
                                          //fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 58, 63, 91)))
                                ]))
                          ],
                        ),
                      ]))
            ])));
  }
}
