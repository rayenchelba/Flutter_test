class Pancake {
  List<String> ingrediant;
  List<String> how;
  List<String> general;

  Pancake({required this.ingrediant, required this.how, required this.general});

 static Pancake getpan() {
    return Pancake(
      ingrediant: ['Flour', 'Baking powder', 'Sugar', 'Salt', 'Milk', 'Butter', 'Egg'],
      how: ['It\'s not hard to make homemade pancakes','1. Sift the dry ingredients together.',
      '2. Make a well, then add the wet ingredients. Stir to combine.',
    '3. Scoop the batter onto a hot griddle or pan.',
      '4. Cook for two to three minutes, then flip.',
    '5. Continue cooking until brown on both sides.'],
      general: [
        'Prep Time: 5 mins',
        'Cook Time: 15 mins',
        'Total Time: 20 mins',
        'Servings: 8'
      ],
    );
  }
}
