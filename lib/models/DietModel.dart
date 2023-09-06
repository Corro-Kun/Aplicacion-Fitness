import 'package:flutter/material.dart';

class DietModel {
  String name;
  Color color;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.viewIsSelected,
    required this.color,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
        name: 'only egg',
        color: Color(0xffC58BF2),
        iconPath: 'assets/icons/egg.svg',
        level: 'Easy',
        duration: '10 min',
        calories: '70 kcal',
        viewIsSelected: true,
      ),
    );

    diets.add(
      DietModel(
        name: 'only meet',
        color: Color(0xff92A3FD),
        iconPath: 'assets/icons/meet.svg',
        level: 'Easy',
        duration: '10 min',
        calories: '200 kcal',
        viewIsSelected: false,
      ),
    );

    diets.add(
      DietModel(
        name: 'only pizza',
        color: Color(0xffC58BF2),
        iconPath: 'assets/icons/pizza.svg',
        level: 'Easy',
        duration: '10 min',
        calories: '300 kcal',
        viewIsSelected: false,
      ),
    );

    return diets;
  }
}
