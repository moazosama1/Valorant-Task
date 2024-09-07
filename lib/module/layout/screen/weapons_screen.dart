
import 'package:exam/module/layout/screen/widgets/custom_weapons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../manager/main_provider.dart';

class WeaponsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final weaponData = provider.itemWeapons[index];
              return Container(
                margin:const EdgeInsets.symmetric(vertical: 30),
                child: CustomWeapons(
                  weaponsData: WeaponsData(
                      name: weaponData["displayName"] ?? "Unknown",
                      imagePath: weaponData["displayIcon"] ?? "",
                      deec: weaponData["shopData"]?["category"] ?? "",
                      isLeft: index % 2 == 0
                  ),
                ),
              );
            },
            itemCount: provider.itemWeapons.length,
          ),
        );
      },
    );
  }
}