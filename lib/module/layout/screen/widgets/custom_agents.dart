
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../details/agents_details_screen.dart';

class CustomAgents extends StatelessWidget {
  final DataAgents agents;
  CustomAgents(this.agents);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        Navigator.pushNamed(context, AgentsDetailsScreen.routeName,
            arguments: agents);
      },
      child: Container(
        key: ValueKey(agents.id),
        margin: EdgeInsets.all(10),
        width: 270,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(80),
            topLeft: Radius.circular(72),
            topRight: Radius.circular(24),
          ),
          gradient: LinearGradient(
            colors: agents.listColor,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              bottom: 80,
              child: Image.network(
                agents.imagePath,
                fit: BoxFit.cover,
                width: 280,
                height: 450,
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
                  return const Center(child:Icon(Icons.error)); // or any placeholder widget
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                agents.title,
                style: const TextStyle(fontSize: 36, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataAgents {
  final String id;
  final String imagePath;
  final String title;
  final String iconChar;
  final String bgPath;
  final String desc;
  List<String> listIcon;
  List<Color> listColor;
  DataAgents(
      {required this.id,
      required this.title,
      required this.iconChar,
      required this.desc,
      required this.bgPath,
      required this.listIcon,
      required this.imagePath,
      required this.listColor});
}
