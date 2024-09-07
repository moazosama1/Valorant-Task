import 'package:exam/manager/main_provider.dart';
import 'package:exam/module/layout/screen/details/agents_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme_app.dart';
import 'module/layout/layout.dart';

void main (){
  runApp(ChangeNotifierProvider(
    create: (context) => MainProvider(),
      builder:(context, child) {
      var provider =  Provider.of<MainProvider>(context);
        return MyApplication();
      },
));
}

class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Valorant",
      theme: ThemeApp.themDark,
      routes: {
        AgentsDetailsScreen.routeName : (context) => AgentsDetailsScreen(),
        LayoutScreen.routeName : (context) => LayoutScreen()
      },
      initialRoute: LayoutScreen.routeName,
    );
  }

}