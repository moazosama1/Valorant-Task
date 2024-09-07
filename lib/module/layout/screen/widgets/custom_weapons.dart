import 'package:flutter/material.dart';

class CustomWeapons extends StatelessWidget {
  WeaponsData weaponsData;
  CustomWeapons({required this.weaponsData});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.none,
          width: double.infinity,
          height: 130,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: const Color(0xff081E34),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: weaponsData.isLeft
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    weaponsData.name,
                    style: const TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  Text(
                    weaponsData.deec,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )),
        ),
        Align(
          alignment: weaponsData.isLeft ? Alignment.topRight : Alignment.topLeft,
          child: Transform.rotate(
            angle: weaponsData.isLeft  ? 3.14 / 8 : 5.9,
            child: Transform.flip(
                flipX: !weaponsData.isLeft ,
                child: Image.network(weaponsData.imagePath,width: 380,height: 100,)),
          ),
        )
      ],
    );
  }
}

class WeaponsData {
  String name;
  String deec;
  String imagePath;
  bool isLeft;
  WeaponsData({
    required this.name,
    required this.imagePath,
    required this.deec,
    required this.isLeft,
  });
}


