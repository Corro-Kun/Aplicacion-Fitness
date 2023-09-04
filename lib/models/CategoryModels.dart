import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModels> getCategory() {
    List<CategoryModels> category = [];

    category.add(
      CategoryModels(
        name: 'dog',
        iconPath: 'assets/icons/dogs.svg',
        boxColor: Color(0xff92A3FD),
      ),
    );

    category.add(
      CategoryModels(
        name: 'egg',
        iconPath: 'assets/icons/egg.svg',
        boxColor: Color(0xffC58BF2),
      ),
    );

    category.add(
      CategoryModels(
        name: 'meet',
        iconPath: 'assets/icons/meet.svg',
        boxColor: Color(0xff92A3FD),
      ),
    );

    category.add(
      CategoryModels(
        name: 'pizza',
        iconPath: 'assets/icons/pizza.svg',
        boxColor: Color(0xffC58BF2),
      ),
    );

    category.add(
      CategoryModels(
        name: 'pollo',
        iconPath: 'assets/icons/pollo.svg',
        boxColor: Color(0xff92A3FD),
      ),
    );

    return category;
  }
}
