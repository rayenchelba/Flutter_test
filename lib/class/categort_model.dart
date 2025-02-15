import 'dart:ui';

class Category {
  String nom;
  String iconPath;
  Color boxcolor;

  Category({
    required this.nom,
    required this.iconPath,
    required this.boxcolor,
  });

  static List<Category> getCategories() {
    return [
      Category(nom: 'Salad', iconPath: 'assets/icons/salad.svg', boxcolor: Color(0xff92A3FD)),
      Category(nom: 'Cake', iconPath: 'assets/icons/cake.svg', boxcolor: Color(0xffC58BF2)),
      Category(nom: 'Pie', iconPath: 'assets/icons/pie.svg', boxcolor: Color(0xff92A3FD)),
      Category(nom: 'Smoothies', iconPath: 'assets/icons/sm.svg', boxcolor: Color(0xffC58BF2)),
    ];
  }
}
