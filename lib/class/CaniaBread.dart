class Caniabread {
  String name;
  List<String> ingrediant;
  List<String> how;
  List<String> general;

  Caniabread({required this.name,required this.ingrediant, required this.how, required this.general});

  static Caniabread getcania() {
    return Caniabread(
      name: 'Cania bread',
      ingrediant: [
        '4 cups bread flour',
        '1 egg',
        '3 tablespoons unsalted butter',
        '1 tablespoon sweetened condensed milk',
        '1 ¼ cup water',
        '1 teaspoon salt'
      ],
      general: [
        'Prep Time: 5 mins',
        'Cook Time: 15 mins',
        'Total Time: 20 mins',
        'Servings: 8',
      ],
      how: [
        'It\'s not hard to make homemade pancakes',
        'You just need a good recipe.',
        'That\'s where we come in! You\'ll find the step-by-step recipe below, but here\'s a brief overview of what you can expect:',
        '1. In a standing mixer bowl, add in flour, salt, egg, melted butter, condensed milk and water. Mix to incorporate and knead for 10 minutes. Leave to rest for 10 minutes and knead for another 5 minutes.',
        '2. Divide the dough into 10 small balls. Coat each ball generously with unsalted butter and place them in a container that has been generously buttered. Cover the container tightly with cling film and keep in the fridge overnight.',
        '3. The next day. Spread some unsalted butter on the working surface. Take one ball and lightly flatten it. Press and push the dough with the heel of your palm to make it bigger. Stretch it as thin as possible, until you can almost see through it. Now and then spread some softened unsalted butter on it to help the stretching. Optional, lift up one edge of the dough and gently pull to stretch it even more.',
        '4. Scrape and push the upper end of the dough to the middle. Do the same to the lower end, forming a wrinkle thin log. Starting at one end of the log, roll it into a circle and tuck the other end inside. Leave aside for 10 minutes before cooking. Meanwhile you can continue with the rest of the balls.',
        '5. Once ready to cook, take one rolled circle and flatten it into more or less 10-15 cm diameter. Heat some unsalted butter on a pan using medium heat. Place the flattened dough on the pan. Cook for several minutes and then flip. Continue cooking for some minutes more.',
        '6. This is important for a fluffy roti canai. Remove the cooked roti canai and place it on a working surface. Immediately yet carefully grab it using both of your hands and squeeze it to the center. We want to fluff it. You can see this part more clearly in the video above.',
        '7. Keep the roti canai under a kitchen cloth to keep them warm. They\'re best eaten with dhal curry or any type of curry with some sambal. Enjoy!'
      ],
    );
  }
}
