import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:project_1/meal_planning_screen.dart';
import 'recipe_screen.dart';
import 'settings_screen.dart';
import 'grocery_list_screen.dart';
import 'package:project_1/model/recipe.dart';
import 'package:project_1/recipe_screen_details.dart';

List<Recipe> featuredRecipes = [
  //breakfasts
  recipeList[15], recipeList[16], recipeList[3], 
  //lunches
  recipeList[4], recipeList[5], recipeList[6], 
  //dinners
  recipeList[9], recipeList[10], recipeList[11], 
  //snacks
  recipeList[17], recipeList[18], recipeList[19]
];
=======
import 'recipe_screen.dart';
import 'settings_screen.dart';
import 'grocery_list_screen.dart'; // Import the GroceryListScreen
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
=======
      appBar: AppBar(
        title: Text('Home'),
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: _buildRecipeCategory(
                    context,
<<<<<<< HEAD
                    'Featured Breakfasts',
                    [
                      featuredRecipes[0],
                      featuredRecipes[1],
                      featuredRecipes[2],
=======
                    'Breakfast',
                    [
                      'Pancakes',
                      'Omelette',
                      'Granola Bowl',
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
                    ],
                  ),
                ),
                Expanded(
                  child: _buildRecipeCategory(
                    context,
<<<<<<< HEAD
                    'Featured Lunches',
                    [
                      featuredRecipes[3],
                      featuredRecipes[4],
                      featuredRecipes[5],
=======
                    'Lunch',
                    [
                      'Caesar Salad',
                      'Sandwich',
                      'Soup',
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: _buildRecipeCategory(
                    context,
<<<<<<< HEAD
                    'Featured Dinners',
                    [
                      featuredRecipes[6],
                      featuredRecipes[7],
                      featuredRecipes[8],
=======
                    'Dinner',
                    [
                      'Spaghetti Bolognese',
                      'Roast Chicken',
                      'Vegetable Stir-Fry',
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
                    ],
                  ),
                ),
                Expanded(
                  child: _buildRecipeCategory(
                    context,
<<<<<<< HEAD
                    'Featured Snacks',
                    [
                      featuredRecipes[9],
                      featuredRecipes[10],
                      featuredRecipes[11],
=======
                    'Snacks',
                    [
                      'Fruit Salad',
                      'Popcorn',
                      'Hummus with Veggie Sticks',
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
<<<<<<< HEAD
            height: 20.0,
          ), // Add space between categories and bottom navigation
          // Bottom navigation section
          Container(
            color: Color(0xff18181A),
=======
              height:
                  20.0), // Add space between categories and bottom navigation
          // Bottom navigation section
          Container(
            color: Colors.blue,
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomNavItem(Icons.restaurant_menu, 'Recipes', context),
<<<<<<< HEAD
                _buildBottomNavItem(Icons.calendar_today, 'Meal Planning', context),
                _buildBottomNavItem(Icons.shopping_cart, 'Grocery List', context),
=======
                _buildBottomNavItem(
                    Icons.calendar_today, 'Meal Planning', context),
                _buildBottomNavItem(
                    Icons.shopping_cart, 'Grocery List', context),
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
                _buildBottomNavItem(Icons.settings, 'Settings', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCategory(
<<<<<<< HEAD
    BuildContext context,
    String category,
    List<Recipe> recipes,
  ) {
=======
      BuildContext context, String category, List<String> recipes) {
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            category,
<<<<<<< HEAD
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          SizedBox(height: 10.0), // Spacer
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: recipes.map((recipe) {
                return _buildRecipeCard(context, recipe);
              }).toList(),
            ), 
=======
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0), // Spacer
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: recipes.map((recipe) {
              return _buildRecipeCard(context, recipe, RecipeScreen());
            }).toList(),
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(
<<<<<<< HEAD
    BuildContext context,
    Recipe recipe,
  ) {
    return Card(
      color: Color(0xff18181A),
=======
      BuildContext context, String recipeName, Widget route) {
    return Card(
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
      elevation: 3.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
<<<<<<< HEAD
            context,
            MaterialPageRoute(builder: (context) {
              return RecipeDetailScreen(
                image: 'assets/${recipe.recipeImage}',
                name: recipe.name,
                about: recipe.recipeInfo,
                ingredients: recipe.recipeIngredients,
                steps: recipe.recipeSteps,
                macros: recipe.recipeMacros,
              );
            }),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.asset('assets/${recipe.recipeImage}', height: 150.0, width: 150.0),
              Text(
                recipe.name,
                style: TextStyle(fontSize: 16.0, color: Colors.yellow[200]),
                textAlign: TextAlign.center,
              ),
            ],
=======
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            recipeName,
            style: TextStyle(fontSize: 16.0),
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
<<<<<<< HEAD
    IconData icon,
    String label,
    BuildContext context,
  ) {
=======
      IconData icon, String label, BuildContext context) {
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
<<<<<<< HEAD
          icon: Icon(icon, size: 30.0, color: Colors.yellow[200]),
          onPressed: () {
            if (label == 'Recipes') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeScreen()));
            } else if (label == 'Grocery List') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryListScreen()));
            } else if (label == 'Settings') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            } else if (label == 'Meal Planning') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MealPlanningScreen()));
=======
          icon: Icon(icon, size: 30.0),
          onPressed: () {
            if (label == 'Recipes') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecipeScreen()));
            } else if (label == 'Grocery List') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GroceryListScreen()));
            } else if (label == 'Settings') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            } else {
              // Implement navigation logic for other screens
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
            }
          },
        ),
        Text(
          label,
<<<<<<< HEAD
          style: TextStyle(fontSize: 12.0, color: Colors.yellow[200]),
=======
          style: TextStyle(fontSize: 12.0),
>>>>>>> 14639f36a7f8c635af9b16d9e2d5c72b62c8667a
        ),
      ],
    );
  }
}
