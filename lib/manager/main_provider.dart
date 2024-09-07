
import 'dart:convert';

import 'package:exam/module/layout/screen/agents_screen.dart';
import 'package:exam/module/layout/screen/maps_screen.dart';
import 'package:exam/module/layout/screen/weapons_screen.dart';
import 'package:exam/module/layout/screen/widgets/custom_weapons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MainProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> pages = [AgentsScreen(), MapsScreen(), WeaponsScreen()];
  void changePage(int value) {
    selectedIndex = value;
    pages[selectedIndex];
    notifyListeners();
  }

  Future<void> readAllData() async {
    readJsonDataFromAgents();
    readJsonDataFromMaps();
    readJsonDataFromWeapons();
  }

  List item = [];
  Future<void> readJsonDataFromAgents() async {
    final String response =
        await rootBundle.loadString("assets/file_json/Agents.json");
    final data = await json.decode(response);
    item = data["data"];
    notifyListeners();
  }

  Color hexToColor(String hex) {
    hex = hex.replaceAll("#", "");
    hex = "0xff" + hex;
    return Color(int.parse(hex));
  }

  List itemMaps = [];
  Future<void> readJsonDataFromMaps() async {
    final String response =
        await rootBundle.loadString("assets/file_json/Maps.json");
    final data = await json.decode(response);
    itemMaps = data["data"];
    notifyListeners();
  }

  List itemWeapons = [];
  Future<void> readJsonDataFromWeapons() async {
    final String response =
    await rootBundle.loadString("assets/file_json/Weapons.json");
    final data = await json.decode(response);
    itemWeapons = data["data"];
    notifyListeners();
  }
}
