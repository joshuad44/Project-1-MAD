import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isGlutenFree = false;
  int _mealCount = 3; // Default meal count
  int _caloriesPerDay = 2000; // Default calories per day

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dietary Preferences',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Vegetarian'),
              value: _isVegetarian,
              onChanged: (newValue) {
                setState(() {
                  _isVegetarian = newValue;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vegan'),
              value: _isVegan,
              onChanged: (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              },
            ),
            SwitchListTile(
              title: Text('Gluten Free'),
              value: _isGlutenFree,
              onChanged: (newValue) {
                setState(() {
                  _isGlutenFree = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Number of Meals per Day',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _mealCount.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: _mealCount.toString(),
              onChanged: (newValue) {
                setState(() {
                  _mealCount = newValue.round();
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Calories per Day: $_caloriesPerDay',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _caloriesPerDay.toDouble(),
              min: 1000,
              max: 5000,
              divisions: 40,
              label: _caloriesPerDay.toString(),
              onChanged: (newValue) {
                setState(() {
                  _caloriesPerDay = newValue.round();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
