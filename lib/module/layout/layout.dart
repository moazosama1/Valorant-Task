

import 'package:exam/module/layout/widgets/custom_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../manager/main_provider.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final mediaQueryHeight = mediaQuery.size.height;
        final mediaQueryWidth = mediaQuery.size.width;
        var provider = Provider.of<MainProvider>(context);
        if(provider.item.isEmpty){
          provider.readAllData();
        }
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mediaQueryHeight * 0.05), 
              Image.asset(
                "assets/images/logo/Logo Icon.png",
                width: mediaQueryWidth * 0.25,
                height: mediaQueryHeight * 0.1,
              ),
              SizedBox(height: mediaQueryHeight * 0.02),
              Image.asset(
                "assets/images/logo/Logo Text.png",
                width: mediaQueryWidth * 0.3, 
                height: mediaQueryHeight * 0.03,
              ),
              SizedBox(height: mediaQueryHeight * 0.05),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                        labelPadding: EdgeInsets.symmetric(vertical: mediaQueryHeight * 0.01), // 1% of screen height
                        padding: EdgeInsets.symmetric(vertical: mediaQueryHeight * 0.01), // 1% of screen height
                        onTap: (value) {
                          provider.changePage(value);
                        },
                        tabs: [
                          TabCategory(
                            title: "Agents",
                            isSelected: provider.selectedIndex == 0,
                          ),
                          TabCategory(
                            title: "Maps",
                            isSelected: provider.selectedIndex == 1,
                          ),
                          TabCategory(
                            title: "Weapons",
                            isSelected: provider.selectedIndex == 2,
                          ),
                        ],
                      ),
                      Expanded(
                        child: provider.pages[provider.selectedIndex],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
