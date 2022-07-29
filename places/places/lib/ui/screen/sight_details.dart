import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightDetails extends StatelessWidget {
  final Sight? sight;
  const SightDetails({Key? key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                height: 360,
                width: 360,
                color: Colors.green,
                child: Container(
                    margin: const EdgeInsets.only(left: 16, top: 36),
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white)),
              ),
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
                                alignment: Alignment.center,
                                child: const Text('ПРОЛОЖИТЬ МАРШРУТ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        color: Colors.white)))),
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
                                  Container(
                                    child: const Icon(Icons.calendar_month,
                                        size: 30,
                                        color: Color.fromRGBO(
                                            124, 126, 146, 0.56)),
                                    // color: Colors.amber,
                                    // width: 20,
                                    // height: 18,
                                    // margin: const EdgeInsets.only(right: 10)
                                  ),
                                  const Text(
                                    'Запланировать',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(
                                            124, 126, 146, 0.56)),
                                  )
                                ])),
                            Container(
                                width: 164,
                                height: 40,
                                alignment: Alignment.center,
                                child: Row(children: [
                                  Container(
                                    child: const Icon(Icons.favorite_border,
                                        size: 30,
                                        color: Color.fromARGB(255, 58, 63, 91)),
                                    // color: Colors.amber,
                                    // width: 20,
                                    // height: 18,
                                    // margin: const EdgeInsets.only(right: 10),
                                  ),
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
