
import 'package:flutter/material.dart';

class TabCategory extends StatelessWidget {
  final String title;
  final bool isSelected;
  const TabCategory({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: isSelected
            ? BoxDecoration(
          color: const Color(0xffFD4556),
          borderRadius: BorderRadius.circular(15),
        )
            : const BoxDecoration(color: Colors.transparent),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}