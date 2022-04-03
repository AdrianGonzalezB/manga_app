import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MangaLibrary extends StatelessWidget {
  MangaLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("taped");
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        height: size.height,
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'prova',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'prova2',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
