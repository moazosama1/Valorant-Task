import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMaps extends StatelessWidget {
  MapsData mapsData;
  CustomMaps({required this.mapsData});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 225,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Image.network(
              mapsData.splashImage,
              fit: BoxFit.cover,
              height: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error); // or any placeholder widget
              },
            ),
            Container(
              width: double.infinity,
              height: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  Color(0xffFD4556).withOpacity(0.6),
                  Color(0xffFD4556).withOpacity(0.1),
                ], begin: Alignment.centerRight , end: Alignment.bottomCenter),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  mapsData.iconImage,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error); // or any placeholder widget
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                mapsData.name,
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}

class MapsData {
  String id = "";
  String name;
  String splashImage;
  String iconImage;

  MapsData(
      {required this.name, required this.splashImage, required this.iconImage});
}
