
import 'package:exam/module/layout/screen/widgets/custom_agents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../manager/main_provider.dart';

class AgentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            const SizedBox(height: 40),
            provider.item.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
              height: 500,
              child: ListView.builder(
                padding:const EdgeInsets.all(20),
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  final agentData = provider.item[index];
                  return CustomAgents(
                    DataAgents(
                      id: agentData["uuid"] ?? '',
                      title: agentData["displayName"] ?? "Unknown",
                      imagePath: agentData["bustPortrait"] ?? "",
                      bgPath: agentData["background"] ?? "",
                      desc: agentData["role"]?["description"] ?? "",
                      iconChar: agentData["role"]?["displayIcon"] ?? "",
                      listIcon: [
                        agentData["abilities"]?[0]["displayIcon"] ?? "",
                        agentData["abilities"]?[1]["displayIcon"] ?? "",
                        agentData["abilities"]?[2]["displayIcon"] ?? "",
                        agentData["abilities"]?[3]["displayIcon"] ?? "",
                      ],
                      listColor: (agentData["backgroundGradientColors"] as List<dynamic>?)
                          ?.map((e) => provider.hexToColor(e as String))
                          .toList() ?? [],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: provider.item.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
