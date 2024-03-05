class Recipe {
  final String name;
  final String filter;
  final String recipeImage;
  final String recipeDesc;
  final String recipeInfo;
  final String recipeSteps;
  final String recipeIngredients;
  final List recipeMacros;

  Recipe({
    required this.name,
    required this.filter,
    required this.recipeImage,
    required this.recipeDesc,
    required this.recipeInfo,
    required this.recipeSteps,
    required this.recipeIngredients,
    required this.recipeMacros,
  });
}

final List<Recipe> recipeList = [
  Recipe(name: 'Smash Burger', filter: 'Dinner', recipeImage: 'burger.png', recipeDesc: "Fun to make and fun to eat!", recipeInfo: "Turn your kitchen into a restaurant with these homemade smash burgers!", recipeSteps: "1. Stir ketchup, mayonnaise, pickle relish, vinegar, white sugar, and garlic together in a small bowl. Season to taste with salt and black pepper; cover and set aside,\n\n2. Divide ground beef into 4 even pieces. Roll each piece into a ball; refrigerate until needed. Spread cut sides of each hamburger bun with butter.\n\n3. Heat a large cast iron or nonstick skillet over medium-high heat\n\n4. Add two hamburger balls to the skillet. Smash meat flat using the bottom of a small sauce pot or a spatula. Hold in place until seared, about 1 minute; season with salt and pepper. Cook until a good crust forms, then flip.\n\n5. Once the flip side looks close to being done, cover with cheese slice. Move the patties aside and place buns, butter side down, in skillet until toasted. Continue to cook burgers until cheese is melted, meat is no longer pink in the center, about 5 minutes. An instant-read thermometer inserted into the center should read at least 160 degrees F\n\n6. Remove buns to a plate; top each bottom bun with a patty. Spread toasted side of top bun with some of the special sauce.\n\n7. Lay a few onions down on the patty, cover with the top bun and enjoy", recipeIngredients: "1", recipeMacros: ["18", "652","47g","25g","30g", "4"]),
  Recipe(name: 'Black Bean Burrito', filter: 'Popular', recipeImage: 'burrito.png', recipeDesc: "These black bean burritos are so good that you'll want to have them every night!", recipeInfo: "Turn your kitchen into a restaurant with these homemade black bean burritos!", recipeSteps: "1. Gather all ingredients. Preheat the oven to 350 degrees F (175 degrees C). Wrap tortillas in foil.\n\n2. Bake wrapped tortillas in the preheated oven until heated through, about 15 minutes.\n\n3. Meanwhile, heat oil in a 10-inch skillet over medium heat. Add onion, bell pepper, garlic, and jalapeño; cook and stir for 2 minutes.\n\n4. Stir in beans and cook until heated through, about 3 minutes. Stir in cream cheese and salt; cook, stirring occasionally, for 2 minutes. Stir in cilantro.\n\n5. Spoon filling in a line across the middle of each tortilla. Fold opposing edges of the tortilla to overlap the filling. Roll 1 of the opposing edges around the filling creating a burrito. Serve immediately.", recipeIngredients: "2", recipeMacros: ["25", "692","36g","70g","21g","2"]),
  Recipe(name: 'Brocoli Salad', filter: 'Healthy', recipeImage: 'brocoli.png', recipeDesc: "You might want to double this recipe for a party or potluck — it goes quick!", recipeInfo: "This homemade broccoli salad uses a tasty combination of fresh broccoli, cranberries, nuts, and bacon tossed in a rich and creamy dressing", recipeSteps: "1. Gather all ingredients.\n\n2. Place bacon in a deep skillet and cook over medium-high heat until evenly brown, 7 to 10 minutes; drain, cool, and crumble.\n\n3. Combine bacon, broccoli, onion, raisins, and almonds together in a bowl; mix well.\n\n4. To prepare the dressing: Mix mayonnaise, sugar, and vinegar together until smooth.\n\n5. Stir into the salad and let chill before serving, if desired.", recipeIngredients: "3", recipeMacros: ["25", "374","27g","29g","7g", "8"]),
  Recipe(name: 'Baked French Toast', filter: 'Breakfast', recipeImage: 'french.png', recipeDesc: "This baked French toast recipe is as easy to make as it is to eat!", recipeInfo: "Baked French Toast is always a hit. You may sprinkle the top with pecans if you wish.", recipeSteps: "1. Butter a 9x13-inch baking dish; arrange slices of bread on the bottom\n\n2. Beat eggs, milk, cream, vanilla, and cinnamon together in a large bowl. Pour over bread slices, cover, and refrigerate overnight.\n\n3. The next morning, preheat the oven to 350 degrees F (175 degrees C). Meanwhile, combine butter, brown sugar, and corn syrup together in a small saucepan; heat until bubbling.\n\n4. Pour over bread and egg mixture.\n\n5. Bake in preheated oven, uncovered, for 40 minutes.\n\n6. Serve with berries and syrup.", recipeIngredients: "3", recipeMacros: ["60+", "395","20g","44g","11g", "12"]),
];