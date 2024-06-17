import 'package:flutter/material.dart';

class CategoryModel
{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
    {
      required this.name,
      required this.iconPath,
      required this.boxColor,
    }
  );

  static List<CategoryModel> getCategories()
  {
    List<CategoryModel> categories =[];

    categories.add
    (
      CategoryModel
      (
        name: 'Salmon-nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        boxColor: const Color.fromARGB(255, 146, 253, 239)
      )
    );

    categories.add
    (
      CategoryModel
      (
        name: 'pancake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: const Color.fromARGB(255, 239, 253, 146)
      )
    );


    categories.add
    (
      CategoryModel
      (
        name: 'pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: const Color(0xff92A3FD)
      )
    );

    categories.add
    (
      CategoryModel
      (
        name: 'orange snacks',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: const Color.fromARGB(255, 150, 253, 146)
      )
    );

    return categories;
  }
}