class Popular {
  String nom;
  String deficulty;
  String time;
  String kal;
  String icon;
  bool selected;
  Popular({
    required this.nom,
    required this.deficulty,
    required this.time,
    required this.kal,
    required this.icon,
    required this.selected
  });
  static List<Popular> getPopular(){
    List<Popular> ls =[];
    ls.add(Popular(nom: 'Honey Pancake', deficulty: 'Easy', time: '30mins', kal: '180Kcal',icon: 'assets/icons/pancake.svg',selected: true));
    ls.add(Popular(nom: 'Cania Bread', deficulty: 'Easy', time: '20mins', kal: '230Kcal',icon: 'assets/icons/bread c.svg',selected: false));
    return ls;
  }
}