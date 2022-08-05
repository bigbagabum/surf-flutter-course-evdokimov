import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight? sight;
  const SightCard({Key? key, this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          //color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
              image: AssetImage(sight!.img), fit: BoxFit.cover)),

      //height: 188,
      //width: double.infinity,
      child: Column(
        children: [
          Container(
              height: 94,
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: Row(children: [
                Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: Text(sight!.type,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold))),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 10,
                      width: 10,
                      color: Colors.red,
                    )),
              ])),

          // child: Stack(children: [
          //   Container(
          //       width: double.infinity,
          //       child: Image(
          //         image: AssetImage(sight!.img),
          //         fit: BoxFit.cover,
          //       )),
          //   Row(children: [
          //     Container(
          //         padding: const EdgeInsets.all(16),
          //         alignment: Alignment.topLeft,
          //         child: Text(sight!.type,
          //             style: const TextStyle(
          //                 fontFamily: 'Roboto',
          //                 color: Colors.white,
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.bold))),
          //     const Spacer(),
          //     Container(
          //         padding: const EdgeInsets.all(16),
          //         alignment: Alignment.topRight,
          //         child: Container(
          //           height: 10,
          //           width: 10,
          //           color: Colors.red,
          //         )),
          //   ])
          // ]
          // )

          Container(
              padding: const EdgeInsets.all(16),
              height: 94,
              width: double.infinity,
              color: const Color.fromARGB(245, 245, 245, 245),
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
              ]))
        ],
      ),
    );
  }
}
