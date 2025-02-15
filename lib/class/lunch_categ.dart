import 'dart:ui';

class LunchCategory {
  String nom;
  String iconPath;
  Color boxcolor;

  LunchCategory({
    required this.nom,
    required this.iconPath,
    required this.boxcolor,
  });

  static List<LunchCategory> getCategories() {
    return [
      LunchCategory(nom: 'Sandwich', iconPath: 'assets/icons/sandwich.svg', boxcolor: Color(0xff92A3FD)),
      LunchCategory(nom: 'Pasta', iconPath: 'assets/icons/pasta.svg', boxcolor: Color(0xffC58BF2)),
      LunchCategory(nom: 'Pizza', iconPath: 'assets/icons/pizza.svg', boxcolor: Color(0xff92A3FD)),
      LunchCategory(nom: 'Burger', iconPath: 'assets/icons/burger.svg', boxcolor: Color(0xffC58BF2)),
      LunchCategory(nom: 'Soup', iconPath: 'assets/icons/soup.svg', boxcolor: Color(0xff92A3FD)),
    ];
  }
}
