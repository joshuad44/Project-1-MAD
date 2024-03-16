import 'package:flutter/material.dart';
import 'recipe_screen.dart';
import 'settings_screen.dart';
import 'grocery_list_screen.dart'; // Import the GroceryListScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
                    'Breakfast',
                    [
                      'Pancakes',
                      'Omelette',
                      'Granola Bowl',
                    ],
                  ),
                ),
                Expanded(
                  child: _buildRecipeCategory(
                    context,
                    'Lunch',
                    [
                      'Caesar Salad',
                      'Sandwich',
                      'Soup',
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
                    'Dinner',
                    [
                      'Spaghetti Bolognese',
                      'Roast Chicken',
                      'Vegetable Stir-Fry',
                    ],
                  ),
                ),
                Expanded(
                  child: _buildRecipeCategory(
                    context,
                    'Snacks',
                    [
                      'Fruit Salad',
                      'Popcorn',
                      'Hummus with Veggie Sticks',
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height:
                  20.0), // Add space between categories and bottom navigation
          // Bottom navigation section
          Container(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomNavItem(Icons.restaurant_menu, 'Recipes', context),
                _buildBottomNavItem(
                    Icons.calendar_today, 'Meal Planning', context),
                _buildBottomNavItem(
                    Icons.shopping_cart, 'Grocery List', context),
                _buildBottomNavItem(Icons.settings, 'Settings', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCategory(
      BuildContext context, String category, List<String> recipes) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            category,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0), // Spacer
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: recipes.map((recipe) {
              return _buildRecipeCard(context, recipe, RecipeScreen());
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(
      BuildContext context, String recipeName, Widget route) {
    return Card(
      elevation: 3.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            recipeName,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
      IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
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
            }
          },
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
