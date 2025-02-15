import 'dart:ui';

class Recommendation{
  String nom;
  String deficulty;
  String time;
  String kal;
  Color bcolor;
  String icon;
  bool selected;
  Recommendation({
    required this.nom,
    required this.deficulty,
    required this.time,
    required this.kal,
    required this.bcolor,
    required this.icon,
    required this.selected
  });
  static List<Recommendation> getrec(){
    List<Recommendation> ls =[];
    ls.add(Recommendation(nom: 'Honey Pancake', deficulty: 'Easy', time: '30mins', kal: '180Kcal',bcolor: Color(0xff92A3FD),icon: 'assets/icons/pancake.svg',selected: true));
    ls.add(Recommendation(nom: 'Cania Bread', deficulty: 'Easy', time: '20mins', kal: '230Kcal', bcolor: Color(0xffC58BF2),icon: 'assets/icons/bread c.svg',selected: false));
    return ls;
  }

}