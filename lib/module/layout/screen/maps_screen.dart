
import 'package:exam/module/layout/screen/widgets/custom_maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../manager/main_provider.dart';

class MapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomMaps(
                mapsData: MapsData(
                    name: provider.itemMaps[index]["displayName"] ?? "Unknown",
                    splashImage: provider.itemMaps[index]["splash"] ?? "",
                  iconImage:provider.itemMaps[index]["displayIcon"] ?? ""
                ),
              );
            },
            itemCount: provider.itemMaps.length,
          ),
        );
      },
    );
  }
}
