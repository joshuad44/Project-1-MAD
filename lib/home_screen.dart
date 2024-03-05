import 'package:flutter/material.dart';
import 'recipe_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Featured recipe section (centered)
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Text(
                'Featured Recipe',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
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
